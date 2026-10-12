---
title: Ingest Log
type: reference
created: 2026-01-01
source: brain-starter
tags: [wiki, log]
---

# Ingest log

Append-only. One line per ingest run, newest at the bottom. `/second-brain-ingest` writes
these — you don't.

Format:

```
YYYY-MM-DD | <domain> | <source file> | <n> pages created, <n> merged | <note>
```

Why it exists: when a wiki page says something surprising, this is how you find out which
source put it there and when. Provenance you can walk backwards.

---

_No ingests yet. Drop a file in `00-OS/raw/<domain>/` and run `/second-brain-ingest`._
