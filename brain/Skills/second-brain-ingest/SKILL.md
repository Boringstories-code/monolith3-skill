---
name: second-brain-ingest
description: >
  Ingest a raw source (or a folder of sources) into the wiki. Reads the source, pulls out
  entities, concepts, and claims, then creates or MERGES atomic, densely-wikilinked pages
  under 00-OS/wiki/<domain>/. Use on '/second-brain-ingest', '/ingest', 'ingest this',
  'absorb this source', 'process what I dropped in raw'. Write-isolated to 00-OS/wiki/ —
  never edits raw sources or anything else in the vault.
allowed-tools: [Read, Write, Edit, Glob, Grep, Bash]
---

# Second brain — ingest

Turns raw material into pages that answer questions later.

## Input

A path under `00-OS/raw/`. A single file, or a folder (process every file in it).

If no path is given, list what's unprocessed: files under `00-OS/raw/` that don't appear in
`00-OS/wiki/log.md`. Ask which to take.

## Hard boundaries

- **Read** `00-OS/raw/`. Never write there, never edit, never delete. Raw stays raw.
- **Write** only under `00-OS/wiki/`. Nothing else in the vault gets touched.
- Never overwrite an existing page. Merge into it.
- Nothing from `People/` enters the wiki. The wiki is the shareable layer; `People/` is not.

## Procedure

### 1. Read the source

Read it fully. If it's long, read it in chunks — don't skim and don't summarise from the
first page.

### 2. Pick the domain

Match against the folders in `00-OS/wiki/`. The raw file's own folder is the strong hint
(`raw/craft/x.md` → `craft`), but the content wins if they disagree.

If nothing fits and the material is substantial, propose a new domain — don't force it into
a bad one. Creating a domain means: a folder, an `_index.md` from the pattern of the others,
and a row in `00-OS/wiki/index.md`.

### 3. Extract

Pull out, separately:

- **Entities** — things that exist. People, companies, tools, projects, places, products.
- **Concepts** — ideas, methods, patterns, techniques.
- **Claims** — statements the source makes. Who says it matters as much as what it says.
- **Source metadata** — what this thing is, who made it, when.

Skip anything that's true of everything. "Communication is important" is not a claim worth a
page.

### 4. Write pages

One page per entity, one per concept, at `00-OS/wiki/<domain>/<kebab-slug>.md`.

**If the page exists:** merge. Append new facts to the right section with provenance. Never
rewrite what's there. If the new source contradicts the page, add a `## Contradictions`
section and state both, with sources. Do not pick a winner — that's the reader's job, and
silently resolving it destroys the only signal that something's wrong.

**Entity template:**

```markdown
---
title: <Human Readable Name>
type: entity
domain: <domain-slug>
aliases: [<other names it goes by>]
source: <primary-raw-filename>
sources: [<source-slug>]
topics: [<tag>, <tag>]
relates-to: ["[[related-page]]"]
ingested: YYYY-MM-DD
created: YYYY-MM-DD
tags: [<domain>, entity]
---

# <Name>

## Overview
<Two or three sentences. What this is and why it's in the brain.>

## Key facts
- <fact> — [[00-OS/wiki/<domain>/_sources/<source-slug>|source]]

## Related concepts
- [[<concept-page>]]

## Open questions
_None yet._

## Sources
- [[00-OS/wiki/<domain>/_sources/<source-slug>|<Source title>]]
```

**Concept template:** same frontmatter with `type: concept`, and swap the body sections for
`## Definition`, `## How it works`, `## Examples`, `## Common pitfalls`, `## Sources`.

Keep empty sections with a literal `_None yet._` rather than deleting them. Predictable shape
beats tidy.

### 5. Write the source summary

One page at `00-OS/wiki/<domain>/_sources/<source-slug>.md`, `type: source-summary`. What the
source is, who made it, what it claims, and links to every page it fed. This is what makes
provenance walkable.

### 6. Wire the links

- Link every concept-level term on first mention.
- A link to a page that doesn't exist yet is **intentional**. Leave it. It's a visible hole in
  what you know, and it's the cheapest form of research agenda.
- Add each new page to its domain `_index.md` under `## Pages`.
- Add any question the source raised but didn't answer to `## Open questions` on the hub.

### 7. Log it

Append one line to `00-OS/wiki/log.md`:

```
YYYY-MM-DD | <domain> | <source file> | 4 pages created, 2 merged | <one-line note>
```

## Output

Report: domain, pages created, pages merged, contradictions found, new stubs created. Name
the contradictions explicitly — that's the part worth a human's attention.
