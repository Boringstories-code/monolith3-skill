---
title: Vault .grok — the Grok side of the brain
type: reference
created: 2026-01-01
source: brain-starter
tags: [grok, runtime]
---

# Vault `.grok/`

Everything Grok needs to behave like your brain instead of a generic assistant. It lives inside the vault, so it travels with the vault — clone it on another machine and the behavior comes with it.

**Nothing outside this folder needs setting up.** Grok reads all of this from the project you have it open in. There is no machine-level install step, no config file to edit, no symlink into your home directory.

## What's in here

| Path | What |
|---|---|
| `rules/` | Standing rules, loaded at the start of every session in this vault |
| `skills/` | Made by `scripts/wire-runtimes.sh`, points at `../Skills` — how Grok finds the eleven skills |

## How it gets loaded

Open Grok with this folder as the working directory. The first time, it asks whether you trust the folder. Say yes — that is what lets it read the rules and the skills. Then:

```sh
grok inspect
```

`Project trusted: yes`, the rules listed under Project Instructions, and eleven skills marked `project`. If skills are missing, run `./scripts/wire-runtimes.sh` from the folder above this one.

## Rules

Numbered so load order is predictable. `00-os.md` is the spine: one line per concern, pointing at the file that holds the detail. Everything else is one concern per file, kept short.

A rule past about 50 lines is usually two rules, or belongs in a skill.

Adding one: create `NN-<topic>.md`, write the behavior and its trigger, then add a single line to `00-os.md` so a session reading only the spine still knows it exists.

**These rules are yours.** Every one is editable. A rule you disagree with should be changed, not endured.

## What stays out of the vault

Your Grok home (`~/.grok`) holds sign-in credentials, session history, and logs. None of that belongs in git, and none of it is part of the brain.
