---
title: Sync
type: reference
created: 2026-01-01
source: brain-starter
tags: [sync, scripts]
---

# Sync

**Git is the only sync layer.** One mechanism, one source of truth, full history.

No Obsidian LiveSync, no CouchDB, no Dropbox/iCloud/Drive folder sync. Two sync systems over
the same folder fight over `.git/` and eventually corrupt the repository — and file-copy sync
gives you conflicted copies with no history to recover from. If you want your notes in
Obsidian, point Obsidian at this folder as a plain vault and leave its sync plugins off.

## What you get

Three background jobs, all driving `sync-brain.sh`:

| Job | When | Does |
|---|---|---|
| watch | On file change, ~20s after things settle | stage, commit, push |
| pull | Every 30s | fetch, and pull if the remote moved |
| full | Hourly | pull, rebuild generated indexes, commit, push |

Net effect: you write a note on one machine, and it's on the others inside a minute. You never
run a git command by hand.

## Setup

```sh
cd ~/<your-brain>
git init
git remote add origin <your private repo URL>

# the pre-push guard
git config core.hooksPath scripts/optional/hooks-git

# install the three background jobs
./scripts/install-sync.sh
```

`install-sync.sh` installs `fswatch` (via Homebrew on macOS) and writes three launchd agents.
Run it once per machine. Linux: it writes systemd user timers instead.

**The remote must be private.** This repository will contain `People/` — other people's
information — and your own unfinished thinking. Check twice.

## Adding another machine

```sh
git clone <your repo> ~/<your-brain>
cd ~/<your-brain>
git config core.hooksPath scripts/optional/hooks-git
./scripts/install-sync.sh

# point the agents at the skills on this machine
./scripts/wire-runtimes.sh
```

That's the whole machine setup. The rules come with the clone, and the skills are wired by that
last line.

Nothing links this folder into your home directory, and nothing should. An earlier version of
this page told you to link `.grok/rules` into `~/.grok` — don't. It overwrites whatever your other
projects rely on, and `./scripts/check-brain.sh` reports it as a failure.

## Never hand-push `main`

The daemon pushes `main` within about 30 seconds of any change. A hand push races it, loses,
and you get `non-fast-forward` — then a half-finished manual merge jams sync for hours while
the watcher keeps committing on top of it.

`scripts/optional/hooks-git/pre-push` blocks it. That hook is not an annoyance to work around; it is
the thing standing between you and an afternoon of untangling.

Working on a branch is fine — push the branch, then land it with:

```sh
./scripts/optional/land-branch.sh <branch>
```

## When sync looks broken

```sh
./scripts/optional/sync-brain.sh --status     # what the daemons think is happening
tail -50 logs/sync.log
launchctl list | grep brain          # macOS: are the agents loaded
```

Common causes, in the order they actually happen:

1. **Uncommitted conflict.** The watcher stops on a conflict rather than committing over it.
   Resolve it by hand, then the loop resumes on its own.
2. **Auth expired.** The push fails silently in the log. Re-auth, done.
3. **`fswatch` not running.** Re-run `install-sync.sh`.
4. **A large binary was added.** Somebody dropped a video in. Move it out of the vault and add
   it to `.gitignore`.

Don't work around a stale repo by copying files around. If sync is broken, say so and fix it —
every workaround makes the eventual merge worse.

## What isn't synced

`.gitignore` excludes: `logs/`, scratch directories, OS junk, and anything large and binary.
Media the vault points at belongs outside the vault, with the note pointing at its path.

The vault is text. Text is what git is good at, and text is what stays readable in ten years.
