---
title: Privacy firewall — People/ and secrets
source: vault .grok/rules
---

# Privacy firewall

Two hard walls. Both matter most exactly when no skill is running to remind you.

## 1. Private notes shape tone, never content

**Does this vault have a `People/` folder?** A personal brain does. A brain built for a brand or
a client does not, on purpose, because a second person can open it — in that case this section
governs private notes you keep elsewhere, and everything in this vault is readable by everyone
on the list in `SHARING.md`.


`People/` holds private notes on real humans — what they're working on, how they like to be talked to, what went wrong last time. It is private context only.

It may shape **how** outward-facing work sounds: warmer, blunter, skip the small talk, don't bring up the thing.

It never supplies **what** the work says. No name, fact, quote, date, or relationship from a `People/` note appears in:

- any email, doc, deck, or page an outside reader sees
- any published site or app
- the `00-OS/wiki/` (the wiki is the shareable knowledge layer)

If a fact needs to be usable in outward work, it needs its own source outside `People/`.

Full model: `People/_DESIGN.md`, in vaults that have one.

## 2. Never write a secret value into the vault

Not into a note. Not into a `.env` under the vault. Not into a config, a comment, or a commit message.

The vault holds the **index only** — `00-OS/creds/CREDENTIALS.md`: the name of each credential and where it lives. No values.

Real values live in the OS keychain (macOS: `security add-generic-password`, or a small `cred` wrapper script in `Tools/`). If a task needs a key, read it from the keychain at run time. Do not copy it into a file, a chat message, or a tool argument that gets logged.

If you find a secret already committed: say so plainly, rotate it, and treat git history as compromised for that value. Removing the file does not remove it from history.
