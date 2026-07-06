---
name: tokenomics-handoff
description: Use at the two moments tokens are saved — when routing a task to a lane and writing the down-tier handoff spec, and when closing a session with the ledger update. Applies the routing test, flags negative-list violations, and produces handoff specs a cheaper tier can execute without re-derivation.
---

# Route, hand off, or close a tokenomics session

Two modes. Pick the one the builder is actually asking for — don't run
both, and don't guess which one is wanted if the request is ambiguous, ask.

## Mode A — Route + hand off

Use when the builder wants to know which lane a task belongs in, or wants
a spec written to send it down-tier.

1. Read the project's playbook. Default path is
   `docs/model-effectiveness-playbook.md`; if it isn't there, ask the
   builder for the real path rather than assuming the default applies.
2. Read `reference/handoff-spec-template.md` (plugin root).
3. Apply the routing test from `reference/portable-method.md` to the task
   at hand: **"If this is done slightly wrong, is it expensive?"**
   Yes → flagship. Clear contract with tests → mid. Mechanical with
   automated verification → small.
4. State the lane and the reason in one sentence. Don't pad this with a
   general opinion — the routing test is the reason, so cite it directly
   (e.g. "Mid lane — this executes against the existing X contract with
   tests, no novel judgment call.").
5. If the work crosses tiers (the session doing the routing isn't the
   session that will execute the work), produce the handoff spec from the
   template:
   - Fill **Decisions already made** from the *current session's actual
     decisions* — real design choices this session paid for, each with a
     one-line rationale or a pointer to where it's recorded. This section
     is the entire point of the handoff; it is what lets the receiving
     tier skip re-deriving what was already settled.
   - If there are no real decisions to record yet, leave the section
     genuinely empty and say so: an empty "Decisions already made" means
     the handoff is **not ready**, not that the section can be skipped or
     filled with a placeholder.
   - Fill every other template section (Goal, Context pointers,
     Deliverables, Gates, Out of scope) concretely — no section left as
     the template's angle-bracket placeholder text.
   - Write the spec to a new file; don't append it into the playbook.
6. If, in the course of this, you notice the *current* tier is about to do
   work that fails its own routing test — most commonly a flagship session
   about to do negative-list work (UI polish, lint chores, status upkeep,
   branch hygiene, running CI, mechanical test additions, executing
   someone else's spec) — say so inline, plainly, before proceeding. Don't
   silently let it happen and flag it only in a later report.

Read-only toward everything in this mode except the new handoff spec file
you are producing. Do not edit the playbook, the task's source files, or
anything else as a side effect of routing.

## Mode B — Session close

Use when the builder wants to end a session and update the ledger.

1. Read the playbook (same default/ask rule as Mode A, step 1).
2. Update **only**:
   - the Status column of the work queue,
   - the Gap register (mark gaps closed with their PR number, or reframed
     with a stated reason if deprioritized rather than fixed),
   - the "Last updated" line.
3. Refuse wholesale rewrites. If asked to restructure the strategic frame,
   re-order the queue wholesale, or otherwise rewrite substantial sections
   mid-close, don't do it — note it instead as a re-assessment candidate
   (a line in the Gap register or your reply saying the frame may need a
   full re-assessment pass, per the method's rule that re-assessment is
   reserved for an empty queue or a wrong-feeling frame, not folded into a
   routine close).
4. Leave the strategic frame, standing constraints, model routing section,
   and session protocol untouched — those are not close-time edits.

Read-only toward everything except the playbook itself in this mode. Do
not touch source code, specs, or other docs while closing a session.

## Shared constraints

- Never invent a lane, a decision, or a gap that wasn't actually stated by
  the builder or actually recorded in the current session.
- If the playbook can't be found and the builder can't say where it is,
  stop and say so — don't proceed on a guessed path.
- Quote the routing test verbatim when applying it; don't paraphrase it
  into something softer.
