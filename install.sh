#!/usr/bin/env bash
# Monolith 3 Skill. Copy the twelve skills into Claude, Codex, and Grok,
# and copy the starter brain to ~/brain. A second run keeps notes already
# written. Skill folders get replaced, because those are the kit.
set -euo pipefail

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BRAIN_DIR="${BRAIN_DIR:-${HOME:-}/brain}"
CHECK=0
DO_CODEX=1
DO_GROK=1
SKILLS_ONLY=0

usage() {
  cat <<'EOF'
Usage: bash install.sh [--check] [--brain PATH] [--no-codex] [--no-grok] [--skills-only]

Copies the twelve skills into Claude, Codex, and Grok, and copies the starter
brain to ~/brain (or --brain PATH). A second run keeps notes you already wrote.
Skill folders get replaced, because those are the kit.

  --check         Print what would happen. Writes nothing.
  --brain PATH    Put the brain somewhere other than ~/brain.
  --no-codex      Skip ~/.codex/skills.
  --no-grok       Skip ~/.grok/skills.
  --skills-only   Install the skills and skip the brain. Same as --contractor.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check) CHECK=1; shift ;;
    --brain)
      if [[ $# -lt 2 || -z "${2:-}" ]]; then
        echo "Pass a path after --brain." >&2
        exit 2
      fi
      BRAIN_DIR=$2
      shift 2
      ;;
    --no-codex) DO_CODEX=0; shift ;;
    --no-grok) DO_GROK=0; shift ;;
    --skills-only|--contractor) SKILLS_ONLY=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *)
      echo "Unknown flag: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ -z "${HOME:-}" ]]; then
  echo "HOME is not set." >&2
  exit 1
fi

case "$BRAIN_DIR" in
  /|"$HOME"|"$HOME/")
    echo "Refusing to use $BRAIN_DIR as the brain. Pick a folder such as ~/brain." >&2
    exit 2
    ;;
esac

if [[ ! -d "$KIT_DIR/skills" || ! -d "$KIT_DIR/brain" ]]; then
  echo "Kit folders are missing next to install.sh." >&2
  exit 1
fi

names=()
for d in "$KIT_DIR"/skills/*/; do
  [[ -d "$d" ]] || continue
  names+=("$(basename "$d")")
done
n=${#names[@]}
if [[ "$n" -eq 0 ]]; then
  echo "No skills found in $KIT_DIR/skills." >&2
  exit 1
fi

echo "Monolith 3 Skill"

if [[ "$CHECK" -eq 1 ]]; then
  echo "would install $n skills"
  echo "  ~/.claude/skills"
  if [[ "$DO_CODEX" -eq 1 ]]; then
    echo "  ~/.codex/skills"
  fi
  if [[ "$DO_GROK" -eq 1 ]]; then
    echo "  ~/.grok/skills"
  fi
  if [[ "$SKILLS_ONLY" -eq 0 ]]; then
    echo "would copy the brain to $BRAIN_DIR (keep notes already there, replace Skills)"
  fi
  echo "check only. nothing written."
  exit 0
fi

install_one() {
  local name="$1" dest_root="$2"
  local dest="$dest_root/$name"
  local tmp="$dest_root/.${name}.installing.$$"
  mkdir -p "$dest_root"
  rm -rf "$tmp"
  cp -R "$KIT_DIR/skills/$name" "$tmp"
  rm -rf "$dest"
  mv "$tmp" "$dest"
}

copy_atlas() {
  local dest_root="$1"
  mkdir -p "$dest_root"
  cp -f "$KIT_DIR/skills/SKILL-ATLAS.md" "$dest_root/SKILL-ATLAS.md"
}

for name in "${names[@]}"; do
  install_one "$name" "$HOME/.claude/skills"
done
copy_atlas "$HOME/.claude/skills"

if [[ "$DO_CODEX" -eq 1 ]]; then
  for name in "${names[@]}"; do
    install_one "$name" "$HOME/.codex/skills"
  done
  copy_atlas "$HOME/.codex/skills"
  if [[ ! -e "$HOME/.codex/AGENTS.md" ]]; then
    mkdir -p "$HOME/.codex"
    cat > "$HOME/.codex/AGENTS.md" <<EOF
- Notes live in $BRAIN_DIR. Read its AGENTS.md first.
- Little Brain skills live in ~/.codex/skills.
EOF
  fi
fi

if [[ "$DO_GROK" -eq 1 ]]; then
  for name in "${names[@]}"; do
    install_one "$name" "$HOME/.grok/skills"
  done
  copy_atlas "$HOME/.grok/skills"
fi

if [[ "$SKILLS_ONLY" -eq 1 ]]; then
  echo "Done. Skills installed. Brain skipped."
  echo "Update later: bash update.sh"
  exit 0
fi

mkdir -p "$BRAIN_DIR"
added=0
kept=0
while IFS= read -r rel; do
  [[ -n "$rel" ]] || continue
  case "$rel" in
    ./Skills|./Skills/*) continue ;;
  esac
  src="$KIT_DIR/brain/${rel#./}"
  dst="$BRAIN_DIR/${rel#./}"
  if [[ -e "$dst" || -L "$dst" ]]; then
    kept=$((kept + 1))
    continue
  fi
  mkdir -p "$(dirname "$dst")"
  cp -p "$src" "$dst"
  added=$((added + 1))
done < <(cd "$KIT_DIR/brain" && find . -type f ! -name .DS_Store)

echo "Brain: $added added, $kept already there."

rm -rf "$BRAIN_DIR/Skills"
mkdir -p "$BRAIN_DIR/Skills"
cp -R "$KIT_DIR/skills/." "$BRAIN_DIR/Skills/"

(
  cd "$BRAIN_DIR"
  sh scripts/wire-runtimes.sh
)

echo "Done. Next: open Claude Code, Codex, or Grok in $BRAIN_DIR and say: set up my brain"
echo "Update later: bash update.sh"
