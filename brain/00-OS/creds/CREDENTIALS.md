---
title: Credential index
type: reference
created: 2026-01-01
source: brain-starter
tags: [creds, security]
---

# Credential index

**Names and locations only. No values. Ever.**

Not an API key, not a password, not a token, not "just the test one." Not in this file, not in
a note, not in a `.env` under the vault, not in a config, not in a commit message.

This vault is git-backed and synced. A secret written here is a secret published to every
machine it reaches and preserved in history forever after.

## How values are stored

macOS keychain:

```sh
# store
security add-generic-password -a "$USER" -s "MY_SERVICE_KEY" -w

# read (at run time, never copied anywhere)
security find-generic-password -a "$USER" -s "MY_SERVICE_KEY" -w
```

A small wrapper in `Tools/` makes this `cred get MY_SERVICE_KEY`, which is worth the ten
minutes.

Linux: use `secret-tool` (libsecret) or `pass`.

## The index

| Name | What it's for | Where the value lives | Rotated |
|---|---|---|---|
| `EXAMPLE_API_KEY` | Example service, used by `Tools/example` | keychain | 2026-01-01 |

## If a secret gets committed

Say so immediately, then:

1. Rotate it. Assume it's compromised — it is.
2. Remove it from the working tree.
3. Know that removing the file does **not** remove it from git history. Rewriting history is
   possible but the rotation is what actually protects you.

Do this in that order. Rotate first; cleanup is housekeeping.
