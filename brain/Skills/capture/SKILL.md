---
name: capture
description: >
  Catch a thought, a link, a fact, or a file and put it somewhere it will be found again —
  without stopping to decide where it belongs. Use on '/capture', 'save this', 'remember
  this', 'note that', 'put this somewhere', or any time the owner is mid-thought and doesn't
  want to file something.
allowed-tools: [Read, Write, Edit, Glob, Grep]
---

# Capture

The lowest-friction door into the brain. Speed over correctness — a thought that costs a
filing decision is a thought that doesn't get written down.

## Where it goes

Decide in one pass. Don't ask unless it's genuinely ambiguous.

| What it is | Where |
|---|---|
| A fact about a person | `People/<name>.md` (use `person-enrich`) |
| Source material to digest later | `00-OS/raw/<domain>/` |
| Something about a live project | `Projects/<slug>/inbox/` |
| A personal to-do or errand | `Personal/inbox/` |
| An idea, half-formed | `Inbox/` — and say it's an idea |
| Anything else | `Inbox/` |

`Inbox/` is not a failure state. It's the correct answer whenever the right answer would cost
a conversation.

## How to write it

Keep the owner's words. A capture rewritten into neat prose loses the thing that made it
worth keeping — the specific irritation, the exact phrasing, the half-thought.

Add only: a date in frontmatter, and one line of context if the note would be meaningless in
three months ("re: the pricing conversation with the agency").

## Confirm briefly

One line: what you captured and where it went. Then get out of the way. The owner was in the
middle of something.
