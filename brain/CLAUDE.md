# CLAUDE.md

**Read `AGENTS.md` in this same folder first — it is the canonical contract for this vault.** Everything in it applies to Claude Code sessions unchanged.

Claude-specific notes only, below.

## Skills

Skills live in `Skills/`, once. `scripts/wire-runtimes.sh` makes `.claude/skills` point at that folder, so Claude Code finds all twelve whenever it runs with the vault as the working directory. If they don't show up, run that script and read what it prints. Nothing gets installed into your home folder.

Keep the always-on set small. Anything beyond the twelve stays reachable by explicit path or through `Skills/SKILL-ATLAS.md`.

## Subagents

This vault ships none, and it doesn't need any. If you add one later, put it in `.claude/agents/` so it travels with the vault. Claude Code can't register a new subagent mid-session — after adding one, start a fresh session.

Always set `model` explicitly when spawning an ad-hoc agent. See "Model tiers" in `AGENTS.md`.

## Connectors

Claude Code may have connectors Grok doesn't (email, calendar, drive, design tools). Anything that depends on one is Claude-only — don't write a skill that assumes it without saying so in the skill's description.

## Web search

Claude has its own search and fetch. Follow the three-rung ladder in `AGENTS.md`.
