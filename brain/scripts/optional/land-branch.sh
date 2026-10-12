#!/usr/bin/env bash
# land-branch.sh — merge a working branch into main without racing the sync daemon.
set -euo pipefail

VAULT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$VAULT"

BRANCH="${1:-}"
[[ -z "$BRANCH" ]] && { echo "usage: land-branch.sh <branch>" >&2; exit 1; }

git rev-parse --verify "$BRANCH" >/dev/null 2>&1 || { echo "No such branch: $BRANCH" >&2; exit 1; }

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Working tree is dirty. Commit or clean it first." >&2
  exit 1
fi

echo "Pulling main..."
git checkout main
BRAIN_SYNC=1 git pull --rebase origin main

echo "Merging $BRANCH..."
git merge --no-ff "$BRANCH" -m "Land $BRANCH"

echo "Pushing..."
BRAIN_SYNC=1 git push origin main

echo "Landed. Delete the branch with:  git branch -d $BRANCH"
