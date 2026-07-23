# Model Effectiveness Playbook: (abstracted example)

> **What this file is.** An abstraction of the real playbook of a private,
> pre-release project. The structure, section order, table shapes, and
> working mechanics are preserved from the original; item titles, domain
> terms, findings, and identifiers have been generalized. Nothing here is
> invented (every mechanic shown was used in practice) but the specifics
> are deliberately not the real ones. The project is a browser-local
> research instrument; that is as specific as this example gets.

Status block:

- Status: active working playbook: living document, update at session end.
- Owns: cross-session work queue, model routing (which model does what),
  session protocol for working within usage limits, and the open gap register.
- Canonical for: what to work on next and which model to spend on it.
- Not canonical for: architecture, agent rules, or current repo state, those
  live in the project's own canonical docs.

Last updated: (day 24), **W8 shipped** (compositor + the one deliberate
cutover): the composition engine and its versioned contract now derive the
project's aggregate state from the real source layer built in W7; the mock
chain it replaces was retired rather than kept registered (rationale recorded
in a decision note); golden baselines re-pinned exactly once, with a written
explanation of exactly which inputs changed. All tests green; build,
typecheck, lint, format green; both standing audits run. Known limits
recorded in the decision note, all owned by **W9, now ungated; note W9
requires owner sign-off on the concept mid-session, so it needs an
interactive session.**

---

## How to use this document

At the start of a session, point the model here:

> Read `docs/model-effectiveness-playbook.md`, then start on the next
> unclaimed item in the work queue that matches your lane.

That single instruction replaces re-exploring the repo. The model gets the
strategic picture, the queue, and its lane in one read.

At the end of a session, the model updates **only**:

1. the status column of the work queue,
2. the gap register if a gap was closed or reframed,
3. the "Last updated" line.

Do not rewrite this document wholesale each session. It is a ledger, not an
essay.

---

## Strategic frame (why the queue is ordered the way it is)

From the initial assessment: the architecture and methodology discipline of
this project are strong and are not the risk. The risk is concentrated in
three things that no amount of instrument polish fixes:

1. **Data durability**: the canonical dataset lives in evictable local
   storage with no backup or restore path.
2. **Sampling validity**: a selection effect on *when* records are captured
   cannot be stratified out later, because nothing records the trigger.
3. **Statistical power**: nobody knows how many records the planned
   analyses need, so the roadmap cannot be honestly sequenced.

Every queue decision below follows one rule: **work that increases the
rate, durability, or validity of data collection outranks work that
improves how the instrument displays.** The display layer is already good.
The dataset's survival and interpretability are not yet guaranteed.

---

## Gap register

Findings from the assessment. Close a gap → mark it closed with the PR
number. Reframe a gap → note why.

| #  | Gap | Status | Severity |
| -- | --- | ------ | -------- |
| G1 | Durable store is evictable; export exists but no import/restore path | **closed**: persistence request (W1), import/restore (W2) merged | critical (data loss) |
| G2 | No sampling-frame design; no trigger field on the record; selection bias unmeasurable after the fact | **closed**: W3 added the sampling block + the schema-placement decision (see the do-not-re-derive note below) | critical (validity) |
| G3 | No formal power analysis, doable now via simulation, zero live data | **closed**: W4 built the seed-reproducible simulation harness and ran the first study; detectable-N per hypothesis recorded in the project's research protocol | high (sequencing) |
| G4 | External data source has no versioned mapping onto the project's schema | **closed**: W6 defined the mapping doc + decision record, pre-data | high (design-before-data) |
| G5 | Collection rate unaddressed: detectable-N is months-to-years away at current cadence; the designed-but-unbuilt prompting feature is the one lever | open | critical (timeline) |
| G6 | No disciplined way to look at early data: ad-hoc peeking at the first records is the likeliest protocol violation | **design closed**: W5 spec written; implementation rides in the mid lane | medium now, rises with every record |

---

## Work queue

Ordered. Each item is sized to fit one session where possible. "Lane" says
which model class should do it (see Model routing below).

> **Flagship availability window (day 21).** The owner has only a few days
> of flagship access; mid/small lanes remain available afterwards. For the
> window, **lane scarcity dominates urgency**: anything a mid model can
> execute from an existing or flagship-written spec is deferred past the
> window, even when it is the more urgent item in the abstract (W10 is the
> clearest case: the project's top rate lever, but its design already
> landed, so a mid can build it after). The window is spent exclusively on
> work only the flagship can do: data-free mathematical/statistical design
> and cross-domain formalization. Each such session leaves a mid-executable
> spec behind.

### Now (in order)

| ID | Work | Closes | Lane | Size | Status |
| -- | ---- | ------ | ---- | ---- | ------ |
| W7 | **Real source layer, slice 1.** Implement the accepted spec: mapping data module doc-locked to the versioned mapping; recorded-snapshot module with full provenance; adapter (snapshot default, dev-gated live fetch, loud fallback); signal engine + versioned contract; parallel wiring only. Invariant: golden baseline bit-identical. | - | flagship (spec-backed; mid could execute if window ends) | 1 session | **done** |
| W8 | **Compositor + the one deliberate cutover.** Compose normalized source outputs into the aggregate state with per-source contribution metadata, confidence propagation, and omission notes; rewire derivation off the mock chain; decide the mock modules' fate (retire vs. register); **golden baseline re-pinned once, with a written explanation of exactly which inputs changed.** Design-heavy: source-contract semantics are where wrong is expensive. | - | flagship | 1–1.5 sessions | **done**: mock chain retired; baselines re-pinned once with written explanation. W9 ungated (needs an interactive session: owner concept sign-off). |
| W9 | **Concept revisit against real composed state.** Re-derive what the derived display *is* when its inputs are real; owner reviews the concept before implementation lands. | - | flagship (concept needs owner sign-off mid-session) | 1–1.5 sessions | open, gated on W8 |

### After the window (mid/small lanes, spec-backed; roughly in order)

| ID | Work | Closes | Lane | Size | Status |
| -- | ---- | ------ | ---- | ---- | ------ |
| W10 | **The rate lever.** Implement the prompting/reminder design that landed earlier (unbuilt): system-timed prompts producing cleanly-labeled records; every fired prompt writes an outcome record. Still the project's top-urgency item, deferred past the window only because its design is done and a mid can execute it. | G5 | mid (escalate only if the schema needs new field decisions) | 1–2 sessions | open |
| W11 | **First-look analysis tooling: implementation** from the W5 spec: local, dev-gated runner over eligible records, reusing the harness statistics. Must exist before enough records accrue to tempt ad-hoc peeking. | G6 | mid | 1 session | open |
| W12 | Type-annotation ratchet continuation (existing build plan) | - | small | batchable: fill spare small-model budget | open |

### Later (data-gated)

| ID | Work | Lane | Gate | Status |
| -- | ---- | ---- | ---- | ------ |
| W13 | Model training, inference engine implementation, hierarchical weights | flagship | **data-gated**: do not start early | gated |

### Done (shipped queue items, ledger)

| ID | Work | Closes | Lane | Size | Status |
| -- | ---- | ------ | ---- | ---- | ------ |
| W1 | Durability slice: persistence request + diagnostics flag; tests | G1 | flagship or mid | 1 session | merged |
| W2 | Durability slice: import/restore with integrity verification. Design decisions matter here: dedupe semantics must not corrupt the append-only story. | G1 | flagship | 1 session | merged |
| W3 | Sampling-frame design + trigger field: design doc + the additive schema change with versioning decision, tests. The schema decision is the sensitive part. | G2 | flagship | 1–2 sessions | merged |
| W4 | Simulation-based power study: tooling that generates synthetic records under null + graded effect sizes, runs the real analysis pipeline, reports detectable-N per hypothesis. | G3 | flagship | 2–3 sessions | done: harness + first full run + docs in one session |
| W5 | First-look analysis tooling: **design spec only** (implementation split off as W11, mid lane): which null-baseline comparisons run, the refuse-below-detectable-N rules, evidence-label mapping, and what the runner may never report. | G6 | flagship | <1 session | done: spec written; W11 ungated |
| W6 | External-source mapping schema (taxonomy projection onto the project's dimensions, per-mapping rationale). | G4 | flagship | 1–2 sessions | done: docs only, no adapter authorized |

> **W3 schema-placement note (pre-launch finding, do not re-derive).**
> The sensitive part of W3 was where the new field lives. Two options were
> scoped:
>
> - **A, nest it under an existing key:** the record's top-level key count
>   is unchanged, so the exact-count drift guard in the record contract is
>   untouched and every existing record keeps validating.
> - **B, new top-level block:** semantically the cleaner home (the block is
>   likely to grow), but an extra top-level key normally breaks the
>   exact-count guard for already-stored records.
>
> **Finding that collapses the A-vs-B tension while still pre-launch:** the
> validator runs only on the import path, never on reads; and the durable
> store was still empty. So B's only downside (breaking already-stored or
> re-imported records) **did not exist yet**. B therefore needed no relaxed
> guard and no versioned reader: just add the key to the contract's key
> list, emit it in every record, validate the enum, update the fixtures.
>
> **Consequence:** pre-launch, A and B were **equally free on
> compatibility**, so the choice was a pure design call (B the better
> long-term home). The real constraint shifted from compatibility to
> **timing: lock the choice before the first live record is written and
> before any export file exists in the wild**, after that, the append-only
> store + re-importable exports make a top-level change expensive again.
>
> **If the flagship stays unavailable**, W3 is executable in the mid lane by
> breaking it down: (1) the design doc: the genuinely design-heavy step;
> (2) the additive schema change + validator + fixtures; (3) the capture-flow
> default. The lane was flagship for the *design* subtlety of step 1, not
> the mechanics of steps 2–3.

---

## Model routing

Three lanes. Route by the nature of the work, not by availability.

### Flagship lane: spend the premium budget here

Use the flagship when the work is **design-heavy, statistically subtle,
novel, or corpus-wide**. Its comparative advantages in this project:

- statistical/methodological design: the power study (W4), null-model
  harnesses, scoring-rule design, pre-registration templates
- cross-domain formalization: the external-source taxonomy mapping (W6)
- anything touching schema versioning or the append-only invariants, where a
  wrong design decision is expensive (W2, W3)
- whole-corpus doc consistency audits (doc drift is a first-class bug here)
- assessments like the one that produced this playbook

**Do not spend flagship budget on:** UI polish, formatting/lint chores,
status-file upkeep, branch hygiene, running CI, mechanical test additions,
or executing a spec another session already wrote. All of that is delegation
material.

### Mid lane: implementation from spec

Use for work where the design is already decided and written down:

- implementing queue items from their specs/build plans
- code review passes on PRs
- test-suite expansion against existing contracts
- doc updates that follow an established pattern

The handoff pattern that maximizes the limits: **the flagship writes the
spec in one session → a mid model executes it in the next.**

### Small lane: mechanical batches

Use for high-volume, low-judgment work with green-gate verification:

- type-annotation ratchet batches (W12)
- formatter/linter/link-fix sweeps
- status-file refreshes after merges
- archiving shipped build plans per the audit convention

### Routing rule of thumb

Ask: *"If this is done slightly wrong, is it expensive?"* Schema,
statistics, invariants, taxonomy → yes → flagship. Implementation against a
clear contract with tests → mid. Mechanical with automated verification →
small.

---

## Session protocol (usage-limit economy)

1. **One session, one queue item.** Multi-purpose sessions burn context on
   switching. If an item finishes early, update this playbook and stop,
   don't start the next big item on a depleted context window.
2. **Open with the playbook pointer**, not "explore the repo." The model
   should read this file, the specific files the queue item names, and
   nothing else up front.
3. **Spec-first for anything flagship-designed but mid-executed.** The spec
   goes in the project's spec directory per existing convention; the next
   session's model executes without re-deriving.
4. **End-of-session ledger update** (status column, gap register, date line),
   under a minute of model time, saves a full re-assessment later.
5. **Existing repo gates always apply:** typecheck + full test suite + build
   green, formatter clean, PR to protected `main`, plan/spec conventions.
   This playbook adds no exceptions.
6. **Re-assessment cadence:** ask the flagship to re-run the full assessment
   only when the "Now" queue is empty or the strategic frame feels wrong,
   not per session.

---

## Standing constraints (non-negotiable, from canonical docs)

Carried here so no session re-derives them; the linked docs are canonical.

- The measurement/interpretation boundary: nothing interpretive enters the
  measured layer or the capture flow.
- Derived output never appears before a record is captured.
- Schema changes are explicitly versioned, never silent.
- Test-mode records never enter training, contribution, or live claims.
- Priors are versioned and injectable through the config door; every
  derived row records its weights-version provenance.
- "No structure found" is a valid recorded finding, not a failure.
