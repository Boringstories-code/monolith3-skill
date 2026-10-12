---
title: Writing standard — no AI slop
source: vault .grok/rules
---

# Writing standard

Anything an outside reader will see passes the `humanizer` skill **before** it ships. Emails and email drafts, website copy, proposals, decks, social posts, attachments, any document that leaves your hands.

Draft with these patterns in mind from the first word. Cleaning up after is slower and the result reads cleaned-up.

## Scope

Applies to interactive sessions, headless runs, scheduled jobs, and subagents producing outward-facing text. Internal notes are exempt — but anything that *could* end up in front of someone else counts as outward-facing.

## What to catch

- Em-dash overuse
- ALL-CAPS or "produced"-sounding section headers
- Rule-of-three pile-ups (three adjectives, three clauses, three bullets, over and over)
- "-ing" tack-on clauses gluing a second thought to the end of every sentence
- Generic upbeat closers ("Excited to see where this goes!")
- Copula avoidance — "serves as" where you mean "is"
- Inflated significance: calling a small thing pivotal
- Tidy uniform rhythm. Real writing has short sentences next to long ones.

## What to replace it with

The owner's actual voice. If you don't have a voice card yet, write one: five lines they'd actually say, five they never would. Put it at `00-OS/runtime/voice.md` and read it before drafting.

Default posture until then: terse, direct, warm, dry. Short paragraphs. Say the thing.
