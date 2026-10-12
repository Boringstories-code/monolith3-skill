---
title: On-demand loading
type: reference
created: 2026-01-01
source: brain-starter
tags: [runtime, context]
---

# On-demand loading

The mechanism that keeps the always-on instructions small.

## The problem

Every session pays for its always-on context before it does any work. A 900-line instruction
file means every session — including "what's that guy's email" — starts by reading 900 lines
and starts slightly dumber for it.

But the detail has to live somewhere. Deleting it means the agent gets things wrong.

## The mechanism

1. Session start loads only `AGENTS.md` (slim, and kept slim on purpose) plus
   `.grok/rules/00-os.md`.
2. Those two files carry a **load table**: a row per situation, pointing at the file with the
   detail.
3. When the work matches a row, that file is read **once**. Not preloaded, not at session
   start, not "just in case."
4. Where a skill already covers the job, the skill wins over re-reading a long doc.

That's it. The table is the whole design.

## Why it works

Most sessions touch one or two of these areas. Paying for the detail of all twenty on every
session costs you on every session and buys you something on almost none.

## Writing a good row

| Bad | Good |
|---|---|
| `Brand stuff` → `brand.md` | `Picking fonts or colors for anything` → `brand-kit.md` |
| `Sync` → `SYNC.md` | `Backing it up, or setting up a second machine` → `scripts/optional/SYNC.md` |

The trigger has to match how the situation feels from inside the work. A row whose trigger is
a category name won't fire, because nobody thinks "ah, this is a brand-stuff situation."

## Keeping it honest

- A file referenced by no row is dead weight. Either give it a trigger or delete it.
- A file read in almost every session belongs in `AGENTS.md` instead.
- When `AGENTS.md` grows past roughly 200 lines, something in it should be a row here.
