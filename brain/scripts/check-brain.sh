#!/bin/sh
# check-brain.sh — is this brain actually finished and wired up?
# Run it from anywhere. No arguments, nothing installed, nothing written.

cd "$(dirname "$0")/.." || exit 1
fail=0
say() { printf '%s\n' "$*"; }
bad() { printf '  FAIL  %s\n' "$*"; fail=1; }
ok()  { printf '  ok    %s\n' "$*"; }

say ""
say "Checking $(pwd)"
say ""

# 1. Placeholders left over from the template
left=$(grep -rl -e '<YOUR NAME>' -e '<vault-path>' -e '<model-id>' -e '<your stack>' \
        -e "<Your brain's name>" \
        --include='*.md' --include='*.json' --include='*.toml' . 2>/dev/null \
        | grep -v '^./Skills/' | grep -v '^./.git/')
if [ -n "$left" ]; then
  bad "placeholders still in these files:"
  printf '%s\n' "$left" | sed 's/^/          /'
else
  ok "no leftover placeholders"
fi

# 2. The interview actually ran
if [ -f 00-OS/runtime/voice.md ] && ! grep -q '<' 00-OS/runtime/voice.md 2>/dev/null; then
  ok "voice card written"
else
  bad "00-OS/runtime/voice.md is still blank — run /setup-brain"
fi

# 3. Real pages in the wiki, not just the index files
pages=$(find 00-OS/wiki -name '*.md' ! -name '_index.md' ! -name 'index.md' ! -name 'log.md' 2>/dev/null | wc -l | tr -d ' ')
if [ "$pages" -ge 2 ]; then
  ok "$pages pages in the wiki"
else
  bad "only $pages real wiki pages — the interview should leave two or three"
fi

# 4. Skills are where the agents look for them. If they aren't, wire them — this is
#    generated, so repairing it is cheaper than telling you about it.
#    A real directory where a link belongs counts as broken, not as wired: that is
#    what an unzip tool or a sync client leaves behind, and it resolves to nothing.
n=$(find -L Skills -name SKILL.md 2>/dev/null | wc -l | tr -d ' ')
wired() {
  for d in .claude/skills .grok/skills .codex/skills; do
    [ -L "$d" ] || [ -d "$d" ] || return 1
    c=$(find -L "$d" -name SKILL.md 2>/dev/null | wc -l | tr -d ' ')
    [ "$c" = "$n" ] || return 1
  done
  return 0
}
if ! wired; then
  [ -x scripts/wire-runtimes.sh ] && ./scripts/wire-runtimes.sh >/dev/null 2>&1
fi
if wired; then
  ok "$n skills, wired for Claude, Grok and Codex"
else
  bad "the skills aren't wired up — run ./scripts/wire-runtimes.sh and read what it prints"
fi

# 5. Version control, and whether anything is backed up
if [ -d .git ]; then
  if git remote 2>/dev/null | grep -q .; then
    ok "version control with a remote (check that it's private)"
  else
    say "  note  version control is on, no remote — nothing is backed up yet"
  fi
else
  bad "not under version control yet — the setup step for that didn't finish"
fi

# 6. Shared brains must not carry private dossiers
if [ -f SHARING.md ]; then
  if [ -d People ]; then
    bad "this is a shared brain (SHARING.md) but People/ still exists — private notes about"
    bad "humans do not belong in a folder someone else can open. Move them to your own brain."
  else
    ok "shared brain, no private People/ folder"
  fi
  stale=$(grep -rl 'People/' --include='*.md' --include='*.json' . 2>/dev/null \
          | grep -v '^./Skills/' | grep -v '^./.git/' | grep -v '^./.grok/rules/')
  if [ -n "$stale" ]; then
    say "  note  these still mention a People/ folder this vault doesn't have:"
    printf '%s\n' "$stale" | sed 's/^/          /'
  fi
  if [ -f HANDOVER.md ]; then
    ok "handover notes written"
  else
    say "  note  no HANDOVER.md — fine if you own this, needed if a client does"
  fi
fi

# 7. Nothing was installed outside the vault
if [ -L "$HOME/.grok/rules" ] || [ -L "$HOME/.grok/hooks" ]; then
  bad "something linked this vault into ~/.grok — not needed, and it can break your other projects"
else
  ok "nothing installed outside this folder"
fi

say ""
if [ "$fail" -eq 0 ]; then
  say "Wired up correctly. Ask it something: /q what do I do for work"
  if [ "$pages" -lt 5 ]; then
    say ""
    say "  Worth knowing: $pages pages is a start, not a working brain. It can answer"
    say "  questions about what you told it during setup, and nothing else yet. That"
    say "  changes the first time you put something real in and run /ingest."
  fi
else
  say "Fix the FAIL lines above, then run this again."
fi
say ""
exit $fail
