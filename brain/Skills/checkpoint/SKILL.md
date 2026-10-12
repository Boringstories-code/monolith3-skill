---
name: checkpoint
description: >
  Save the current task's state to a resume note so the session can be cleared and picked up
  fresh. Use on '/checkpoint', 'save and clear', 'I'm running out of context', 'context is
  full', 'reset but remember where we are', 'pick this up later'.
allowed-tools: [Read, Write, Edit, Glob, Grep, Bash]
---

# Checkpoint

A model gets measurably worse as its context fills, well before it hits the limit. The fix is
not to push through — it's to write down where you are and start clean.

Use this mid-task. For the end of a whole working session, write a fuller handoff.

## Write the note

`Inbox/resume-<task-slug>.md`. Keep it **small** — this gets read at the start of a fresh
session, and a 400-line resume note recreates the problem it was meant to solve.

```markdown
---
title: Resume — <task>
type: note
created: YYYY-MM-DD
source: checkpoint
tags: [resume]
---

## The task
<One paragraph. What we're doing and why.>

## Where we got to
<What's done. Be specific — file paths, not "made progress on the parser.">

## Next action
<The literal next thing. A command, a file, a decision.>

## Decisions already made
<So the fresh session doesn't relitigate them. This is the section that saves the most time.>

## Watch out for
<Anything discovered the hard way. Failed approaches, gotchas, the thing that looked right
and wasn't.>

## Files in play
- `path/to/file` — what's changed in it
```

## What not to put in it

- The reasoning that got you here. Conclusions only.
- Long code blocks. Point at the file.
- Anything already true in the repo. The fresh session can read.

## Then say it plainly

Tell the owner: the note is written, here's the path, now run `/clear` and start the next
session by reading it.

Don't clear anything yourself, and don't carry on working after checkpointing — that defeats
the entire point.
