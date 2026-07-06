---
name: tokenomics-bootstrap
description: Use when setting a project up with the tokenomics discipline — interviews the builder about their model tiers, limit shape, project gates, and backlog, then generates the project's model-effectiveness playbook from the template. Ships no default lanes and invents no queue items.
---

# Bootstrap a project with tokenomics

REQUIRED READING FIRST: `reference/portable-method.md` and
`reference/playbook-template.md` (plugin root). Read both in full before
asking the builder anything — the interview questions below assume you
already know the four layers, the routing test, and the six playbook
components.

## Step 1 — Interview (one question at a time)

Ask the builder these questions **one at a time, in this order**. Wait for
each answer before asking the next. Do not batch them into a single
message, and do not supply your own default for an unanswered question —
proceed to Step 2 with whatever the builder actually gave you.

1. Which model tiers do you actually have access to, and what is the limit
   shape for each — a subscription window, per-token billing, time-boxed
   premium access, or some mix?
2. What are the project's green gates — the exact build/test/lint commands
   that must pass before anything is considered done?
3. Where do specs and design docs live in this project (the path the
   session protocol's "spec-first" rule will point to)?
4. Is there an existing backlog or issue list to seed the work queue, and
   what are the 1–3 biggest risks to the project right now? (This seeds the
   strategic frame — it is not a request for the full backlog contents,
   just what's live today.)
5. Where should the playbook live? Default is
   `docs/model-effectiveness-playbook.md` — ask if the builder wants it
   somewhere else, don't just assume the default.

## Step 2 — Generate the playbook

Fill `reference/playbook-template.md`'s placeholders using only what the
builder said, and write the result to the target path from question 5.

Three hard rules govern generation:

- **Ship no default lanes.** Model routing must name exactly the tiers the
  builder said they have access to in question 1 — if they have two tiers,
  write two lanes, not the template's three. Never invent a third lane
  "for completeness."
- **Invent no queue items.** If question 4 produced no backlog, the Now
  table gets its column headers and nothing else. An empty Now table is a
  valid, honest output — a plausible-looking placeholder row is not.
- **Invent no answers.** If any interview question went unanswered or the
  builder said "not sure," the corresponding playbook section states
  plainly that this was not established yet (e.g. "Not established — ask
  at next bootstrap pass"). It never receives a plausible-sounding default
  in its place.

Map the answers onto the template's sections directly:
- Question 1 → Model routing (lanes named for the tiers the builder
  actually has, plus each tier's limit shape).
- Question 2 → Session protocol rule 5 (existing project gates).
- Question 3 → Session protocol rule 3 (spec path).
- Question 4 → Strategic frame (the risks) and Work queue Now table (the
  backlog, if any) and Gap register (open findings, if any).
- Question 5 → the path the file is written to, and the pointer line in
  Step 3 below.

Copy the routing test into Model routing verbatim, exactly as it appears
in `reference/playbook-template.md` (the same test `reference/portable-method.md`
presents in expanded form):

> Ask: "If this is done slightly wrong, is it expensive?" → flagship.
> Clear contract with tests → mid. Mechanical with automated verification
> → small.

Do not add project-specific commentary to the routing test itself — the
test is generic by design.

## Step 3 — Close with the session-opening pointer

End the session by printing the exact pointer line the builder should use
to open every future session, using the real path from question 5, e.g.:

> Read `docs/model-effectiveness-playbook.md`, then start on the next
> unclaimed item in the work queue that matches your lane.

This is the one line that replaces repo re-exploration at the start of
every session — make sure it's the last thing in your output, not buried
mid-message.

## Reporting

State plainly which questions were answered, which were left as "not
established," and the exact path the playbook was written to. Label the
playbook as a fresh bootstrap output, not a finished strategic document —
it is only as complete as the interview that produced it.
