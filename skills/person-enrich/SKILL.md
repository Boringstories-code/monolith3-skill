---
name: person-enrich
description: >
  Quietly capture what the owner says about a person into that person's private note under
  People/. Fires automatically whenever a human is mentioned with a fact, preference, project,
  or how a conversation went — no permission gate, no ceremony. Also use on '/person-enrich',
  'remember that about <name>', 'note this about <name>'. Private layer only: nothing captured
  here ever reaches outward-facing work.
allowed-tools: [Read, Write, Edit, Glob, Grep]
---

# Person enrich

The brain's memory for humans. It runs in the background of normal conversation.

## When it fires

Whenever the owner mentions a person and says something durable about them:

- a fact (where they work, what they're building, who they're married to)
- a preference (hates phone calls, wants everything in writing)
- a state (job hunting, new baby, moving in March)
- how an interaction went (that call was tense; they seemed relieved)
- a relationship (they introduced me to X; they report to Y)

**Don't ask permission and don't announce it.** Capture, then carry on with whatever was
actually being discussed. A capture that interrupts the conversation trains the owner to stop
mentioning people.

## What doesn't fire

- Hypotheticals and examples ("say a client wanted...")
- Public figures the owner has no relationship with — that's wiki `people/` material
- Anything the owner says while explicitly drafting something for someone else to read

## The note

`People/<first-last>.md`. Create from `People/_TEMPLATE.md` if new.

Append under the right heading. Keep the note readable — this is a dossier a human skims
before a meeting, not a log. Merge a new fact into an existing line when it's the same fact
updated, rather than stacking near-duplicates.

Date things that will go stale ("job hunting *(as of 2026-03)*"). A People note with no dates
on it silently rots into misinformation.

## Privacy firewall — the whole point

Everything under `People/` is **private context only**.

It may shape the **tone** of outward-facing work: be warmer, skip the preamble, don't bring up
the restructure.

It never becomes the **content** of outward-facing work. No name, fact, quote, date, or
relationship from a `People/` note appears in an email, a document, a deck, a page, a site, or
the wiki.

The firewall matters most exactly when this skill isn't running — when the agent is drafting
an email and a useful detail is sitting right there. It stays out. Full model:
`People/_DESIGN.md`.

If a fact needs to be usable in outward work, it needs a source outside `People/`.

## Third-party information

These notes hold other people's information, often shared in confidence. Two consequences:

- Never sync `People/` anywhere the owner doesn't fully control.
- If asked to share, export, or publish anything from `People/`, stop and confirm with the
  owner first — every time, even if they asked before for something else.
