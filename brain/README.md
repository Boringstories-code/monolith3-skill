# Little Brain

A folder of markdown that an AI agent works inside. No database, no app, no subscription. If every AI tool disappeared tomorrow you'd still have your own notes, organised.

## Set up (5 minutes)

1. Unzip. Put the folder wherever you keep things, e.g. `~/brain`.
2. Open it in one of:
   - **Claude Code** — install from Anthropic, then `cd ~/brain && claude`
   - **Grok** — `curl -fsSL https://x.ai/cli/install.sh | bash`, then `cd ~/brain && grok`
   - **Codex** — `cd ~/brain && codex`
3. Say: **set up my brain**

That's it. The agent wires itself to the skills, asks who you are and what this is for, writes the files, and offers to learn your voice. About 20 minutes of questions, once.

## Daily use

| You want | Say or type |
|---|---|
| An answer from what you know | `/q <question>` |
| To add something you found | drop it in `00-OS/raw/<domain>/`, then `/ingest` |
| To catch a thought | `/capture <thought>` |
| To turn a recording into actions | `/meeting-loop <file>` |
| Something in your own voice | `/write-as-you` |
| To see what else it can do | `/what-can-i-do` |

The one habit: capture without filing. Drop things in `Inbox/` and `00-OS/raw/`; ingest sorts it out.

## Optional

- Reading with ADHD? `claude plugin install i-have-adhd` shapes every answer for it.
- Backup and multi-machine sync: `scripts/optional/SYNC.md`.
- Local transcription for meeting-loop: `pip3 install mlx-whisper` (recordings never leave your machine).
- `People/` is private notes on humans; read `People/_DESIGN.md` before you put anything there.

Something off? Run `/wiki-lint`, or `scripts/check-brain.sh` if the agent can't see its skills.

---
Little Brain is a Boring Labs product.
