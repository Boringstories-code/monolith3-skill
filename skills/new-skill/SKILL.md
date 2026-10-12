---
name: new-skill
description: >
  Write a new skill, or fix one that isn't firing. Use on '/new-skill', 'make this a skill',
  'turn that into a skill', 'this skill never triggers', 'save this as a procedure'.
allowed-tools: [Read, Write, Edit, Glob, Grep]
---

# New skill

A skill is a procedure someone got right once, written down so it's right every time.

## When something deserves to be a skill

- You've done it three times and done it differently each time.
- Getting it wrong has a cost, and the way to get it right isn't obvious.
- It has real steps, in an order that matters.

Not a skill: a one-off, something the model does well unprompted, or a preference — that's a
rule in `.grok/rules/`.

## Structure

`Skills/<name>/SKILL.md`:

```markdown
---
name: <kebab-case, matches the folder>
description: >
  What it does, then the trigger phrases someone would actually say. This field is the
  ONLY thing loaded until the skill fires, so it carries all the routing weight.
allowed-tools: [Read, Write, Edit, Glob, Grep, Bash]
---

# <Name>

<One line: what this is for.>

## <Step 1 — imperative heading>
## <Step 2>
## Output
<What the person gets at the end.>
```

## The description is the whole game

A skill that never fires is a skill that doesn't exist. Write the description as the trigger
phrases the owner would actually type — their words, not a category name. Include the slash
command, the natural-language versions, and the sloppy version they'd type in a hurry.

Bad: `description: Handles document processing workflows.`
Good: `description: Turn a PDF into markdown I can search. Use on 'convert this PDF', 'get the text out of this', 'pdf to markdown', '/pdf'.`

## Rules for the body

- Imperative. "Read the file," not "the skill reads the file."
- Say what NOT to do where a mistake is likely. Those lines earn their keep.
- Name exact commands and exact paths.
- End with an Output section. A skill that doesn't define done, isn't.
- Keep it under ~150 lines. Longer means it's two skills, or the detail belongs in a
  `references/` file next to it that loads on demand.

## After writing

Add a row to `Skills/SKILL-ATLAS.md`. An unlisted skill is invisible to the router.

Once three skills share a subject, group them in `drawers/drawer-<group>.md` instead of
the always-on set. Keep the always-on set small — that's what keeps sessions cheap.
