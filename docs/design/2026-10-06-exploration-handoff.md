# Handoff spec: exploration and minimal entry (#42 with #29, v0.5.0)

*A handoff spec is complete when the receiving tier can execute without asking the sending tier anything and without re-deriving any decision.*

Standing escalation clause: if the work turns out to score differently
from the class it was handed over as, say so at Route and re-score; an
early return is cheap, pushing through is not.

- Scale: meso (session → fresh session)
- **Scope: tokenomics only.** No other slopstopper repo.
- From class: builder/navigator (the 2026-10-04/06 session: #35, W16,
  W15 step 1) → To class: **pathfinder**.
  - Q1 yes: no precedent in the method for an exploration phase or an
    amendment route.
  - Q2 yes: method doctrine that #29 and every later handover build on.
  - Q3 yes: no gate confirms a design call.

  Under this repo's mapping, pathfinder → **top tier**.
- Date: 2026-10-06 · Issues: #42 (G15), #29 · Playbook: G13, G14, G15
- Branch: start from `main`'s tip. Fetch before reading (G10). Use the
  session's designated branch; if none is given, `method/42-exploration`.

## What kind of session this is

**Exploration first.** This handoff is deliberately *not* a spec to
execute. Nothing below asks you to build anything until a direction has
been chosen with the owner. Per the exploration guard (shipped on #41),
staying in exploration is the default until a decision lands. Many turns,
options weighed and discarded, and ideas challenged are expected here,
not a sign to wrap up.

**Challenge is welcome; re-derivation is not.** "Decisions already made"
below are settled: don't redo their reasoning. If one looks wrong, or
conflicts with something you read, **say so** (what, why, what you'd
change) and let the owner decide. Don't resolve it silently. That silent
resolution is half of what #42 is about.

## Reading receipt (required, G13 / #37)

Your first output lists every pointer below as read / not read, the
decisions you took from each, and **any concern you have with those
decisions** (one line each, or "none"). That last column is new: it is
the first test of #42's direction 1. Read all of them before starting.

## Context pointers (read these, in this order, and nothing else up front)

1. This file, whole.
2. Issue **#42**, the question itself: how exploration gets crushed, four
   directions, what's unknown.
3. Issue **#29**, body: minimal entry, the owner's correction ("drop a
   tier once the spec is written" is not a rule), and its open questions
   (idea-work with no boundary; whether W6 is wrong for exploration).
4. `docs/model-effectiveness-playbook.md`: the seventeenth update (top),
   gaps G13, G14 and G15, the Model routing section.
5. `reference/portable-method.md`: §The cycle (the escalation rule),
   §Switchpoints (including the new nudge paragraph), Layer 1
   (re-scoring; exploration scores navigator), §When this doesn't pay
   (W6).
6. `skills/tokenomics-handoff/SKILL.md`: the Return subsection and the
   Boundary nudges section (the exploration guard is there).
7. `reference/handoff-spec-template.md`: "Decisions already made (do not
   re-derive)" is one of the things under question.
8. Issues **#37** (reading receipt) and **#30** (the latest comment: the
   agent leads).

## Decisions already made (do not re-derive; challenge if wrong)

Stated in full, not only pointed at.

- **Routing (#25, shipped v0.5):** a lane is a class of work. There are
  three questions; count the yeses; the veto; re-score at every
  boundary. Exploration scores 2 (navigator) and is passed up by
  escalation. The class → tier mapping is the operator's; this repo's is
  1:1 (pathfinder → top, navigator → second, builder → mid, keeper →
  small). Effort per class is set by data, not yet fixed.
- **Nudges (#30, owner 2026-10-06):**
  - The agent leads. It speaks up whenever the re-score says change. It
    dispatches lower-class work itself on the mapped tier, naming the
    model. It prepares the operator's own clear / compact / model switch
    so the operator only types the command.
  - Handovers are offered and written on yes, never unasked.
  - Exploration is left alone until a decision lands, then the agent
    offers to write down what was considered and ruled out.
  - This superseded "rare and right" (2026-10-03).
- **#29 (owner correction):** don't turn "the spec is written, so drop a
  tier" into a rule. Staying is valid when decided. Much work never
  produces a spec.
- **Provenance (G14 / #39):** "owner-directed" goes only on the owner's
  actual decisions. Your choices are labelled as yours until confirmed.
  The PR names every rule or process change in its diff.
- **Merging (owner, all slopstopper repos):** `main` requires review.
  Open the PR at Close and stop. Never merge or approve unless the owner
  explicitly asks (admin bypass).
- **Spend line:** lead with `entry pointer`. Name the model on every
  dispatch (G12).
- **History rule:** dated records stay as written; live guidance
  changes.

## The questions (to explore with the owner, not to answer alone)

1. **Where does the crushing come from?** The candidates are the handoff
   format ("do not re-derive" suppressing challenge), the single upward
   channel (escalation means failure), the spend frame (exploration reads
   as waste), and routing and nudge pressure toward closure. #42 has n = 1
   evidence. What does the owner's wider use say?
2. **#42's four directions.** Each needs a yes, a no or a shape:
   - a challenge line in the reading receipt;
   - an amendment route beside escalation;
   - exploration as a phase with a "considered and ruled out" exit
     artifact;
   - W6 revisited.

   Which are doctrine, which are template changes, and which are ceremony?
3. **#29's shape, given the answer above.** The candidate minimal entry is
   the three questions, the handoff template and "re-decide the tier at
   every boundary". Does it need an exploration rule too? If the minimal
   entry crushes exploration, it fails the people it's for ("I don't know
   which model to use, so I use the biggest").
4. **The spend frame.** Should the spend line mark exploration so it
   never reads as waste? Note the conflict: the six provisional fields
   don't reach adopters until the data justifies them.

## Deliverables

1. **A recorded direction**, agreed with the owner, as a comment on #42
   (and on #29 if its shape changed). This is the main output. Ruling
   things out counts.
2. **A short design note** in `docs/design/`: options considered, options
   ruled out and why, and the chosen direction with its open questions.
   This is the "considered and ruled out" artifact, and it doubles as a
   first trial of #42's direction 3.
3. **Only if the owner agrees a direction is settled enough:** a spec for
   the implementing session, re-scored (likely builder), as a handoff.
   Implementing in this session is out of scope unless the owner asks.
4. **Ledger close:** the playbook update line plus the spend line, with
   `entry pointer` first; mark the exploration as such.
5. **Open the PR at Close and stop.**

## Gates

Run `.github/workflows/gates.yml`'s checks locally before every push.
Editing guarded skill text turns evals UNRESOLVED: re-anchor in the same
commit and never delete an assertion silently.

## Out of scope

- Implementing any direction before the owner has chosen it.
- W15 delivery steps 2 and 3 (hooks, status-line recipe), and the
  superpowers note: still on #30.
- W17 (the owner's review of the #4 spend-ledger design).
- W14: held for slopstopper/recursive-spine#133.
- `main`'s ruleset (the owner, later).
- Shipping the provisional spend fields to adopters.
- Any other slopstopper repo.

## What's after this (for orientation only)

#29 implementation (class set by the chosen direction) → behavioural
evals for the three questions (builder) → release v0.5.0 (keeper;
`RELEASING.md`; owner review, merge only on the owner's request; never
tag by hand).
