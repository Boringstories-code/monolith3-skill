---
name: second-brain-query
description: >
  Answer a question against the wiki — search the WIKI (not raw sources), synthesise with
  citations to wiki pages, and optionally file the answer back as a new page. Use on
  '/second-brain-query', '/query', '/q', 'ask the wiki', 'what do I know about X',
  'what did we decide about Y'. Read-only on raw/, write-isolated to 00-OS/wiki/.
allowed-tools: [Read, Glob, Grep, Write]
---

# Second brain — query

The front door to everything you've captured. `/q <question>`.

## Flags

| Flag | Effect |
|---|---|
| `--domain <slug>` | Restrict to one wiki domain |
| `--depth shallow\|standard\|deep` | How far to walk the link graph (1 / 2–3 / exhaustive hops) |
| `--file-back` | Save the answer as a synthesis page |

Default: `--depth standard`, no file-back.

## Hard boundaries

- Search `00-OS/wiki/`. **Do not read `00-OS/raw/`** — raw is unprocessed and un-deduplicated;
  reading it directly is how you end up quoting something the wiki already corrected.
- Never edit an existing wiki page. File-back creates a new page in `_synthesis/` only.
- Never read `People/` to answer a question that will be shown to anyone but the owner.

## Search order

1. **Guess the slug.** `00-OS/wiki/<domain>/<kebab-of-the-thing>.md`. Cheapest hit.
2. **Scan the hubs.** The domain `_index.md` files list their pages.
3. **Walk the graph.** Follow `relates-to` and inline wikilinks out from whatever you found,
   within the depth budget.
4. **Full-text fallback.** `grep -ril <term> 00-OS/wiki/` for the terms (`rg -i` if ripgrep is
   installed — same result, faster). Use this when the first
   three came back thin — not instead of them.

## Answering

- **Cite every factual claim** with the `[[wikilink]]` it came from. An uncited sentence is
  the model talking, and the reader can't tell unless you mark it.
- **Surface contradictions, don't resolve them.** If two pages disagree, say so and give both
  with their sources.
- **Say when you have nothing.** "That isn't in the brain yet" is a real, useful answer —
  it tells the owner what to go capture. Never fill the gap from model memory and let it read
  like vault knowledge. If you do add outside context, label it: *(not from the vault)*.
- **Name the stubs you hit.** A linked page that doesn't exist is part of the answer: it's
  the thing they meant to write down and didn't.

## Output formats

Default is prose with citations. Also reasonable, when the question asks for it: a comparison
table, a ranked list, a timeline. Match the shape of the question.

## File-back

With `--file-back`, write the answer to
`00-OS/wiki/<domain>/_synthesis/<question-slug>.md`:

```markdown
---
title: <The question, as a statement>
type: synthesis
domain: <domain>
source-pages: ["[[page-a]]", "[[page-b]]"]
generated-by: second-brain-query
created: YYYY-MM-DD
tags: [<domain>, synthesis]
---
```

Then add it to the domain `_index.md`. A synthesis page is a cached answer — it goes stale,
so it carries its source pages and its date so a reader can tell.
