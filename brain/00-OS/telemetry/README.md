---
title: Telemetry
type: reference
created: 2026-01-01
source: brain-starter
tags: [telemetry]
---

# Telemetry

Append-only counts. Entirely optional — useful once enough is running that you can't hold it
in your head.

Worth tracking, if anything:

- `refusals.csv` — `date,skill,what-it-refused,what-you-did-next`. A rule that gets overridden
  every time is a wrong rule, and this is how you find out.
- `ingest.csv` — `date,domain,pages` — whether the wiki is actually growing.

Don't start here. Start by using the thing.
