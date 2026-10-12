---
name: write-as-you
description: >
  Write in the owner's own voice — emails, notes, posts, replies — from samples they provide.
  Use on '/write-as-you', 'write this as me', 'in my voice', 'sound like me', or when drafting
  anything the owner will send under their own name. First run interviews the owner and builds
  the voice card; every later run reads it.
allowed-tools: [Read, Write, Edit, Glob, Grep]
---

# Write as you

This skill ships **empty**. Your voice is not in it yet. The first run builds it; after that it
reads `Skills/write-as-you/voice/` and writes like you.

## First run — build the voice card

If `voice/card.md` does not exist, do this before writing anything:

1. Ask for samples. "Paste 5–10 things you wrote that sound like you — texts, emails, a post.
   Short is fine. The ones you didn't overthink are the best ones." Save each to
   `voice/samples/<n>.md` verbatim.
2. Interview in rounds until nothing is assumed. Ask the whole frontier at once, number each
   question, give your recommended answer, wait. Questions that earn their place: how formal by
   default; how you open and close a message; words and phrases you use a lot; words you never
   use; sentence length; how you disagree; how you say thanks; emoji or not; what annoys you when
   other people write. Facts about your writing are the agent's job (read the samples); decisions
   are yours.
3. Write `voice/card.md`: 15–30 lines. Register, rhythm, openers, closers, always-words,
   never-words, three verbatim lines from the samples that are the most "you". Nothing generic.
4. Read the card back in one paragraph and ask "is that you?" Fix until yes.

## Every run after

1. Read `voice/card.md` and skim two samples.
2. Draft. Short paragraphs. The owner's words, not the model's.
3. Self-check against the never-words and the closers. Cut anything that reads produced.
4. Show the draft. Do not send anything — sending is the owner's move.

## What this file is not

Not a style guide for other people. One owner, one voice. If someone else needs one, they run
this skill in their own brain.
