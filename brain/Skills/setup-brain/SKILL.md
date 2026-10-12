---
name: setup-brain
description: >
  First-run setup for a fresh brain. Asks who it's for (a person, a business or brand, or a
  client you're building it for), interviews accordingly, then writes the AGENTS.md, voice
  card, wiki domains, folder shape and first real pages from the answers. Use on
  '/setup-brain', 'set up my brain', 'set up a brain for <brand>', 'make a brain for a client',
  'first run', 'I just cloned this', or any session in a vault where AGENTS.md still contains
  <YOUR NAME>.
allowed-tools: [Read, Write, Edit, Glob, Grep, Bash]
---

# Setup — interview first, write second

A brain stamped from a template knows nothing about its owner, which makes it a nicely
organised set of empty folders. This skill fixes that in one sitting, about 20 to 30 minutes.

**Do not skip to writing files.** The interview is the product. The files are just where the
answers land.

## How to run the interview

Ask in rounds. Two or three questions at a time, conversationally. React to what they say —
follow the interesting answer instead of marching through the list.

**Grill them.** Vague answers produce a vague brain. If someone says "I'm a consultant," that's
not an answer: consultant for whom, doing what, paid how? Push once, politely, then take what
you get and move on. Never push more than twice on the same question.

**Keep their exact words.** You are collecting voice samples as much as facts, and a paraphrase
loses the thing that makes it theirs. When you write a page, prefer their phrasing to yours.

**Never invent an answer.** If they won't or can't answer, write down that it's unknown and say
so out loud. An honest gap is a to-do. An invented fact is a landmine.

---

## Round 0 — Who, what, where

Three questions before you touch the filesystem. The first one changes everything after it.

### 0a. Who is this brain for?

Ask it plainly, and offer the three shapes:

| They say | Mode | What it means |
|---|---|---|
| "Me." | **personal** | One human. Their work, their voice, their private notes. |
| "My business, my brand, my studio." | **brand** | An entity they own and run. Voice is the brand's, not theirs. |
| "A client. I'm building it for them." | **client** | An entity someone else will own. Built to be handed over, and usually shared while it's being built. |

Write the mode down and say it back: "So this is a brain for Northwind, the brand, not for you
personally. The difference is whose voice it writes in and who else can read it."

**These answers collide in real life, and the first sentence usually isn't the deciding one.**
"It's for Northwind, a brand I operate" sounds like brand. "It's his business, I'm building it
for him" is client. Somebody running a brand on someone else's behalf says both, in that order,
in one breath. Keep asking until you have two facts:

- **Whose voice does it write in?** The entity's, in both brand and client mode.
- **Who owns it in the end?** This is the one that decides brand versus client. If the answer is
  anyone but the person in front of you, it's client mode, and it gets `HANDOVER.md`.

One person and nobody else is personal. Anything else is an entity brain.

One person can have several. A personal brain and a brand brain are different folders, different
repositories, different voices. Don't make one brain be both. That's how private notes end up in
the shared one.

### 0b. What's it called?

Not the folder, the thing. People say the name out loud a lot ("it's in my brain", "check
Northwind"). A name that feels stupid to say gets used less.

- personal: whatever they give you, including "brain". `cortex`, `jamie-brain`, `second-brain`.
- brand or client: default to the entity's name. `northwind`, `northwind-brain`.

Make a kebab-case slug from it for the folder.

### 0c. Where does it live?

Full path. Default `~/<slug>`.

| Path | When |
|---|---|
| `~/<slug>` | Default. Short, and easy to type every day. |
| `~/Documents/<slug>` | If they want it inside their normal document backups |
| `~/work/<slug>` or similar | If they keep client work separate from personal |

Say these before they answer:

- **Not a file-copy sync folder** (Dropbox, iCloud Drive, Google Drive Desktop). Two sync
  systems over one folder corrupt the history eventually. Git is the sync layer here.
- **Not a temp folder.** If the path isn't under their home folder, ask once whether they meant
  it.
- **Personal mode only: `People/` lives inside this folder.** Private notes about other humans.
  If that path is shared, backed up somewhere they don't control, or on a work machine, say so
  now.

Confirm the path back before you create anything. If the vault already sits somewhere they're
happy with, take the current path and move on. Don't move a folder mid-interview.

---

# Personal mode

Skip to **Entity mode** below if this is a brand or a client brain.

## Round 1 — Who they are

1. What's your name, and what do you want the brain to call you?
2. What do you do? Not the job title. What do you actually spend your days doing?
3. Who do you do it for? Employer, clients, yourself, a team?
4. What are you unusually good at? And what do people keep asking you for?
5. What part of the work do you avoid, or keep putting off?

Q5 earns its place. The thing someone avoids is usually the thing that most needs writing down,
and it tells you which domain will actually get used.

## Round 2 — Why they want it

6. Why do you want this? What made you go looking for it?
7. What are you tired of losing track of?
8. When you can't remember something, where do you look first today, and how well does that go?
9. Six months from now, what would make you say this was worth setting up?

Q9 is the one that matters. Everything below gets tuned to the answer. "I want to stop
re-researching the same thing" means the wiki carries the weight. "I want to stop dropping
client commitments" means `Projects/` and `meetings/` do. Build toward their answer, not toward
a generic ideal.

## Round 3 — What goes in it

10. What kinds of things will you put in here? Meeting notes, research, book highlights, client
    work, ideas, health, code notes?
11. What's already written down somewhere, and where is it? Notes apps, Google Docs, a Notion,
    a folder of PDFs, voice memos.
12. Is any of it sensitive? Client confidential, medical, other people's private information.
13. Do you work with other people's information? Names, situations, things said in confidence.
14. (Only if 13 was yes) Name one person you deal with regularly. A colleague, a referral
    partner, a collaborator. Not someone whose confidence you're holding.

Q13 sets up the `People/` firewall, and Q14 gives you a real person to build the first note
from. Never invent that name. If they'd rather not give one, skip the `People/` note and say
you've left the folder empty on purpose. If Q13 is yes, walk them through `People/_DESIGN.md`
before moving on. This is the one part of the system where a mistake has consequences outside
the vault.

Q11 may turn up real material worth loading now. See **Seeding from what already exists**.

## Round 4 — How they talk

15. Write me three sentences the way you'd actually write them to a colleague. Anything: what
    you did yesterday, what's annoying you.
16. Now the same thing to a client, or someone you don't know well. How does it change?
17. What's a phrase you use constantly?
18. What do you call the things you work on? Any words you use that an outsider would need
    explained?
19. What kind of writing makes you wince? Anything you'd never say?
20. When the brain writes something for you to send, should it sound like you, or neutral and
    professional?

Q16 and Q18 carry real weight. Most people have two registers, and a brain that only knows the
casual one writes badly the first time it matters. Q18 gets you their vocabulary, which is most
of what makes a wiki feel like theirs rather than like a filing system. Use their words for
domain names and page titles wherever you can.

## Round 5 — How they work

21. What tools do you live in?
22. Are you on one machine or several?
23. Is there anything in here you'd be upset to lose?
24. Anything the brain should never do without asking you first?

## Round 6 — One real thing

Everything above is about them. This round is the first actual content, and without it the brain
knows the shape of their work and none of the substance.

25. Think of one thing you'd want to look up six months from now. The last job you figured out,
    the article you keep meaning to reread, the number you can never find. Tell me about it now,
    in as much detail as you can be bothered with.

Push for specifics here, harder than anywhere else. Not "I do brake jobs" but the actual fault
on the actual vehicle and what fixed it. Not "I read about attachment theory" but which idea
landed and what you'd do differently. Vague is fine everywhere else in this interview. Here it
defeats the point.

Write that answer up as a page in the domain it belongs to, cited `source: setup-interview`,
before you move on. It's the first page that proves the thing works, because it's the first one
they'd genuinely go looking for.

If they can't think of anything, don't force it. Say plainly that the brain can't answer
questions about work it hasn't been told about yet, and make the 24-hour instruction at handover
concrete instead: name the specific thing they'll put in first.

Then go to **Writing the files**.

---

# Entity mode — a brand, a business, or a client's

Same shape, different subject. You are not describing a person. You are describing something
that outlives any one person's involvement, and that more than one human will usually read.

Throughout, "the steward" is whoever is answering, and "the entity" is the brand or business.

## Round 1E — What this thing is

1. What is it, in one sentence, the way you'd say it to someone at a barbecue?
2. Who is it for? Be specific. Not "small businesses."
3. What does it sell or do, and how does the money work?
4. How long has it existed, and what stage is it at?
5. What makes it different from the obvious alternative? And what is it deliberately not?

Q5 is the one people answer badly. Push twice here. An entity brain that can't say what the
entity isn't will approve every off-brand idea it's ever shown.

## Round 2E — Who touches it

6. Who's answering these questions, and what's your role?
7. Who else will open this folder? Name them, and say what each one does.
8. Who owns this in the end? You, the client, both?
9. Is there anything that a person on that list must never see?

Q7 through Q9 set the privacy model, and they are the reason entity mode exists. Get real names
and real answers. "Just me for now, my client in a month" is a different setup from "me and two
contractors forever."

If the answer to Q9 is anything other than a clean no, stop here and sort it out before you
write a single page.

**A vault has exactly one audience.** One folder, one history, one set of files. Everyone who can
open it reads all of it, and there is no per-person permission to hide a page from one reader.
So the rule is: **write to the least-privileged person on the Q7 list.** If a teammate will read this
folder eventually, then nothing that teammate can't see goes in it, starting today. Not in a page, not in
a footnote, not "temporarily."

That bites hardest when the restricted thing is genuinely useful. The exact cost of a quoting
mistake is precisely what a future estimator needs, and precisely the contract figure that's
meant to stay away from them. Don't quietly resolve that yourself. Write the qualitative lesson,
leave the number out, say in `SHARING.md` that you did and why, and name it as a decision for the
owner to make on purpose.

If the material genuinely needs a home, it needs a **different brain** — the steward's own
personal one. The steward's fee for this work, their private read on somebody's estimator, their
own notes on the relationship: none of that is the entity's, and all of it belongs in a personal
brain they own. If they don't have one yet, say so plainly. That's a second setup, another
twenty minutes, and it's the right answer rather than a workaround.

## Round 3E — What goes in it

10. What kinds of material does this thing generate? Proposals, shoots, specs, campaigns,
    invoices, research, meeting notes?
11. What already exists, and where? Brand kit, a website, past deliverables, a drive folder, a
    folder of contracts.
12. Which of that should this brain know from day one?
13. Who are the live clients, projects or engagements right now?
14. What's confidential, and to whom?

Q11 and Q12 are the seeding questions, and they are the biggest difference between an entity
brain that gets used and one that doesn't. A brand brain that already knows the brand is useful
in the first session. See **Seeding from what already exists**.

## Round 4E — How it sounds

15. Show me something it has already published that sounds right. Paste it, or point me at it.
16. Show me something that sounds wrong, if you have one. What's wrong with it?
17. Are there words or phrases it always uses? Ones it never uses?
18. Who signs the writing? The brand, a named person, or both depending on the piece?
19. Is there a brand voice written down anywhere already?

Entity voice is **evidence-based, not aspirational**. Adjectives lie: everybody says "warm,
professional, approachable." Real samples don't. If they can't produce a single real sample,
write that down as a gap rather than inventing a voice card, and say that the humanizer is
running on guesswork until it's filled.

## Round 5E — How it runs

20. What's the repeating work? The thing that happens every week, or every job.
21. What's the thing that always goes wrong, or always gets dropped?
22. What does "done" look like for a typical piece of work?
23. Anything the brain should never do without asking?
24. Six months from now, what would make you say this was worth setting up?

Q24 matches the personal interview's six-month question, and the decision log at the end wants a
verbatim answer rather than something you inferred from the rest. Ask it even when you think you
already know.

Q21 is where the value is. A repeating failure is exactly what a brain fixes, and it should
decide which domain gets built out first.

## Round 6E — One real thing

25. Pick one real piece of work this thing has done, or is doing right now. Walk me through it:
    what the job was, what got decided, what you'd want to remember about it next time.

Same rule as personal mode. Write it up as a real page before moving on. For an entity brain
this is usually a client engagement, a project or a job, and it's the first entry in what
becomes the institutional memory.

Then go to **Writing the files**.

---

# Seeding from what already exists

Entity mode especially, personal mode sometimes. If Q11/Q12 turned up real material, load it
before you finish. An empty brain gets abandoned, and the gap is much wider for an entity than
for a person.

**Files on this machine.** Look before you copy:

```sh
ls <their path>
```

Copy what belongs into `00-OS/raw/<domain>/`, then turn it into real wiki pages the way
`/ingest` would: atomic pages, one thing each, linked, cited back to the source. Don't dump
whole documents into the wiki. A 40-page brand guide becomes several pages, not one.

**A structured brand profile** — a `brand-profile.json`, a brand kit folder, a voice card, a
style guide — is the highest-value seed there is. Read it and use it directly: it fills
`00-OS/runtime/voice.md`, the "What this is" block, and the first pages in one pass. Don't
re-interview for anything the profile already answers. Ask them to confirm what you read
instead: "Your kit says the brand never uses exclamation marks. Still true?"

**What not to seed:** anything confidential to someone on the Q7 list who can read this folder,
anything from a private dossier, and anything they only half-own. When in doubt leave it out,
and note it as available but not loaded.

Say what you loaded when you're done, by name. People need to know what their brain has read.

---

# Writing the files

Confirm the summary out loud before writing anything: "Here's what I've got. Say if I've got you
wrong." Let them correct it. Then write.

## Every mode

### Name and path

Nothing outside this folder needs editing. The vault wires itself up from the inside, so this is
only about the name showing up where it should:

- `AGENTS.md` — the owner or entity name, and the vault name in "What this is"
- `README.md` at the vault root — the title line

Then run `./scripts/check-brain.sh`, fix what it names, and run it again until it's clean.

If the folder isn't at the chosen path, move it now, before you write anything else.

### `AGENTS.md`

Replace every `<...>` placeholder, delete the setup note at the top, and add a **Who this is**
block right after "What this is".

- **Personal:** their name everywhere. The block says what they do, who for, and the six-month
  goal from Q9, in their words.
- **Brand or client:** the entity's name. The block says what it is, who it serves, what it
  sells, and what it's deliberately not, from Q5E. Name the steward and the owner separately,
  because a future session needs to know whose call a thing is.

Build defaults is written for someone who builds software, and most owners don't. Write their
real tools, or delete the section. An honest empty beats a templated stack.

### `00-OS/runtime/voice.md`

**Personal**, from Q15–Q20:

```markdown
# Voice

## How <name> writes
<Their three sentences from Q15, verbatim. Do not clean them up.>

## How they write to a client
<From Q16, verbatim.>

## Phrases they use
<From Q17>

## Their words for things
<From Q18. Use these in page titles and domain names.>

## Never say
<From Q19, plus the standard slop list from .grok/rules/04-writing-standard.md>

## Default posture
<Sound-like-them or neutral, from Q20>
```

**Entity**, from Q15E–Q19E:

```markdown
# Voice — <entity>

## Real samples
<Q15E, pasted verbatim, with where each came from. These are the ground truth.>

## What sounds wrong
<Q16E, with their reason. A counter-example teaches faster than a rule.>

## Always / never
<Q17E>

## Who signs it
<Q18E: the brand, a named person, or both depending on the piece>

## Gaps
<Anything they couldn't answer. Say it plainly. An admitted gap beats a guessed voice.>
```

Verbatim matters in both. A tidied-up sample teaches the wrong voice.

### Wiki domains

The template ships eight: work, craft, tools, people, money, health, ideas, learning. Delete the
ones they'll never use, because an empty domain is noise, and add the ones they need.

**Use their words.** If Q18 or Q17E gave you their vocabulary, name domains that way. A mechanic
gets `repairs`, not `work`. A counselor gets `modalities`, not `craft`. This is most of what
makes a brain feel like theirs rather than like software.

Entity brains usually want something closer to `clients` (or `engagements`), `offers`, `craft`,
`operations`, `marketing`, `money`. Build toward Q20E and Q21E, the repeating work and the
repeating failure, rather than toward the template's defaults.

Adding a domain means a folder, an `_index.md` copied from a sibling, a matching
`00-OS/raw/<slug>/`, and a row in `00-OS/wiki/index.md`. If something doesn't map cleanly, use
the closest domain and say which. A ninth domain holding one page is worse than a loose fit.

### First real pages

Two or three at minimum, plus whatever Round 6 produced. Real ones, cited `source:
setup-interview` or the seed file they came from.

An empty wiki gets abandoned. One with three pages in it gets a fourth.

### `Projects/REGISTRY.json`

One entry per active project, client or engagement they named. Slug, display name, status, path.

A standing referral source or a recurring customer is a relationship, not a project. Those
belong in the wiki. The registry is for work with a start, an end and a name.

Plenty of people have none, and an empty registry is the right answer for a solo operator with
one ongoing practice. Say so, note why in the file, and move on. Don't invent projects.

## Personal mode only

### `People/`

If Q13 was yes and they named someone in Q14: make sure they've read `People/_DESIGN.md`, then
create one note from `_TEMPLATE.md` so the shape is obvious.

## Entity mode only

### `People/` does not exist here

**Delete the `People/` folder.** Not gitignore it. Delete it.

A private dossier on a human is a personal-brain object. The moment a second person can open the
folder it becomes a liability, because notes written to shape how you talk to someone are not
notes you want that someone, or their colleague, reading. In a client brain it's worse, since
the client owns the repository in the end.

Public-safe notes about people and organisations still belong in the wiki, at
`00-OS/wiki/people/`. That distinction already exists in the template. Use it.

`People/_DESIGN.md` goes with the folder, so don't leave anything pointing at it. Nothing you
write in an entity brain should cite a path that no longer exists.

Say this out loud rather than doing it silently. A steward who has a personal brain will expect
`People/` to be there and should understand why it isn't.

### Clear out what an entity doesn't need

The template is shaped for a person. Delete the folders that make no sense for a business, so the
owner doesn't inherit empty rooms: `Life/`, `Personal/`, and `Books/` unless the interview gave
them a reason to stay. `Contracts/` usually earns its place in a business vault; ask.

Say which ones you're removing and why. A folder deleted with a sentence is tidy. A folder that
silently vanishes looks like a bug.

### `SHARING.md` at the vault root

Write it from Q6E, Q7E, Q8E and Q9E. Short, and specific with names:

```markdown
# Who this brain is for

Owner: <Q8E>
Steward: <Q6E>
Who can open it: <Q7E, by name and role>

## What is not in here
<From Q9E and Q14E. Name it, and say where it lives instead.>

## Ground rules
- No private notes about people. This vault has no `People/` folder, on purpose.
  Public-safe notes about people and organisations go in `00-OS/wiki/people/`.
- No secrets. Credential names only, in `00-OS/creds/CREDENTIALS.md`.
- Anything a reader shouldn't see doesn't get written here in the first place.
  A repository keeps history, so deleting it later is not the same as it never being there.
```

That last line is the one that matters. People assume a delete is a delete.

### Client mode — build it to hand over

A client brain is somebody else's property that you're holding. Two extra things:

1. **Write `HANDOVER.md`** at the vault root on day one, even if handover is a year away. What
   it is, what's in it, who to ask, what they need on their own machine to use it (an agent
   subscription and `git`), and how to take ownership of the repository. One page. A brain
   nobody can take custody of is a hostage.

2. **Say who pays for what.** The client needs their own agent subscription to use this after
   handover. Say so during setup, not at the end of the engagement.

If the brain is shared *during* the work rather than handed over at the end, both people
committing to one repository is fine and normal. Tell them the rule that prevents the pain: pull
before you start, commit when you stop. `scripts/optional/SYNC.md` covers the rest when they
want it.

## Backup, every mode

From Q23 in personal mode or Q8E in entity mode, and keep it small. One machine and no remote is
a perfectly good place to end the day. Say plainly that **nothing is backed up** until there's a
private remote, and leave it there.

If they want it now: make a **private** repository, then `git remote add origin <url>` and
`git push -u origin main`. Say "private" out loud.

For client and shared brains the remote is less optional, because a brain two people are meant
to share doesn't exist until it's somewhere both can reach. Make the repository private, and
make sure the owner from Q8E has access to it, not only the steward.

Background sync daemons live in `scripts/optional/`. Don't install them today.

---

## Close

Tell them, in this order:

1. The one command they'll use most: `/q <question>`.
2. The one habit that makes it work: drop things in `00-OS/raw/<domain>/` and `Inbox/` without
   filing them.
3. Where the rules live (`.grok/rules/`) and that they own them. Every rule is editable, and a
   rule they disagree with should be changed, not endured.
4. What to do in the next 24 hours: put one real thing in. Not a test file. Something they
   actually want to be able to ask about later.

For an entity brain, add a fifth: **who else needs to be told this exists**, and what you want
them to do with it. A shared brain that only one person knows about is a personal brain with
extra steps.

Then append one line to `00-OS/decisions/` recording that setup ran, the date, the mode, and the
six-month goal. Plain prose, because that folder's `_TEMPLATE.md` is shaped for a decision with
options weighed and this is a log entry. A year from now that file is the only record of what
this was supposed to do.
