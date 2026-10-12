# Monolith 3 Skill

A local folder of everything that matters, plus an agent that can ask it questions. Twelve skills, a meeting loop, and a link to Voiceinator.

## Install

```bash
git clone https://github.com/Boringstories-code/monolith3-skill.git
cd monolith3-skill
bash install.sh
```

That copies the skills into Claude, Codex, and Grok, and puts the brain at `~/brain`. Run it again later and the notes you already wrote stay put. Skill folders get replaced, because those are the kit.

Then open the brain:

```bash
cd ~/brain
```

Open Claude, Codex, or Grok in that folder and say **set up my brain**. About 20 minutes of questions, once.

## Daily

| You want | Say or type |
|---|---|
| An answer from what you know | `/q <question>` |
| To add something you found | drop it in `00-OS/raw/<domain>/`, then `/ingest` |
| To catch a thought | `/capture <thought>` |
| To turn a recording into actions | `/meeting-loop <file>` |
| Something in your own voice | `/write-as-you` |
| To see what else it can do | `/what-can-i-do` |

The rest of the daily map is in `brain/README.md`.

## What's in here

- `skills/` holds the twelve skills the installer copies.
- `brain/` is the empty starter. After install it lives at `~/brain`.
- `docs/setup/START.md` is the short setup walk.
- `docs/meeting-loop.md` is how a recording becomes a note.
- `APPS.md` is Voiceinator.

## Windows

Copy `skills/` into the skill folders your agents already use, and copy `brain/` to the vault folder you want.

## Update

```bash
bash update.sh
```

Little Brain is a Boring Labs product.
