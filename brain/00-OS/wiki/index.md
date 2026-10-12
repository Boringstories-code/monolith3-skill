---
title: Wiki Index
type: reference
created: 2026-01-01
source: brain-starter
tags: [wiki, index]
---

# Wiki

The findability layer. Every page here is atomic — one entity or one concept — and densely wikilinked to its neighbours.

**You don't read this by hand.** Ask it: `/q <question>`. This page exists so the agent (and you, occasionally) can see the shape of what's known.

## Domains

| Domain | What lives here | Hub |
|---|---|---|
| Work | Your job, clients, engagements, how the money is made | [[00-OS/wiki/work/_index\|work]] |
| Craft | The skills you practise and how you do them | [[00-OS/wiki/craft/_index\|craft]] |
| Tools | Software, gear, stacks, configs | [[00-OS/wiki/tools/_index\|tools]] |
| People | Public-safe notes on people and orgs | [[00-OS/wiki/people/_index\|people]] |
| Money | Rates, contracts, costs, finances | [[00-OS/wiki/money/_index\|money]] |
| Health | Body, sleep, food, training | [[00-OS/wiki/health/_index\|health]] |
| Ideas | Half-formed things worth keeping | [[00-OS/wiki/ideas/_index\|ideas]] |
| Learning | Books, courses, talks, what they taught you | [[00-OS/wiki/learning/_index\|learning]] |

Add a domain by creating the folder and an `_index.md` from the same pattern, then adding a row here. Delete one you'll never use — an empty domain is noise, and eight is already more than most people need.

## Page types

| `type` | What it is |
|---|---|
| `entity` | A thing that exists: a person, company, tool, project, place |
| `concept` | An idea, method, or pattern |
| `source-summary` | One source digested, living in `<domain>/_sources/` |
| `synthesis` | An answer worth keeping, living in `<domain>/_synthesis/` |

## How pages get here

`00-OS/raw/<domain>/` → `/second-brain-ingest` → pages in `00-OS/wiki/<domain>/`.

Ingest never edits `raw/`, and never writes outside `00-OS/wiki/`. Existing pages get new facts appended with provenance — never overwritten. Two sources that disagree produce a `## Contradictions` section rather than a silent winner.

History of every ingest: [[00-OS/wiki/log|log]].

## Conventions

- Filenames `kebab-case.md`. No dates in filenames — dates live in frontmatter.
- Link concept-level terms on first mention.
- A link to a page that doesn't exist yet is an **intentional stub**. It's the cheapest way to see what you know you don't know. Don't avoid it.
- Empty sections keep a literal `_None yet._` instead of being deleted, so the shape of a page stays predictable.
