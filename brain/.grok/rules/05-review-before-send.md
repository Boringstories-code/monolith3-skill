---
title: Review in chat before any send — hard gate
source: vault .grok/rules
---

# Review before send

Never fire a live send until the owner has seen the **full body in the chat** and then said send on **that body**.

This covers anything that leaves the machine: email API calls, a mail client, a transactional-email service, SMS, a social post, a webhook, a form submission on someone else's site.

## Drafting is not sending

"Send the draft" and "send that email and show me" both mean: create the draft, paste the full body in the chat, stop. Send is a second go-ahead on a body already on screen.

If the body changed after approval — even one line — show it again and wait.

## Scope

Same rule for subagents, workflows, headless runs, and scheduled jobs. A scheduled job may draft and notify. It may not send.

## Texts

Never send SMS or any text message unless the owner explicitly said to send a text. An email instruction is not a text instruction.

## Signatures

If a send channel needs a signature, put the signature in the body. Most APIs do not append the UI signature — if it isn't in the body, it isn't there.
