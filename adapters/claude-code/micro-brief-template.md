# Micro-brief template (Claude Code subagent dispatch)

A **micro brief** is the handoff-spec contract
(`../../reference/handoff-spec-template.md`) at its smallest size: what a
controller session hands a native subagent (the Task / Agent tool) at the
**Dispatch** switchpoint. The contract is scale-invariant — the same sections
serve a session-to-session handoff and a controller-to-subagent dispatch — so
**no section is dropped, only shortened** to a sentence or two. Paste the
filled brief as the subagent's prompt.

*A brief is complete when the subagent can execute without asking the
controller anything and without re-deriving any decision. An empty "Decisions
already made" means the brief is not ready — at any scale.*

**Standing escalation clause (always in force):** if the work turns out to
fail the receiving lane's routing test, stop and hand back early with what was
learned. An early return is cheap; pushing through is not. The subagent
returns its findings in its report, never as leaked context (the Surfacing
rule, Layer 4).

## Template

```
Handoff: <ID + one-line title> · micro · <from-lane> → <to-lane>
Goal: <one sentence: what exists when this is done>
Context pointers: <the exact files/docs to read first, and nothing else>
Decisions already made: <every choice the controller already paid for, each
  with a one-line reason or a pointer to where it is recorded>
Deliverables: <exact files to create/modify, with the expected shape>
Gates: <the verification to run and see green before handing back>
Out of scope: <what not to touch, even if tempting>
Standing escalation clause applies.
```

## Worked example

The whole brief, filled (from the method doc's Layer 4):

> Handoff: Q-17 status-table refresh · micro · mid → small
> **Goal:** the six status rows in the catalog doc match the done ledger.
> **Context pointers:** the catalog doc; the playbook's done ledger; nothing
> else. **Decisions already made:** row order stays (readers link to
> anchors); status wording copied verbatim from the ledger.
> **Deliverables:** the catalog doc, status column only. **Gates:** link gate
> green; diff touches one column. **Out of scope:** every other column and all
> surrounding prose. Standing escalation clause applies.

## Notes for Claude Code dispatch

- **Route before you dispatch.** Assign the lane with the routing test first
  ("If this is done slightly wrong, is it expensive?" — see the recipe's Route
  step). The brief's `from-lane → to-lane` records that decision; a subagent
  is a micro cycle running one lane below the controller.
- **One brief, one subagent, one queue-sized unit of work.** If a brief needs
  more than a couple of sentences per section, the unit is too big to dispatch
  — split it or keep it in the controller.
- **Parallelize only independent, down-lane-verifiable work** (the Parallelism
  rule). Parallel flagship-lane dispatches are a smell: work that needs
  flagship judgment usually needs the one context that holds the frame.
