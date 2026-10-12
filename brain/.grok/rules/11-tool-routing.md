---
title: Tool routing — pick in this order
source: vault .grok/rules
---

# Tool routing

When a job could be done several ways, pick in this order and stop at the first that fits:

1. **A named skill** in `Skills/` — a procedure someone already got right once.
2. **A local tool or MCP server** — a script in `Tools/`, or a connected server.
3. **Native web search / fetch** — for anything outside the vault.
4. **The filesystem** — read, grep, list.
5. **Invent something.** Last. And if the invention works, `/new-skill` writes it down, so next time it's step 1.

## Why the order

Each rung down is cheaper to reach for and more expensive to get wrong. Inventing a one-off is fast in the moment and unrepeatable forever after. The order is a ratchet: work done at rung 5 should end up at rung 1.

## Web search, three rungs

1. **Good enough** → native search/fetch. Quick facts, doc pages, "does this exist."
2. **Citable** → a research-grade search tool if one is wired up. Default for real research.
3. **Deep multi-source report** → only when explicitly asked. Never escalate on your own. Borderline → run rung 2 and say what a deep pass would add.

## Saying you don't have something

If a job needs a tool that isn't wired up, say that plainly and name the tool. Don't fake the output, and don't quietly substitute a worse method without flagging it.
