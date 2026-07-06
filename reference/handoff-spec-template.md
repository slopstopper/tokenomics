# Handoff spec: <queue item ID + title>

*A handoff spec is complete when the receiving tier can execute without asking the sending tier anything and without re-deriving any decision.*

The contract is scale-invariant: the same sections serve a session-to-session
handoff (meso — a spec file in the project's spec directory) and a
controller-to-subagent dispatch (micro — a task brief, each section a
sentence or two). Size the sections to the cycle; never drop one. An empty
"Decisions already made" means the handoff is not ready — at any scale.

Standing escalation clause, part of every handoff at every scale: if the
work turns out to fail the receiving lane's routing test, stop and hand
back early with what was learned — an early return is cheap; pushing
through is not.

- Scale: <meso (session→session) / micro (controller→subagent)>
- From lane: <flagship/mid> → To lane: <mid/small>
- Date: <date>  ·  Playbook item: <ID>

## Goal
<One paragraph: what exists when this is done.>

## Context pointers
<The exact files/docs to read first — and nothing else up front.>

## Decisions already made (do not re-derive)
<Every design decision the sending tier already paid for, each with a
one-line rationale or a pointer to where it is recorded.>

## Deliverables
<Exact files to create/modify, with expected shapes/signatures/section lists.>

## Gates
<The verification the receiving tier must run and see green before handing
back: commands + expected results.>

## Out of scope
<What the receiving tier must NOT touch, even if tempting.>
