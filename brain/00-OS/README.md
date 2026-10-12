---
title: 00-OS — the operating system layer
type: reference
created: 2026-01-01
source: brain-starter
tags: [os, orientation]
---

# 00-OS

This folder is **meta**. It doesn't hold your content — it holds the machinery that serves
your content. The `00-` prefix keeps it at the top of the sidebar.

| Folder | What |
|---|---|
| `wiki/` | The knowledge layer. Atomic, linked pages. This is what `/q` reads. |
| `raw/` | Source material waiting to be ingested. Never edited, only read. |
| `runtime/` | Operational reference: how loading works, the folder map, the voice card |
| `decisions/` | Durable decision records. Why things are the way they are. |
| `creds/` | An **index** of credentials. Names and locations only — never values. |
| `learnings/` | What's working and what isn't, per recurring job |
| `telemetry/` | Append-only counts. Optional; useful once you're running a lot. |

## The two-layer idea

`raw/` and `wiki/` are the whole system in miniature.

You collect messily into `raw/` — no filing, no cleanup, no decisions. Ingest turns that into
`wiki/` — atomic, deduplicated, linked, citable. You ask questions of `wiki/`.

The split exists because the shape that's easy to *collect* and the shape that's easy to
*retrieve* are different shapes, and trying to make one folder do both is why most note
systems die.

## Rules

- Ingest writes only into `wiki/`. Nothing else in the vault is touched by it.
- `/q` reads only `wiki/`, never `raw/`.
- No secret value is ever written anywhere under this folder, `creds/` least of all.
- Nothing in `People/` crosses into `wiki/`. (Personal brains only. A brand or client brain has no `People/`.)
