# Model Effectiveness Playbook — tokenomics

Status block:

- Status: active working playbook — living document, update at session end.
- Owns: this repo's cross-session work queue, model routing, session
  protocol, and gap register.
- Canonical for: what to work on next in this repo and which model tier to
  spend on it.
- Not canonical for: the method itself (`reference/portable-method.md`) or
  the v0.1/v0.2 design record (`docs/design/`).

Last updated: 2026-07-06 — **v0.2 shipped**: the cycle section (macro /
meso / micro nesting, context-compression thesis, up-channel rule) added to
the method doc; handoff-spec template made scale-invariant; handoff skill
and README updated to match. W1 (spend ledger) queued as the v0.3 headline.

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
| G1 | No spend record — the method claims savings but no session logs its lane, scale of work, or handoff count; the practice report is unfalsifiable against its own history | open — W1 queued | high (credibility) |
| G2 | Session-start discipline is manual — nothing injects the playbook pointer; every adopting project relies on the builder remembering the protocol | open — W2 queued | medium |
| G3 | Single-project validation — the method has one source project; a second adopter would test whether the lanes and playbook components transfer | open — not actionable from inside this repo; revisit when there is an external adopter | medium (maturity) |

## Work queue

### Now (in order)

| ID | Work | Closes | Lane | Size | Status |
| -- | ---- | ------ | ---- | ---- | ------ |
| W1 | **Spend-ledger convention (v0.3).** Design the minimal per-session spend line: what a session records (lane used, rough scale of work — turns or dispatches, not exact token counts unless cheaply available — and handoff count), where it lives (a column or sub-line in the playbook's ledger update, not a new file), and what it may never claim (no savings assertions, records only). Then: template gains the field, handoff skill's Mode B writes it, method doc's Layer 2 documents it. Design-heavy first half (what to record without turning the ledger into an essay is the expensive-to-get-wrong part); mechanical second half. | G1 | flagship (design), mid (the template/skill edits from the design) | 1 session | open |
| W2 | **Session-start playbook-pointer hook.** A small installable hook (Claude Code `SessionStart`) that injects the playbook pointer automatically; ships as an optional extra with install notes, not a default. Spec-first: W1's design session should leave the spec behind if window time remains. | G2 | mid | 1 session | open — gated on a written spec |

### Later

| ID | Work | Lane | Gate | Status |
| -- | ---- | ---- | ---- | ------ |
| W3 | Second-adopter feedback pass — revisit lane boundaries and playbook components against a real external adoption | flagship | an external project actually adopting the method | gated |

### Done (shipped queue items — ledger)

| ID | Work | Lane | Status |
| -- | ---- | ---- | ------ |
| v0.1 | Extraction: method doc, three skills, two templates, worked example, publish | flagship (design + judgment) with mid/small micro cycles for transcription, prose, and review | done — 2026-07-06 |
| v0.2 | The cycle reframe: macro/meso/micro section, compression thesis, up-channel rule, scale-invariant handoff template | flagship | done — 2026-07-06 |

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
5. Gates for this repo: relative links resolve; `jq`-valid manifests; skill
   frontmatter names match directories; no concrete model names outside the
   method doc's one dated mapping table.
6. Re-assess only when the Now queue is empty or the strategic frame feels
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
