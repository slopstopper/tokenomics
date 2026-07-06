# Model Effectiveness Playbook — tokenomics

Status block:

- Status: active working playbook — living document, update at session end.
- Owns: this repo's cross-session work queue, model routing, session
  protocol, and gap register.
- Canonical for: what to work on next in this repo and which model tier to
  spend on it.
- Not canonical for: the method itself (`reference/portable-method.md`) or
  the v0.1/v0.2 design record (`docs/design/`).

Last updated: 2026-07-06 (third update) — **spend ledger shipped, v0.3.0**:
the spend line is live in the playbook template, the handoff skill's Mode B,
and the method doc's Layer 2 and cycle section; W1 done. Prior update same
day: **repo protocols live**: branch + PR flow with protected `main`, gates
enforced in CI (`.github/workflows/gates.yml`), CONTRIBUTING.md added;
session protocol rules 5–6 now carry the flow. Before that: **v0.2 shipped**
— the cycle section (macro / meso / micro nesting, context-compression
thesis, up-channel rule) added to the method doc; handoff-spec template made
scale-invariant; handoff skill and README updated to match.

## How to use this document

At the start of a session, point the model here:

> Read `docs/model-effectiveness-playbook.md`, then start on the next
> unclaimed item in the work queue that matches your lane.

At the end of a session, the model updates **only**: the status column of
the work queue, the gap register if a gap was closed or reframed, and the
"Last updated" line. This document is a ledger, not an essay.

## Strategic frame

This repo is a method extraction: its value is that the method is portable,
honest about its maturity, and enforceable in practice. The binding risk is
**claims without evidence** — the method asserts token savings but records
none, so the practice report cannot currently be checked against its own
history. Ordering rule: **work that makes the method's claims falsifiable
outranks work that adds surface area.**

## Gap register

| # | Gap | Status | Severity |
| - | --- | ------ | -------- |
| G1 | No spend record — the method claims savings but no session logs its lane, scale of work, or handoff count; the practice report is unfalsifiable against its own history | design closed + implementation shipped — spend line live in template/skill/method doc | high (credibility) |
| G2 | Session-start discipline is manual — nothing injects the playbook pointer; every adopting project relies on the builder remembering the protocol | open — W2 queued | medium |
| G3 | Single-project validation — the method has one source project; a second adopter would test whether the lanes and playbook components transfer | open — **reframed 2026-07-06**: the repo has been shared and adopters are expected, so this is now actionable — collect adopter feedback and route findings into W3 | medium (maturity) |

## Work queue

### Now (in order)

| ID | Work | Closes | Lane | Size | Status |
| -- | ---- | ------ | ---- | ---- | ------ |
| W1 | **Spend-ledger convention (v0.3).** Design the minimal per-session spend line: what a session records (lane used, rough scale of work — turns or dispatches, not exact token counts unless cheaply available — and handoff count), where it lives (a column or sub-line in the playbook's ledger update, not a new file), and what it may never claim (no savings assertions, records only). Then: template gains the field, handoff skill's Mode B writes it, method doc's Layer 2 documents it. Design-heavy first half (what to record without turning the ledger into an essay is the expensive-to-get-wrong part); mechanical second half. | G1 | flagship (design), mid (the template/skill edits from the design) | 1 session | done |
| W2 | **Session-start playbook-pointer hook.** A small installable hook (Claude Code `SessionStart`) that injects the playbook pointer automatically; ships as an optional extra with install notes, not a default. Spec-first: W1's design session should leave the spec behind if window time remains. | G2 | mid | 1 session | open — gated on a written spec |

### Later

| ID | Work | Lane | Gate | Status |
| -- | ---- | ---- | ---- | ------ |
| W3 | Adopter feedback pass — revisit lane boundaries and playbook components against real external adoptions (repo shared 2026-07-06; adopters expected) | flagship | first substantive adopter feedback arriving | gated — gate now expected to open |

### Done (shipped queue items — ledger)

| ID | Work | Lane | Status |
| -- | ---- | ---- | ------ |
| v0.1 | Extraction: method doc, three skills, two templates, worked example, publish | flagship (design + judgment) with mid/small micro cycles for transcription, prose, and review | done — 2026-07-06 |
| v0.2 | The cycle reframe: macro/meso/micro section, compression thesis, up-channel rule, scale-invariant handoff template | flagship | done — 2026-07-06 |
| — | Repo protocols: branch + PR flow, CI gates workflow, main ruleset, CONTRIBUTING.md (owner-directed, unqueued) | mid-mechanics, flagship judgment on the gate set | done — 2026-07-06 |
| W1 | Spend-ledger convention (v0.3): the spend line, the counterfactual-flagship ratio, and the never-claim rules, designed in `docs/design/2026-07-06-spend-ledger-design.md` and wired into the playbook template, the handoff skill's Mode B, and the method doc's Layer 2 and cycle section. First data point recorded in the design spec itself. | flagship (design) + mid (mechanical half) | done — 2026-07-06 |

## Model routing

Lanes per `reference/portable-method.md`. This repo is docs-only, so in
practice: method-doc and template design → flagship; prose from a written
content spec, and review passes → mid; transcription of fully-specified
content, link checks, and sweeps → small.

Ask: **"If this is done slightly wrong, is it expensive?"** → flagship.
Clear contract with tests → mid. Mechanical with automated verification → small.

## Session protocol

1. One session, one queue item; finish early → update this playbook and stop.
2. Open with the playbook pointer, not "explore the repo."
3. Spec-first for anything designed in one lane and executed in another
   (specs live in `docs/design/`).
4. End-of-session ledger update: status column, gap register, date line.
5. Branch before any change (`method/`, `skills/`, `docs/`, `fix/`,
   `protocol/` prefixes); one idea per branch; PR to protected `main`;
   self-merge once gates are green. Direct pushes to `main` ended with v0.2.
6. Gates run in CI (`.github/workflows/gates.yml`) and must be green to
   merge: relative links resolve; `jq`-valid manifests; skill frontmatter
   names match directories; privacy sweep (source project unnamed); no
   concrete model names outside the method doc's one dated mapping table.
7. Re-assess only when the Now queue is empty or the strategic frame feels
   wrong.

## Standing constraints (non-negotiable)

- The source project stays unnamed and its specifics stay generalized until
  it is released — every public commit is swept for identifying terms.
- The worked example is always labeled as an abstraction, never presented as
  the verbatim artifact.
- Lanes are flagship/mid/small everywhere; concrete model names only in the
  method doc's single as-of-dated mapping table.
- Maturity claims stay honest: practice report, one source project, no
  controlled comparison.
