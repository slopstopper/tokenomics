# Model Effectiveness Playbook: <project name>

Status block:

- Status: active working playbook, living document, update at session end.
- Owns: cross-session work queue, model routing, session protocol, gap register.
- Canonical for: what to work on next and which model tier to spend on it.
- Not canonical for: <architecture docs / agent rules / repo state: list the project's own canonical docs>.

Last updated: <date>, <one-line state>

## How to use this document

At the start of a session, point the model here:

> Read `<path to this file>`, then start on the next unclaimed item in the
> work queue that matches your lane.

At the end of a session, the model updates **only**: the status column of the
work queue, the gap register if a gap was closed or reframed, the
"Last updated" line, and the spend line:

```
spend: lane <planned>→<ran> · dispatches <N> · out-tokens flagship <F> / mid <M> / small <S> · cf-flagship <R> (prices <as-of date>)
```

This document is a ledger, not an essay; the spend line is records, not claims:
it never asserts savings.

## Strategic frame

<Why the queue is ordered the way it is: the risks that dominate, and the
one ordering rule every queue decision follows. Written at bootstrap;
rewritten only at re-assessment.>

## Gap register

| # | Gap | Status | Severity |
| - | --- | ------ | -------- |
| G1 | <finding> | open | <severity (what it costs if unaddressed)> |

## Work queue

### Now (in order)

| ID | Work | Closes | Lane | Size | Status |
| -- | ---- | ------ | ---- | ---- | ------ |
| W1 | <item sized to one session> | G1 | <flagship/mid/small> | <sessions> | open |

### Later (gated)

| ID | Work | Lane | Gate | Status |
| -- | ---- | ---- | ---- | ------ |

### Done (ledger: keep rows verbatim, including do-not-re-derive notes)

## Model routing

<The project's lanes. Name the tiers you actually have access to and their
limit shape. For each lane: what it does here, and the negative list for the
premium lane. Copy the routing test:>

Ask: **"If this is done slightly wrong, is it expensive?"** → flagship.
Clear contract with tests → mid. Mechanical with automated verification → small.

## Session protocol

1. One session, one queue item; finish early → update this playbook and stop.
2. Open with the playbook pointer, not "explore the repo."
3. Spec-first for anything designed in one lane and executed in another
   (specs live in `<project spec path>`).
4. End-of-session ledger update: status column, gap register, date line.
5. Existing project gates always apply: <build/test/lint commands>.
6. Re-assess only when the Now queue is empty or the strategic frame feels wrong.

## Standing constraints (non-negotiable, from canonical docs)

<Carried here so no session re-derives them; the linked docs stay canonical.>
