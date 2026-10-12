---
title: Folder map
type: reference
created: 2026-01-01
source: brain-starter
tags: [runtime, structure]
---

# Folder map

The full tree, and the one-line rule for each. Read when deciding where something goes.

```
brain/
├── 00-OS/            The machinery (see 00-OS/README.md)
│   ├── wiki/         Knowledge layer — atomic linked pages, what /q reads
│   ├── raw/          Source material awaiting ingest — read-only to the agent
│   ├── runtime/      How the system loads, the folder map, the voice card
│   ├── decisions/    Why things are the way they are
│   ├── creds/        Credential INDEX. Names and locations. Never values.
│   ├── learnings/    What works, what doesn't, per recurring job
│   └── telemetry/    Append-only counts. Optional.
├── Apps/             Things you built — the thinking, not the code
├── Archive/          Cold storage. Not loaded, not indexed, not deleted.
├── Books/            One note per book: what changed because you read it
├── brainstorms/      Thinking out loud, before it's a plan
├── Contracts/        Signed agreements + a short note on each
├── Diagrams/         One folder per diagram: matching .png and .md
├── docs/             Reference docs you didn't write
├── drawers/          Empty. Where a topic pack goes if you ever have three skills on one subject
├── images/           Screenshots and visual assets notes point at
├── Inbox/            Unfiled. The pressure valve. Not a failure state.
├── Life/             Identity layer: beliefs, values, what you keep relearning
├── logs/             Machine output. Disposable.
├── meetings/         One note per meeting: what was said, what you now owe
├── Notes/            General notes that aren't any of the above
├── People/           PRIVATE dossiers. Shapes tone, never content. Personal brains only.
├── Personal/         Your life admin: home, family, travel, appointments
├── Projects/         One folder per project or client + REGISTRY.json
├── Research/         Deep dives, with their sources attached
├── scripts/          Sync and maintenance scripts
├── Skills/           Procedures the agent runs + SKILL-ATLAS.md
├── Tools/            Small programs you built for yourself
├── .grok/            Rules that drive the agent, plus the link that lets it find Skills/
├── AGENTS.md         The always-on contract. Canonical.
├── CLAUDE.md         Pointer to AGENTS.md + Claude-specific notes
└── README.md         Start here
```

## Deciding where something goes

Ask in this order, stop at the first yes:

1. Does it belong to a project in `Projects/REGISTRY.json`? → that project's `inbox/`
2. Is it source material you want the brain to *know*? → `00-OS/raw/<domain>/`
3. Is it about a specific human, privately? → `People/<name>.md`, if this vault has that folder
4. Is it a procedure that should repeat? → `Skills/`
5. Is it a decision worth remembering the reasoning for? → `00-OS/decisions/`
6. Is it personal admin? → `Personal/inbox/`
7. None of the above → `Inbox/`

Never at the vault root.

## Two folders people confuse

**`Personal/` vs `Life/`** — `Personal/` is admin: the dentist, the flights, the lease.
`Life/` is identity: what you believe, what you want, the patterns you keep repeating.

**`People/` vs wiki `people/`** — a brand or client brain has no `People/` at all, and everything about a human goes in the wiki. In a personal brain, `People/` is private and never leaves, and wiki `people/` is
public-safe: who someone is, what they've published, what their company does.
