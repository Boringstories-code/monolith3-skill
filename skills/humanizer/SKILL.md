---
name: humanizer
description: >
  Strip AI-writing tells and rewrite toward the owner's real voice. STANDING RULE: run this
  on ANY outward-facing writing before it ships — emails, site copy, proposals, decks, social
  posts, anything an outside reader sees — in every session, including headless and scheduled
  runs. Use on '/humanizer', 'make this sound human', 'does this sound like AI', 'clean this
  up before I send it', or automatically as the last step before any send.
allowed-tools: [Read, Write, Edit, Grep]
---

# Humanizer

The gate everything outward-facing passes through. Not a polish pass — a rewrite toward a
specific person's voice.

## First, read the voice

`00-OS/runtime/voice.md`. If it doesn't exist, say so and work from the samples in the text
itself, but flag that the output is a guess until a voice card exists.

Then read `.grok/rules/04-writing-standard.md` for the standing kill list.

## The tells

Hunt these specifically. They're what makes text read as machine-written even when every
sentence is fine on its own.

**Rhythm**
- Uniform sentence length. Real writing lurches — a nine-word sentence next to a thirty-word one.
- Rule-of-three pile-ups. Three adjectives, three clauses, three bullets, over and over.
- Every paragraph the same size.

**Constructions**
- Em-dash overuse. One per few paragraphs is voice; one per sentence is a tic.
- "-ing" tack-on clauses gluing a second thought onto every sentence ending.
- Copula avoidance: "serves as," "functions as," "acts as" where the word is "is."
- "It's not just X, it's Y." "This isn't about X — it's about Y."
- Hedging stacks: "might potentially," "could possibly help."

**Register**
- ALL-CAPS or Title-Case Section Headers that nobody speaks.
- Inflated significance. A small thing called pivotal, game-changing, essential.
- Generic upbeat closers. "Excited to see where this goes!" "Let me know if you have any
  questions!"
- Opening with a restatement of the question you were asked.
- Summarising what you just said, in the last paragraph, for no one.

**Vocabulary**
- delve, leverage, robust, seamless, streamline, elevate, unlock, navigate (figuratively),
  landscape (figuratively), realm, tapestry, testament, crucial, vital, comprehensive.
- Not banned outright — banned as *reflexes*. If it's the exact right word, keep it.

## The rewrite

Don't edit around the tells. Rewrite the sentence the way the person would have said it.

- Shorten first. Most AI text is 30% longer than the thought inside it.
- Cut any sentence that's setting up the next one. Start at the point.
- Contractions, unless they never use them.
- Say the thing plainly, then stop. The stopping is most of it.
- Let a paragraph be one line when one line is the thought.

## What not to break

- Facts, numbers, names, dates, commitments. Voice work never changes what was promised.
- Their actual idiosyncrasies. If they habitually write in fragments, keep the fragments.
  You're removing the machine, not the person.
- Anything legal, contractual, or quoted from someone else.

## Output

Return the rewritten text. Then, briefly, the three biggest things you changed and why — so
the owner learns the pattern and drafts better next time. Don't list every edit.

If the source text was already fine, say so and change nothing. A humanizer that always finds
work to do is just a rewriter.
