# Model Effectiveness Playbook: analytical desk (illustrative example)

> **What this file is.** A second worked example, in a non-code domain, to
> show the method carries outside software. It models a one-person
> *analytical desk*: a standing research operation that maintains a
> longitudinal evidence base on a structural phenomenon across several
> sectors and publishes recurring briefs plus a periodic synthesis. The
> structure, section order, table shapes, and every working mechanic are the
> same as the code example next door, only the domain vocabulary changes:
> gaps close with a **brief ID or published URL**, not a PR number; the
> gates are a **fact-check pass and a source-trace check**, not typecheck and
> lint; deliverables are **briefs and datasets**, not diffs. It is
> illustrative rather than an abstraction of one real desk, but every
> mechanic shown is one the method actually prescribes.

Status block:

- Status: active working playbook, living document, update at session end.
- Owns: cross-session work queue, model routing (which model does what),
  session protocol for working within usage limits, and the open gap register.
- Canonical for: what to work on next and which model to spend on it.
- Not canonical for: the analytical framework itself, house style, or the
  current state of the evidence base, those live in the desk's own canonical
  docs (the codebook, the style guide, the evidence log).

Last updated: (day 24), **W8 shipped** (cross-sector synthesis + the one
deliberate reframe): the synthesis now composes the per-sector findings into
the aggregate thesis using the real evidence base built in W7; the provisional
working taxonomy it replaces was retired rather than kept alongside (rationale
in a decision note); the exemplar case set re-pinned exactly once, with a
written explanation of which classifications changed. Fact-check pass clear,
every claim source-traced, coverage log current. Known limits recorded in the
decision note, all owned by **W9, now ungated; note W9 requires the analyst's
sign-off on the thesis framing mid-session, so it needs an interactive
session.**

---

## How to use this document

At the start of a session, point the model here:

> Read `model-effectiveness-playbook.md`, then start on the next unclaimed
> item in the work queue that matches your lane.

That single instruction replaces re-reading the whole evidence base and
re-explaining the desk. The model gets the strategic picture, the queue, and
its lane in one read.

At the end of a session, the model updates **only**:

1. the status column of the work queue,
2. the gap register if a gap was closed or reframed,
3. the "Last updated" line.

Do not rewrite this document wholesale each session. It is a ledger, not an
essay.

---

## Strategic frame (why the queue is ordered the way it is)

From the initial assessment: the desk's writing and analytical instincts are
strong and are not the risk. The risk is concentrated in three things that no
amount of publishing polish fixes:

1. **Framework validity**: the classification the desk uses to decide what
   counts as an instance of the tracked phenomenon was set early and every
   brief depends on it; a wrong boundary is expensive to unwind once it has
   already been published under.
2. **Evidence provenance**: observations logged without a captured source
   snapshot and date cannot be re-verified later; links rot, and a claim you
   can't trace is a claim you can't defend when challenged.
3. **Coverage honesty**: the desk covers whatever crosses the analyst's
   feed, and nothing records which sectors and periods went *unscanned*, so
   coverage bias cannot be characterized or disclosed.

Every queue decision below follows one rule: **work that increases the
integrity, traceability, or coverage-honesty of the evidence base outranks
work that increases how much gets published.** The output cadence is already
healthy. The evidence base's defensibility is not yet guaranteed.

---

## Gap register

Findings from the assessment. Close a gap → mark it closed with the brief ID
or published URL that resolved it. Reframe a gap → note why.

| #  | Gap | Status | Severity |
| -- | --- | ------ | -------- |
| G1 | Evidence-log entries cite live links only; no captured snapshot, so claims become unverifiable as sources move or vanish | **closed**: source-snapshot convention (W1), re-verification workflow (W2) adopted | critical (defensibility) |
| G2 | No classification codebook; observations tagged ad hoc, inter-entry consistency unmeasurable | **closed**: W3 wrote the codebook + the definitional-boundary decision (see the do-not-re-derive note below) | critical (validity) |
| G3 | No coverage log: what was scanned vs. skipped is unrecorded; selection bias uncharacterizable after the fact | **closed**: W4 designed the coverage log + the non-coverage disclosure rule | high (honesty) |
| G4 | External datasets are cited with no versioned crosswalk onto the desk's own categories | **closed**: W6 built the crosswalk doc + decision record, before any synthesis leaned on it | high (design-before-synthesis) |
| G5 | Publishing cadence outruns verification: briefs get drafted faster than the fact-check pass clears them; the designed-but-unbuilt verification workflow is the one lever | open | critical (timeline/risk) |
| G6 | No disciplined way to look at partial evidence: drawing an early conclusion from thin evidence is the likeliest analytical error | **design closed**: W5 spec written; implementation rides in the mid lane | medium now, rises with every published brief |

---

## Work queue

Ordered. Each item is sized to fit one session where possible. "Lane" says
which model class should do it (see Model routing below).

> **Flagship availability window (day 21).** The analyst has only a few days
> of flagship access; mid/small lanes remain available afterwards. For the
> window, **lane scarcity dominates urgency**: anything a mid model can
> execute from an existing or flagship-written spec is deferred past the
> window, even when it is the more urgent item in the abstract (W10 is the
> clearest case: the desk's top risk lever, but its design already landed,
> so a mid can build it after). The window is spent exclusively on work only
> the flagship can do: framework design, cross-sector synthesis, and the
> definitional calls where wrong is expensive. Each such session leaves a
> mid-executable spec behind.

### Now (in order)

| ID | Work | Closes | Lane | Size | Status |
| -- | ---- | ------ | ---- | ---- | ------ |
| W7 | **Evidence base, slice 1.** Implement the accepted framework spec: the classification codebook locked into the intake form; the evidence-log schema with full provenance fields (source snapshot, capture date, coverage tag); the coverage log wired in. No synthesis claims yet: logging discipline only. | - | flagship (spec-backed; mid could execute if window ends) | 1 session | **done** |
| W8 | **Cross-sector synthesis + the one deliberate reframe.** Compose the per-sector findings into the aggregate thesis with per-sector contribution notes, confidence propagation, and explicit gaps; retire the provisional working taxonomy vs. keep it alongside: **decided: retire.** Exemplar case set re-pinned once, with a written explanation of exactly which classifications changed. Design-heavy: the synthesis boundary is where wrong is expensive. | - | flagship | 1–1.5 sessions | **done**: provisional taxonomy retired; exemplar set re-pinned once with written explanation. W9 ungated (needs an interactive session, analyst thesis sign-off). |
| W9 | **Thesis revisit against the composed evidence.** Re-derive what the desk's headline claim *is* now that it rests on the full evidence base; the analyst reviews the framing before any brief publishes it. | - | flagship (framing needs analyst sign-off mid-session) | 1–1.5 sessions | open, gated on W8 |

### After the window (mid/small lanes, spec-backed; roughly in order)

| ID | Work | Closes | Lane | Size | Status |
| -- | ---- | ------ | ---- | ---- | ------ |
| W10 | **The verification runner.** Implement the fact-check workflow that landed earlier (unbuilt): every drafted claim routed through source-trace + numbers-reconcile checks before publish, with a cleared/blocked outcome logged per claim. Still the desk's top-risk item, deferred past the window only because its design is done and a mid can execute it. | G5 | mid (escalate only if a claim needs a new codebook category decision) | 1–2 sessions | open |
| W11 | **Partial-evidence guardrail: implementation** from the W5 spec: a checklist the desk runs before drawing any cumulative or comparative claim, refusing conclusions below the disclosed-coverage threshold. Must exist before enough briefs accrue to tempt an early cumulative claim. | G6 | mid | 1 session | open |
| W12 | Citation-format + source-log normalization batch (house style) | - | small | batchable: fill spare small-model budget | open |

### Later (evidence-gated)

| ID | Work | Lane | Gate | Status |
| -- | ---- | ---- | ---- | ------ |
| W13 | Periodic longitudinal synthesis: cross-period trend claims, comparative sector ranking | flagship | **evidence-gated**: do not start before the coverage log can characterize the base | gated |

### Done (shipped queue items, ledger)

| ID | Work | Closes | Lane | Size | Status |
| -- | ---- | ------ | ---- | ---- | ------ |
| W1 | Provenance slice: source-snapshot capture convention + a diagnostics note on link rot; applied to new entries | G1 | flagship or mid | 1 session | published |
| W2 | Provenance slice: re-verification workflow for already-logged claims, with an integrity check. Design decisions matter here: a re-verify must not silently overwrite the original captured claim. | G1 | flagship | 1 session | published |
| W3 | Classification codebook + definitional boundary: the codebook doc + the boundary decision with a versioning rule. The boundary decision is the sensitive part. | G2 | flagship | 1–2 sessions | published |
| W4 | Coverage-honesty method: how the desk records what it scanned and discloses what it didn't, so coverage bias is stated rather than hidden. | G3 | flagship | 2–3 sessions | done: method + first coverage-log pass + docs in one session |
| W5 | Partial-evidence guardrail: **design spec only** (implementation split off as W11, mid lane): which cumulative claims are allowed below what coverage threshold, the refuse-below-threshold rules, the confidence-label mapping, and what a brief may never state. | G6 | flagship | <1 session | done: spec written; W11 ungated |
| W6 | External-dataset crosswalk (mapping outside categories onto the desk's own dimensions, per-mapping rationale). | G4 | flagship | 1–2 sessions | done: crosswalk doc only, no synthesis authorized |

> **W3 definitional-boundary note (early finding: do not re-derive).**
> The sensitive part of W3 was where to draw the boundary of the core
> category: what counts as an instance of the tracked phenomenon versus an
> adjacent one. Two options were scoped:
>
> - **A, narrow boundary:** count only clear-cut instances. Inter-entry
>   agreement stays high and every published claim is easy to defend, but the
>   desk undercounts and misses the borderline cases the thesis may most need.
> - **B, broad boundary with a graded-confidence tag:** capture borderline
>   cases with an explicit confidence label. Semantically the richer home (the
>   borderline band is where the interesting movement is), but a broad
>   boundary normally means every past brief's counts must be recomputed when
>   the boundary is later refined.
>
> **Finding that collapses the A-vs-B tension while still early:** the desk
> had published only a handful of briefs and none had yet stated a *cumulative
> count*: every claim so far was case-specific. So B's only real downside
> (invalidating already-published cumulative counts) **did not exist yet.** B
> therefore needed no recount and no erratum: just adopt the graded-confidence
> tag in the codebook, re-tag the handful of already-logged cases, and state
> the confidence convention once.
>
> **Consequence:** while still early, A and B were **equally free on
> published-record consistency**, so the choice was a pure analytical-quality
> call (B the better long-term home). The real constraint shifted from
> consistency to **timing: lock the boundary before the first brief states a
> cumulative count and before any outside party cites one**, after that,
> published counts and citations make a boundary change expensive again.
>
> **If the flagship stays unavailable**, W3 is executable in the mid lane by
> breaking it down: (1) the codebook design, the genuinely design-heavy step;
> (2) the mechanical re-tag of existing cases + the confidence-label addition;
> (3) the intake-form default. The lane was flagship for the *design*
> subtlety of step 1, not the mechanics of steps 2–3.

---

## Model routing

Three lanes. Route by the nature of the work, not by availability.

### Flagship lane: spend the premium budget here

Use the flagship when the work is **framework-defining, analytically subtle,
novel, or corpus-wide**. Its comparative advantages on this desk:

- framework and method design: the classification codebook (W3), the
  coverage-honesty method (W4), the partial-evidence rules (W5)
- cross-sector synthesis and formalization: composing per-sector findings into
  one thesis (W8), the external-dataset crosswalk (W6)
- anything touching the category boundary or the confidence conventions, where
  a wrong call is expensive because it is already published under (W3)
- whole-corpus consistency audits (a definition drifting across briefs is a
  first-class error here)
- assessments like the one that produced this playbook

**Do not spend flagship budget on:** drafting a brief from an agreed outline,
formatting citations, normalizing the source log, cross-posting, deadline and
status upkeep, or executing an analysis spec another session already wrote.
All of that is delegation material.

### Mid lane: execution from an agreed spec

Use for work where the framing is already decided and written down:

- drafting a brief from an agreed thesis and outline
- the fact-check pass: source-trace and numbers-reconcile against the record
- evidence-log expansion against the settled schema
- brief updates that follow an established template

The handoff pattern that maximizes the limits: **the flagship settles the
thesis and writes the outline in one session → a mid model drafts and
fact-checks it in the next.**

### Small lane: mechanical batches

Use for high-volume, low-judgment work with a checkable gate:

- citation formatting to house style (W12)
- source-log normalization and link-checking sweeps
- status refreshes after a brief publishes
- archiving shipped briefs per the desk's filing convention

### Routing rule of thumb, and the axis that matters most here

Ask: *"If this is done slightly wrong, is it expensive?"* A category
boundary, a synthesis claim, a coverage-bias call → yes → flagship. Drafting
against an agreed thesis with a fact-check gate → mid. Mechanical with a
checkable gate → small.

The second axis earns its keep on an analytical desk more than anywhere,
because the desk's work splits cleanly by **whether a cheap gate exists.** A
*fact-checkable* claim has one (does this quote match the source, does this
number reconcile) so it routes down safely to mid or small; the gate catches
a wrong answer without anyone having to redo the judgment. A *framing* call
(where the category boundary sits, whether the synthesis holds, what the
coverage log is allowed to claim) has **no cheap gate**: checking it means
re-doing the analysis, and the wrong version reads exactly as fluently as the
right one. So it stays flagship even when it looks like "just writing one
sentence." Route down only as far as your gates reach.

---

## Session protocol (usage-limit economy)

1. **One session, one queue item.** Multi-purpose sessions burn context on
   switching. If an item finishes early, update this playbook and stop:
   don't start the next big item on a depleted context window.
2. **Open with the playbook pointer**, not "re-read the whole evidence base."
   The model should read this file, the specific docs the queue item names
   (the codebook, the relevant sector log), and nothing else up front.
3. **Spec-first for anything flagship-framed but mid-executed.** The thesis +
   outline goes in the desk's brief-spec folder per existing convention; the
   next session's model drafts without re-deriving the framing.
4. **End-of-session ledger update** (status column, gap register, date line),
   under a minute of model time, saves a full re-assessment later. The
   update also carries a spend line: lane planned vs. run, how many briefs or
   passes ran, rough output by tier.
5. **Existing desk standards always apply:** every published claim traces to a
   captured source, the fact-check pass clears before publish, numbers
   reconcile, house style holds. This playbook adds no exceptions.
6. **Re-assessment cadence:** ask the flagship to re-run the full assessment
   only when the "Now" queue is empty or the strategic frame feels wrong,
   not per session.

---

## Standing constraints (non-negotiable, from canonical docs)

Carried here so no session re-derives them; the linked docs are canonical.

- The observation/interpretation boundary: logged evidence is never edited to
  fit the thesis; interpretation lives in the brief, not in the record.
- No cumulative or comparative claim publishes before the coverage log can
  characterize what it rests on.
- Codebook and category changes are explicitly versioned, never silent.
- Provisional or low-confidence cases never enter a headline count without the
  confidence label attached.
- Every published figure records which evidence-base version it was computed
  from.
- "No pattern found" or "insufficient evidence" is a valid publishable
  finding, not a failure.
