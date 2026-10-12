#!/usr/bin/env bash
# sync-brain.sh — the one git sync engine. Called by the background jobs; safe by hand too.
#
#   ./scripts/optional/sync-brain.sh            full pass: pull, commit, push
#   ./scripts/optional/sync-brain.sh --fast     commit + push only (what the file watcher runs)
#   ./scripts/optional/sync-brain.sh --pull     pull only (what the poller runs)
#   ./scripts/optional/sync-brain.sh --status   what's going on
set -uo pipefail

VAULT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$VAULT" || exit 1

BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo main)"
LOG="$VAULT/logs/sync.log"
mkdir -p "$VAULT/logs"

log() { printf '%s %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*" >>"$LOG"; }

# Only one sync at a time. Without this the watcher and the hourly job interleave
# and produce commits containing half of each other's staging.
LOCK="$VAULT/.git/brain-sync.lock"
exec 9>"$LOCK"
if ! flock -n 9 2>/dev/null; then
  # macOS has no flock(1) by default; fall back to a pid file.
  if [[ -f "$LOCK.pid" ]] && kill -0 "$(cat "$LOCK.pid" 2>/dev/null)" 2>/dev/null; then
    log "another sync is running, skipping"
    exit 0
  fi
  echo $$ >"$LOCK.pid"
  trap 'rm -f "$LOCK.pid"' EXIT
fi

has_changes() { [[ -n "$(git status --porcelain)" ]]; }

in_conflict() {
  git ls-files -u | grep -q . 2>/dev/null
}

do_pull() {
  git fetch --quiet origin "$BRANCH" 2>>"$LOG" || { log "fetch failed"; return 1; }
  local local_sha remote_sha
  local_sha="$(git rev-parse HEAD)"
  remote_sha="$(git rev-parse "origin/$BRANCH" 2>/dev/null || echo "$local_sha")"
  [[ "$local_sha" == "$remote_sha" ]] && return 0
  if has_changes; then
    # Never rebase over a dirty tree — that is how work disappears.
    log "remote moved but working tree is dirty; committing first"
    do_commit
  fi
  git pull --rebase --quiet origin "$BRANCH" 2>>"$LOG" || { log "PULL FAILED — resolve by hand"; return 1; }
  log "pulled $BRANCH"
}

do_commit() {
  has_changes || return 0
  git add -A
  local n msg
  n="$(git diff --cached --name-only | wc -l | tr -d ' ')"
  msg="Sync brain $(date '+%Y-%m-%d %H:%M') [$(hostname -s)] — $n file(s)"
  git commit --quiet -m "$msg" 2>>"$LOG" || { log "commit failed"; return 1; }
  log "committed $n file(s)"
}

do_push() {
  git rev-parse "@{u}" >/dev/null 2>&1 || { log "no upstream set; skipping push"; return 0; }
  [[ -z "$(git log "@{u}"..HEAD --oneline)" ]] && return 0
  BRAIN_SYNC=1 git push --quiet origin "$BRANCH" 2>>"$LOG" || { log "PUSH FAILED"; return 1; }
  log "pushed $BRANCH"
}

if in_conflict; then
  log "REPO IN CONFLICT — sync paused until resolved by hand"
  echo "Repo is in a conflicted state. Resolve it, then sync resumes on its own." >&2
  exit 1
fi

case "${1:---full}" in
  --fast)   do_commit; do_push ;;
  --pull)   do_pull ;;
  --status)
    echo "vault:  $VAULT"
    echo "branch: $BRANCH"
    echo "dirty:  $(git status --porcelain | wc -l | tr -d ' ') file(s)"
    echo "ahead:  $(git log @{u}..HEAD --oneline 2>/dev/null | wc -l | tr -d ' ') commit(s)"
    echo "last 5 sync log lines:"
    tail -5 "$LOG" 2>/dev/null || echo "  (no log yet)"
    ;;
  --full|*) do_pull; do_commit; do_push ;;
esac
