#!/bin/sh
# wire-runtimes.sh — point each agent at the one copy of the skills.
#
# Skills live in exactly one place: Skills/. This makes the three places the
# agents look for them. Safe to run any number of times.
#
#   ./scripts/wire-runtimes.sh
#
# Claude Code reads .claude/skills/ and Grok reads .grok/skills/ — one link to
# the whole folder suits both. Codex is per-skill on purpose: it keeps its own
# built-in skills in ~/.codex/skills/.system, so replacing that directory would
# hide them.
#
# None of these links ship in the zip. A link inside a zip is what some unzip
# tools quietly turn into a drifting copy, so they get made here instead.

cd "$(dirname "$0")/.." || exit 1

[ -d Skills ] || { echo "no Skills/ folder here — run this from inside the brain"; exit 1; }

# Make one link, whatever is in the way.
#
# `ln -sfn` replaces a symlink but NOT a real directory — given one, it drops the
# new link *inside* it and exits 0, which is how a brain ends up looking wired
# while resolving nothing. Real directories turn up here for ordinary reasons:
# an unzip tool that flattened a link, or a sync client (Dropbox, iCloud, Drive)
# materializing one as a folder copy on a second machine. So a real directory
# gets moved aside, never deleted — it may hold something you put there.
link() {
  target="$1"; path="$2"
  if [ -L "$path" ]; then
    rm -f "$path"
  elif [ -e "$path" ]; then
    aside="$path.replaced-$(date +%Y%m%d-%H%M%S)"
    mv "$path" "$aside"
    echo "moved the old $path aside to $aside"
  fi
  ln -s "$target" "$path"
}

mkdir -p .claude .grok .codex/skills
link ../Skills .claude/skills
link ../Skills .grok/skills

# A link whose skill is gone would haunt Codex, so clear those first.
for dead in .codex/skills/*; do
  [ -L "$dead" ] && [ ! -e "$dead" ] && rm -f "$dead"
done
for skill in Skills/*/; do
  name=$(basename "$skill")
  link "../../Skills/$name" ".codex/skills/$name"
done

# Count what the agents can actually reach, not what's in Skills/. Counting the
# source is how the first version of this script reported success over a loop.
want=$(find -L Skills -name SKILL.md 2>/dev/null | wc -l | tr -d ' ')
fail=0
for d in .claude/skills .grok/skills .codex/skills; do
  got=$(find -L "$d" -name SKILL.md 2>/dev/null | wc -l | tr -d ' ')
  [ "$got" = "$want" ] || { echo "  FAIL  $d reaches $got skills, expected $want"; fail=1; }
done

if [ "$fail" -eq 0 ]; then
  echo "wired $want skills for Claude, Grok and Codex"
  echo "Codex reads them when you open it in this folder. To reach them from anywhere,"
  echo "link each one into ~/.codex/skills/ — never replace that folder, it holds its own."
else
  echo ""
  echo "Something is in the way that this script won't remove. Look at the paths above."
fi
exit $fail
