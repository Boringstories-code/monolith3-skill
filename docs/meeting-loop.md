# Meeting loop

A recording goes in. A note and a list of what you owe come out. The procedure the agent follows is `skills/meeting-loop/SKILL.md`. After install, the same file is at `~/brain/Skills/meeting-loop/SKILL.md`.

Say `/meeting-loop` and point it at the audio, or paste a text dump.

## Transcribe on this machine

```sh
command -v mlx-whisper || command -v whisper-cli || command -v whisper
```

On Apple silicon:

```sh
mlx-whisper <file> --model mlx-community/whisper-large-v3-mlx --output-dir <dir> --output-format txt
```

Install with `pip3 install mlx-whisper`. If none of those commands exist, work from a text dump. The audio stays on this machine.

## Where it goes

The agent names the kind it picked. Correct it if that's wrong.

- Client work lands in `meetings/` and `Projects/<slug>/`.
- Team talk lands in `meetings/`.
- Personal lands in `Personal/`.
- A creative session lands in `brainstorms/` or `Apps/<slug>/`.
- An interview lands in `Research/`.

Speakers get their names when the audio makes that clear. Otherwise the label is `Speaker 1`.

## The note

One note, at `meetings/<what-it-was>.md`. Leave the date out of the filename.

The raw transcript goes to `00-OS/raw/work/<slug>-transcript.md`. Keep it out of the note.

Each action is copied to `Projects/<slug>/inbox/`, `Personal/inbox/`, or `Inbox/`. The checkbox stays in the note.

If someone on the recording tells an AI to do something, that becomes `meetings/<what-it-was>-ai-handoff.md`. The file is paste-ready. This pass does not run those commands.

People mentioned in the recording get a quiet update through `person-enrich`, into `People/`.

Then the agent offers the next step and stops. You decide what actually gets sent.

When it finishes, you get the classification, the note path, how many actions landed where, whether a handoff was written, who was enriched, and the one decision that needs a person.
