# Start

```bash
git clone https://github.com/Boringstories-code/monolith3-skill.git
cd monolith3-skill
bash install.sh
cd ~/brain
```

Open Claude, Codex, or Grok in that folder and say **set up my brain**. About 20 minutes of questions, once.

Daily moves are in `brain/README.md` (that file is also at `~/brain/README.md` after install).

If the skills don't show up, run this from inside `~/brain`:

```bash
bash scripts/wire-runtimes.sh
```

The meeting writeup in this repo is `docs/meeting-loop.md`. The procedure the agent follows is `skills/meeting-loop/SKILL.md`. The same file lands in `~/brain/Skills/` after install.
