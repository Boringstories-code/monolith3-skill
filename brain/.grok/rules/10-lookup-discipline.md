---
title: Lookup discipline — ask the wiki first
source: vault .grok/rules
---

# Lookup discipline

## Knowledge questions

Anything of the form "what do I know about X," "what did we decide about Y," "who is Z," "what were the numbers on that" goes to `/second-brain-query` (`/q`) **first**.

Not a grep. Not a search subagent. Not a full-text sweep of the vault. The wiki exists so lookups cost one read instead of twenty, and skipping it defeats the system you paid to build.

Grep is the fallback *inside* the query skill, after the wiki has been checked. It is not the opening move.

## Exact names

When looking up an entity — a person, a project, a tool, a client — match the name exactly as it's written in the vault before guessing at variants. Two entries that differ by a middle initial or a `Inc.` are two entries until proven otherwise. Merging them silently corrupts the record.

If a lookup returns nothing, say it returned nothing. Do not answer from model memory and present it as something the vault said. A missing page is real information: it means that knowledge was never captured, and the honest answer is "not in the brain yet — want me to ingest something on it?"

## Citations

Every factual claim in an answer cites the wiki page it came from, as a `[[wikilink]]`. An uncited claim is the model talking, and the reader can't tell the difference unless you mark it.

Contradictions get surfaced, not resolved. If two pages disagree, say both and say they disagree.
