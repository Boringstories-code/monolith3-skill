# AGENTS.md — the always-on contract

This file is read at the start of every agent session in this vault. Keep it **short**. Everything heavy is on-demand, loaded only when the task calls for it (see the load table at the bottom).

> Setup: replace every `<...>` placeholder below, then delete this line.

## What this is

A personal knowledge vault and the default workspace for AI agent sessions. Treat this directory as home. It is git-backed — read freely, **don't commit unless asked**.

Owner: `<YOUR NAME>`
Runs with Grok CLI (`grok`) or Claude Code, whichever is open in this folder. See "Multiple agents" below.

## Where new files go

Decide in this order, and stop at the first match:

1. **Project-scoped?** → look up the slug in `Projects/REGISTRY.json` → `Projects/<slug>/inbox/`. Skeleton: `Projects/_shared/STRUCTURE.md`.
2. **Existing subsystem?** A skill → `Skills/`. A script or small program → `Tools/`. A decision → `00-OS/decisions/`.
3. **Personal?** → `Personal/inbox/`.
4. **Raw source material to be ingested** (transcript, article, PDF export, export dump) → `00-OS/raw/<domain>/`.
5. **Named spot given to you?** Use it.
6. **Else** → `Inbox/`. **Never scatter files at the vault root.**

Unsure? Ask.

## File conventions

- Markdown `.md`. Filenames kebab-case or Title Case. **No dates in filenames** — dates break wikilinks when things get renamed. Dates go in frontmatter.
- Frontmatter on every new note: `title`, `type` (`note|project|reference|meeting|idea|sop|skill`), `created`, `source`, `tags` (3–5 max). Don't invent new `type` values.
- One concept per file.
- `[[wikilinks]]` on first mention of any concept-level term. A dimmed link to a page that doesn't exist yet is an **intentional stub** — it surfaces a gap in what you know. Don't avoid linking because the target is missing. Do not invent file *paths* that don't exist.
- Aliases: `[[target-page|what you want it to say]]`.
- Per domain, keep a `_MOC.md` (map of content) and add a backlink to it when you create a note in that domain.

## Lookup discipline

**Knowledge question → `/second-brain-query` (`/q`) first.** Don't grep the vault and don't fan out a search agent before asking the wiki. The wiki exists so lookups are cheap; skipping it defeats the whole system.

Web search, three rungs — climb only when the answer needs it:

1. **Good enough** → the agent's native web search/fetch. A quick fact, a doc page, "does this still exist".
2. **Citable** → a research-grade search tool if you have one wired (Perplexity or similar). Default for real research questions.
3. **Deep multi-source report** → only when explicitly asked. Never escalate on your own.

## Writing standard — no AI slop

Anything an outside reader will see — email, website copy, proposal, deck, social post, anything client-facing — must be written in `<YOUR NAME>`'s voice and pass the `humanizer` skill before it ships. Draft with the patterns in mind from the first word; don't write slop and clean up after.

What to kill: em-dash pile-ups, ALL-CAPS or "produced" section headers, rule-of-three lists everywhere, "-ing" tack-on clauses, generic upbeat closers, copula avoidance ("serves as" instead of "is"), inflated significance, tidy uniform rhythm.

Internal vault notes are exempt. Anything that *could* be shown to someone else is not.

## Privacy firewall — load-bearing

`People/` holds private dossiers on real humans. Those notes may shape the **tone** of outward-facing work (how warm, how direct, what to avoid) but never its **content**. No name, fact, quote, or relationship from a `People/` note appears in any outward-facing output. Full model: `People/_DESIGN.md`.

**Never write a secret value into this vault.** Not in a note, not in a `.env` under the vault, not in a config. Credentials go to the OS keychain; the vault holds only the index at `00-OS/creds/CREDENTIALS.md` (names and locations, no values). If a task needs a key, read it at run time — don't copy it anywhere.

## Review before send

Never fire a live send — email, SMS, a post, anything that leaves the machine — until `<YOUR NAME>` has seen the **full body in the chat** and then said send on **that** body. Drafting is not sending. "Send the draft" means: create the draft, paste the body here, stop. If the body changed, show it again. Same rule for subagents, workflows, and scheduled runs.

## Context discipline

Keep the main session lean. A model gets measurably worse as its context fills, well before the limit. The lever is delegation: heavy work runs in a subagent with its own fresh context and returns only the findings.

Delegate when a step would dump tokens you won't need in three turns:
- Reading several large files to extract a few facts
- Repo-wide searches, grep sweeps, log trawls
- Noisy investigation where only the conclusion matters

Don't over-delegate. One subagent for one heavy lookup is the norm. Keep work inline when it's small or when the back-and-forth is the point.

## Model tiers for delegated work

Set the model explicitly on every subagent spawn — omitting it inherits the session model, which is usually the most expensive tier.

- **cheap/fast tier** — mechanical bulk: file sweeps, log triage, renames, format conversion
- **mid tier** — the default: well-specified work with clear acceptance criteria
- **top tier** — genuinely tricky: subtle algorithms, adversarial review, judge/verify passes

Unsure between two → pick the cheaper one and escalate on failure.

## Twelve skills, no drawers

This vault ships twelve skills and no topic packs. That is deliberate: a small always-on surface keeps every session fast and cheap. Don't go looking for a pack that isn't here, and don't add a thirteenth skill to solve a one-off. When the same procedure comes up a third time, `/new-skill` writes it down.

## Tools you actually have

Say plainly when a job needs something that isn't installed, and name it. Don't fake the output and don't quietly substitute a worse method. Transcription is the common case: `/meeting-loop` checks for a local transcriber first and works from a text dump when there isn't one.

## Build defaults

Empty until you fill it in. If you build things, this is where the stack goes — what you write web apps in, where fonts and colors live, which tool transcribes audio. The agent reads it before proposing an approach.

## What NOT to do

No raw transcript dumps into notes. No unsolicited `README.md`. No files outside the vault when the vault works. No commit without being asked. No secrets or PII. No renames or moves without confirming first (it breaks wikilinks). No over-tagging. No send until the body has been reviewed in chat. No writing to anything outside this folder during setup.

## Multiple agents, one vault

This vault is tool-agnostic. `AGENTS.md` (this file) is the canonical contract; `CLAUDE.md` points here and adds Claude-specific notes. Per-tool rule files live in `.grok/rules/`. When the tools disagree about a capability (one has email access, another doesn't), the rule file for that tool wins for that tool only.

---

## On-demand load table

**Do not preload these.** When the task matches a row, read that file **once**.

| When | Read |
|---|---|
| How on-demand loading works | `00-OS/runtime/vault-on-demand.md` |
| Which skill fits a task | `/what-can-i-do` |
| Browse the whole skill library | `Skills/SKILL-ATLAS.md`, once, then stop |
| Full folder tree | `00-OS/runtime/folder-map.md` |
| Project skeleton / registry schema | `Projects/_shared/STRUCTURE.md` |
| Private-notes model and firewall | `People/_DESIGN.md` |
| Any credential / API key question | `00-OS/creds/CREDENTIALS.md` (index only — values live in the keychain) |
| Backups, sync, second machine | `scripts/optional/SYNC.md` |
| How the rules and skills get loaded | `.grok/README.md` |

## In flux

Dated live state. **Delete each line when it lands.** Don't create a second source of truth while these are open.

- _(nothing yet)_
