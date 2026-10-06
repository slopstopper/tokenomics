---
name: tokenomics-handoff
description: "Use at the two moments the method targets token savings: when routing a task to a class of work and writing the down-tier handoff spec (session-to-session or controller-to-subagent), and when closing a session with the ledger update. Applies the three routing questions, re-scores at each boundary, flags negative-list violations, produces handoff specs a cheaper tier can execute without re-derivation, and at Dispatch, Return, and Close suggests (never runs) clearing, compacting, or switching the session's tier, offering a written handover first."
---

# Route, hand off, or close a tokenomics session

This skill operates at the cycle's switchpoints (see
`reference/portable-method.md` §Switchpoints). Mode A is the downward pair:
Route (assign the class) then Dispatch (write the down-tier spec), meso→meso
(a handoff spec into a new session) or meso→micro (a controller dispatching a
subagent). Mode B is Close: the meso cycle closing into the ledger. The
fourth switchpoint, Return, the upward crossing when a receiving tier meets
its exit bar or discovers it cannot, is covered by the Return subsection
below rather than by a mode of its own. The handoff contract is the same at
either scale, sized to the cycle.

Two modes. Pick the one the operator is actually asking for: don't run
both, and don't guess which one is wanted if the request is ambiguous, ask.

## Mode A: Route + hand off (the Dispatch switchpoint)

Use when the operator wants to know which class a task belongs in, or
wants a spec written to send it down-tier.

1. Read the project's playbook. Default path is
   `docs/model-effectiveness-playbook.md`; if it isn't there, ask the
   operator for the real path rather than assuming the default applies.
2. Read `reference/handoff-spec-template.md` (plugin root).
3. Route: apply the three questions from `reference/portable-method.md`
   Layer 1 to the task at hand, and answer each yes or no:
   - **Q1 (new ground):** Is this new ground: no precedent, pattern, or
     spec in the project to follow, or does it cross domains? (Precedent
     in the project, not in the person.)
   - **Q2 (consequence):** If it is slightly wrong, is that expensive:
     costly to fix, built on by other work, or impossible to undo?
   - **Q3 (verification):** Would checking it mean redoing it: no test,
     contract, or gate that confirms it cheaply?

   Count the yeses: 3 → pathfinder, 2 → navigator, 1 → builder,
   0 → keeper. Then apply the veto: irreversible (Q2) AND unverifiable
   (Q3) → pathfinder, whatever the count. Route down only as far as the
   project's gates reach: a task with no cheap verification scores a yes
   on Q3 however mechanical it looks. The playbook's mapping says which
   tier serves the class; never assume one.
4. State the class, the score, and the reason in one sentence. Don't pad
   this with a general opinion: the three questions are the reason, so
   cite them directly (e.g. "Builder class, score 1: Q1 no and Q3 no, this
   executes against the existing X contract with tests; Q2 yes.").
5. Dispatch: re-score before writing anything down. A decision made or a
   spec written changes the answers (precedent now exists, so Q1 is no,
   and often Q3 is no), so the class the work is handed down as may be
   lower than the class it was routed as; record the class and score in
   the spec's header (and the veto, if it applied). If the work crosses
   tiers (the session doing the routing isn't the session that will
   execute the work), produce the handoff spec from the template:
   - Fill **Decisions already made** from the *current session's actual
     decisions*: real design choices this session paid for, each with a
     one-line rationale or a pointer to where it's recorded. This section
     is the entire point of the handoff; it is what lets the receiving
     tier skip re-deriving what was already settled.
   - If there are no real decisions to record yet, leave the section
     genuinely empty and say so: an empty "Decisions already made" means
     the handoff is **not ready**, not that the section can be skipped or
     filled with a placeholder.
   - Fill every other template section (Goal, Context pointers,
     Deliverables, Gates, Out of scope) concretely: no section left as
     the template's angle-bracket placeholder text.
   - Write the spec to a new file; don't append it into the playbook.

   The re-score here is also the Dispatch nudge (see Boundary nudges
   below): dispatch lower-class parts yourself on their mapped tier; if the
   session itself should switch down, say so, with this spec as the
   handover.
6. If, in the course of this, you notice the *current* tier is about to do
   work that scores below the class its tier serves, most commonly a
   top-tier session about to do negative-list work (UI polish, lint chores, status upkeep,
   branch hygiene, running CI, mechanical test additions, executing
   someone else's spec), say so inline, plainly, before proceeding. Don't
   silently let it happen and flag it only in a later report.

Read-only toward everything in this mode except the new handoff spec file
you are producing. Do not edit the playbook, the task's source files, or
anything else as a side effect of routing.

## The Return switchpoint: early-return guidance

This is not a third mode: it is guidance for the receiving tier, the tier
that recognizes mid-cycle that its class score has risen. Return is the
upward crossing (`reference/portable-method.md` §Switchpoints), and the
class is re-scored here too. On the success path the receiving tier meets
its exit bar and hands back a report
and reviewed diff through the project's gates: ordinary, no special
handling. This subsection is the failure path.

Take the early-return path the moment re-scoring shows the work scores
higher than the class it was routed as: a task that turned out to be new
ground, to carry a cost of error nobody saw, or to have no cheap gate to
confirm it. Do not grind through. A
cheaper tier grinding out triple the turns on work it cannot do burns the
savings the routing bought, and the gates will not show it, because gates
catch defective output, not expensive output.

Write the early-return escalation artifact: what was tried, what broke, and
what decision is actually needed. It crosses the boundary the way every
artifact does, one level up and never further: hand it to the tier that
dispatched the work, not past it. An early return is cheap; pushing through
is the method's invisible failure mode.

When the operator's own session is the one whose score rose, the Return
nudge applies (Boundary nudges below): switch up for this, then back.

## Boundary nudges: clear, compact, or switch tier

Dispatch, Return, and Close are also the moments to re-decide the session
itself: whether to clear it, compact it, or switch its tier. Operators
rarely know when that moment is; that is what this section is for. At each
boundary, re-score the session as well as the work, and when the re-score
says something should change, **lead**: say what and why, do what you can
yourself, and get the rest ready. It is not new doctrine: each nudge is the
re-score at a boundary (`reference/portable-method.md` §Switchpoints),
applied to the session the operator is in. Tier inertia is what happens
when nobody re-scores.

Rules for every nudge:

- **Act where you can, prepare where you can't.** If part of the work now
  scores a lower class, dispatch it yourself to a subagent on the tier the
  operator's mapping gives that class, naming the model. That is a real
  tier switch and needs no one's command. Clearing, compacting, and
  switching the session's own model are commands only the operator can
  run: you cannot run them, so never say you did. Get everything else
  ready, so the operator's only act is typing the command you give them.
- **Speak up whenever the re-score says change.** At every boundary the
  session reaches, and whenever a long-cycle sign appears, say it plainly:
  what should change, why, and the one command it takes. Don't wait to be
  asked; operators can't ask about a moment they don't know is there. If
  the operator says not now, raise it again at the next boundary or when
  the signs have grown, not in the same breath. Being right is what keeps
  a nudge read, so tie each one to the re-score that triggered it.
- **Staying is a valid answer.** The re-score may say keep this tier, or
  keep this context. Then say nothing, or say so in one line. Staying is
  fine as long as it was decided. A decision made or a spec written does
  not mean "drop a tier" by rule.
- **Write state down, then compact.** Compacting or clearing is safe only
  when the state lives outside the context. Never suggest either until the
  state that matters is in a file, or you have offered to put it there.
- **Offer the handover, and write it on yes.** When a nudge suggests
  clearing or compacting, offer to write the re-entry brief first: a file
  the next session opens on, in the handoff-spec shape (goal, context
  pointers, decisions already made, what's next). Don't write it unasked.
  When the operator says yes, write it, then give them the command to type
  and the exact line to open the next session with. At Close, the playbook
  update is that file when it carries everything the next item needs;
  otherwise offer a handoff spec. For a switch-tier nudge, the same file is
  the down-tier handoff spec (Mode A, step 5). Chat text is not a handover:
  it dies with the context.
- **Trigger on boundaries and observable signs, never on a context
  percentage.** A skill cannot see how full the context is.

| Boundary or sign | What you observe | Nudge |
| ---------------- | ---------------- | ----- |
| **Dispatch** (a decision made) | the hard part is decided; the re-score dropped | dispatch the lower-class part yourself on its mapped tier; if the whole session should switch down, say so and offer the handoff spec as the handover |
| **Return** (escalation) | the re-score rose | say the session should switch up for this, give the command, and say when to switch back (once it is decided) |
| **Close** (unit done, ledger updated) | the session would go on to another item | say clear before the next item; offer the handover; on yes, write it and give the clear command and the re-entry line |
| **Long cycle** (a sign, not a fifth switchpoint) | the turns multiply, settled ground is being re-read, or the operator resumes after a long gap (the prompt cache has likely expired, so resuming re-writes it) | write state down, then compact with a focus, or clear and re-enter from the file |

## Mode B: Session close (the Close switchpoint)

Use when the operator wants to end a session and update the ledger.

1. Read the playbook (same default/ask rule as Mode A, step 1).
2. Update **only**:
   - the Status column of the work queue,
   - the Gap register (mark gaps closed with their PR number, or reframed
     with a stated reason if deprioritized rather than fixed; also promote
     here any finding from this session's micro cycles (a reviewer or
     subagent report) that outlives the session; this is the up-channel,
     and findings climb one cycle level at a time),
   - the "Last updated" line.
3. Re-score at Close: ask the three questions once more of the work as it
   actually turned out. The class it ran as after re-scoring may differ
   from the class planned at Route; both go in the spend line.
4. Run the spend-ledger extraction recipe from
   `docs/design/2026-07-06-spend-ledger-design.md` (or accept the operator's
   own numbers if they supply them), then append the spend line to the
   session's ledger entry. Record the entry field first: `pointer` if the
   session opened on the playbook pointer or a handoff spec and took a
   queue item, `ad-hoc` otherwise. It is a record of how the session
   actually started, not a compliance grade, and it is what makes the
   protocol-followed-vs-lapsed comparison computable later. The lane field
   records the class planned at Route and the class it ran as after
   re-scoring (`class planned→class ran`). Refuse savings language per the design spec's
   never-claim rules: never assert savings against an unmeasured baseline,
   never compare the counterfactual-flagship ratio across projects as a
   quality measure, never fold in a test/throwaway session unlabeled, and
   never quote the ratio without its price-table date and token-volume
   assumption.
5. Refuse wholesale rewrites. If asked to restructure the strategic frame,
   re-order the queue wholesale, or otherwise rewrite substantial sections
   mid-close, don't do it: note it instead as a re-assessment candidate
   (a line in the Gap register or your reply saying the frame may need a
   full re-assessment pass, per the method's rule that re-assessment is
   reserved for an empty queue or a wrong-feeling frame, not folded into a
   routine close).
6. Leave the strategic frame, standing constraints, model routing section,
   and session protocol untouched: those are not close-time edits.
7. Once the ledger is written, the Close nudge applies (Boundary nudges
   above): if the session would go on to another item, say it should clear
   first and offer the handover; on yes, write it and give the command and
   the re-entry line.

Read-only toward everything except the playbook itself in this mode, and
the handoff spec file if the operator accepts the handover offer. Do not
touch source code, other specs, or other docs while closing a session.

## Shared constraints

- Never invent a lane, a decision, or a gap that wasn't actually stated by
  the operator or actually recorded in the current session.
- If the playbook can't be found and the operator can't say where it is,
  stop and say so: don't proceed on a guessed path.
- Quote the three questions verbatim when applying them; don't paraphrase
  them into something softer.
