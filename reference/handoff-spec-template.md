# Handoff spec: <queue item ID + title>

*A handoff spec is complete when the receiving tier can execute without asking the sending tier anything and without re-deriving any decision.*

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
