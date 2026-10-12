---
name: wiki-lint
description: >
  Health check the wiki — broken links, orphan pages, stale synthesis, domains drifting out
  of shape, pages that were never finished. Use on '/wiki-lint', 'check the wiki', 'is my
  brain healthy', 'find broken links', or on a schedule (weekly is plenty).
allowed-tools: [Read, Glob, Grep, Bash]
---

# Wiki lint

A wiki rots quietly. Nothing errors; it just gets less trustworthy until one day an answer is
wrong and nobody knows when it went wrong. This is the check.

Read-only. Report; never auto-fix. Half these findings are judgement calls, and a linter that
silently "fixes" a real contradiction has destroyed the most valuable thing in the file.

## What to check

**Broken links.** Every `[[wikilink]]` whose target doesn't exist.

Important: a stub link is **not** a bug. It's a deliberate marker of a known gap. Report the
two groups separately — links that look like typos (near-match to an existing page) versus
links that are genuinely un-written pages.

**Orphans.** Pages nothing links to. Either they need wiring into a hub, or they were a bad
idea. Both are worth knowing.

**Hub drift.** Pages that exist in a domain folder but aren't listed in its `_index.md`, and
rows in `_index.md` pointing at nothing.

**Unfinished pages.** Pages that are still all `_None yet._`, or under ~50 words. Usually an
ingest that ran thin.

**Stale synthesis.** Pages in `_synthesis/` older than ~6 months, or whose `source-pages` have
changed since. A cached answer whose sources moved is the most dangerous page in the wiki.

**Contradictions.** Every `## Contradictions` section, listed. These are the highest-value
findings — someone should resolve them with real information.

**Frontmatter.** Missing `title`, `type`, `domain`, or `created`. Invented `type` values.

**Log gaps.** Files in `00-OS/raw/` that never appear in `00-OS/wiki/log.md` — material that
was collected and never digested.

## Useful commands

```sh
# every wikilink target used
grep -roh '\[\[[^]|]*' 00-OS/wiki --include='*.md' | sed 's/^\[\[//' | sort -u

# every page that exists
find 00-OS/wiki -name '*.md' | sed 's|.*/||; s|\.md$||' | sort -u

# pages with no inbound links
find 00-OS/wiki -name '*.md'
```

## Output

Ranked by what actually costs something: contradictions first, then stale synthesis, then
typo-looking broken links, then everything else. For each, the fix in one line.

End with one number: how many raw files are sitting un-ingested. That single figure predicts
wiki health better than everything above it.
