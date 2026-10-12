---
title: Project structure
type: reference
created: 2026-01-01
source: brain-starter
tags: [projects, structure]
---

# Project structure

Every project gets the same skeleton, so you never have to think about where something goes
and the agent never has to guess.

```
Projects/<slug>/
  PROJECT.md          what this is, who it's for, what done looks like
  inbox/              unfiled things belonging to this project
  notes/              your working notes
  deliverables/       what you actually hand over
  assets/             files, images, source material
  archive/            finished or abandoned pieces, kept
```

Create it by copying this skeleton, then add the project to `Projects/REGISTRY.json`.

**Registering it is the part that matters.** An unregistered project folder is invisible to
routing — things addressed to it end up in `Inbox/` instead, and you file them by hand forever.

## `PROJECT.md`

```markdown
---
title: <Project name>
type: project
created: YYYY-MM-DD
source: <where it came from>
tags: [project, <client-or-domain>]
---

# <Project name>

## What it is
<Two sentences.>

## Who it's for
<Person or org. Link their People note if there is one — the link is private context,
not content.>

## What done looks like
<Specific. "A working X they can run themselves" beats "improved Y".>

## Money
<Rate, total, terms, invoice status. Or "none" if it isn't that kind of project.>

## Status
<One line, updated as you go. Where it actually stands today.>

## Next action
<The literal next thing. Update this every time you touch the project — it's the
line you'll read first when you come back cold.>

## Decisions
- **YYYY-MM-DD** — <what was decided and why>

## Open questions
```

## Conventions

- `slug` is kebab-case and never changes. The display name can change; the slug is the
  identifier links point at.
- No dates in folder or file names.
- When a project ends, set its status in the registry and move the folder to `Archive/`.
  Leave the registry entry — that's the record it happened.
- Anything you'd want to answer questions about later (a decision, a lesson, a spec) gets
  ingested into the wiki. Project folders store; the wiki answers.
