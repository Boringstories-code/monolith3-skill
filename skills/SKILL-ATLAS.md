---
title: Skill Atlas
type: reference
created: 2026-01-01
source: brain-starter
tags: [skills, index]
---

# Skill atlas

Every skill in this brain. The router (`what-can-i-do`) reads this file — **an unlisted skill
is invisible.** Add a row when you add a skill.

**Lane** says how a skill loads:

- `core` — always discoverable. Keep this set small; it's what every session pays for.
- `drawer:<group>` — lives in a topic pack under `drawers/`, loads when the topic comes up. None ship with this vault; the folder is there for when you grow one.
- `disk` — on disk, reachable only by explicit path. Fine for rarely-used things.

## Core

| Skill | What it does | Lane | Invoke |
|---|---|---|---|
| [[Skills/setup-brain/SKILL\|setup-brain]] | Interviews a new owner and writes their AGENTS.md, voice card, and first wiki pages | core | `/setup-brain` |
| [[Skills/second-brain-query/SKILL\|second-brain-query]] | Answers a question from the wiki, with citations | core | `/q`, `/query` |
| [[Skills/second-brain-ingest/SKILL\|second-brain-ingest]] | Turns a raw source into atomic, linked wiki pages | core | `/ingest` |
| [[Skills/capture/SKILL\|capture]] | Catches a thought and files it without a decision | core | `/capture`, "save this" |
| [[Skills/meeting-loop/SKILL\|meeting-loop]] | Recording → transcript → note → action items, filed | core | `/meeting-loop` |
| [[Skills/person-enrich/SKILL\|person-enrich]] | Quietly records what you say about a person into `People/` | core | automatic |
| [[Skills/humanizer/SKILL\|humanizer]] | Strips AI tells, rewrites toward your voice. Runs before anything ships | core | `/humanizer` |
| [[Skills/wiki-lint/SKILL\|wiki-lint]] | Health check: broken links, orphans, stale answers, contradictions | core | `/wiki-lint` |
| [[Skills/checkpoint/SKILL\|checkpoint]] | Saves task state so the session can be cleared and resumed | core | `/checkpoint` |
| [[Skills/new-skill/SKILL\|new-skill]] | Writes a new skill, or fixes one that won't fire | core | `/new-skill` |
| [[Skills/what-can-i-do/SKILL\|what-can-i-do]] | Recommends the right skill for a task | core | `/what-can-i-do` |
| [[Skills/write-as-you/SKILL\|write-as-you]] | Drafts in the owner's voice from samples they give it. Ships empty | core | `/write-as-you` |

## Drawers

_None yet._

Make one when you have three or more skills on the same subject. A drawer is one file in
`drawers/` listing its members: `drawer-<group>.md`, a table of `Skill | What it does | When it
fires`. The agent reads the drawer first, then the one member it needs. Twelve skills is too
few to need this.

## Disk

_None yet._

---

## Adding a skill

1. Write it: `Skills/<name>/SKILL.md`. Use `/new-skill` — it knows the format.
2. Add a row above.
3. Decide the lane. Default to `drawer` or `disk`; promote to `core` only once you've reached
   for it repeatedly.

The always-on set is a budget, not a shelf. Everything in `core` is loaded into the decision
space of every session, so a skill that earns its place there has to earn it against the cost
of every other session being slightly worse.
