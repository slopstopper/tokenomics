# Model Effectiveness Playbook: tokenomics

Status block:

- Status: active working playbook, living document, update at session end.
- Owns: this repo's cross-session work queue, model routing, session
  protocol, and gap register.
- Canonical for: what to work on next in this repo and which model tier to
  spend on it.
- Not canonical for: the method itself (`reference/portable-method.md`) or
  the v0.1/v0.2 design record (`docs/design/`).

Last updated: 2026-07-24 (eleventh update), **W6 shipped (v0.4, not-worth-it
threshold)**: the method doc gains §When this doesn't pay — the discipline is
ceremony where there is no tier differential, no cycle boundary to compress
at, or nothing worth reusing; the rule is the routing test turned on the
process itself ("if getting the process slightly wrong is not expensive,
don't run the process"), and it grows more important as orchestration lands
(a fan-out of subagents to produce one paragraph costs more than it saves).
README's §The method gains the matching one-liner. G6 closed. Routing note:
W6 was explicitly assessed as an orchestration candidate and declined —
running the fleet to write the "when it's ceremony" paragraph would be the
ceremony the section names; executed single-session, in-lane (mid). No new
doctrine: self-application of the shipped routing test.
spend: lane mid · dispatches 0 · single session, docs-only diff (2 files:
method doc +28, README +5) · out-tokens not extracted (single
non-orchestrated docs session, no roll-up to recipe-extract) · cf-flagship
omitted (no dated price table supplied).
Prior update: 2026-07-24 (tenth update), **W11 shipped (v0.4 Ring 3, interop
seam)**: the method doc gains §The seam — the tracker wins on work state,
tokenomics wins on spend. Standalone behavior unchanged; co-installed, the
work queue delegates to issues/milestones and the gap register to filed
debts, while the playbook keeps the strategic frame, lanes, spend ledger,
done ledger, and standing constraints — and stays **canonical for spend**
(the spend line copied into a closing record is an annotation, never a
second source of truth). Under interop only Route's and Close's crossing
artifacts change address (issue-carrying-a-lane; closing record carries the
work-state half); no new doctrine, no fifth switchpoint. Layer 3 gains a
two-sentence delegation pointer. tokenomics-bootstrap gains the
detection-gated interop offer (question 7, asked only when an
issue-tracker-first convention is detected; declined offers reported as
answers, standalone stays the unmarked case) — replacing the W9-era "do not
ask about interop" placeholder with the mechanism it reserved space for.
recursive-spine is named once in the portable core under the same
quarantine style as the model mapping table; no spine-side changes (the
seam is designed so spine needs no change to benefit). G10 practice note:
this session's Route applied the freshness rule manually — fetched and read
the playbook at the origin/main tip before claiming W11 (builder-prompted,
not yet doctrine); W11 was confirmed unclaimed, no collision.
spend: lane flagship→flagship (seam design, in-lane) · dispatches 0 ·
out-tokens flagship ≈16k (recipe-extracted at close with the W10
group_by/max_by fix, from the worktree-slug transcript; excludes the close
edit itself) · cf-flagship omitted (no dated price table supplied).
Prior update: 2026-07-24 (ninth update), **W10 parallel-run findings folded
in**: two sessions independently executed W10 (#18 shipped first; #19 closed
as duplicate — both root-caused the extraction drift to first-wins dedupe of
cumulative streaming updates and fixed it the same way, convergent evidence).
The duplicate run's surviving deltas land here: hook `matcher: startup|clear`
(resume/compact would mis-nudge mid-item work), playbook-existence check +
`TOKENOMICS_PLAYBOOK` override in the hook, and the worktree-slug gotcha in
the recipe (worktree sessions write transcripts under their own slug).
Additional verification from that run: last==max held for all 167 distinct
message ids (main + subagents), and the hook was observed end-to-end in a
scratch project (`SessionStart:startup` fired, pointer verbatim in context).
The collision itself is registered as G10 — not a concurrency race but a
stale read: W10 was already done and recorded on main five minutes before
the duplicate session was even asked to route; the session read its
worktree's pinned playbook copy and never looked at the default-branch
tip. Tier-swapping across terminals is this method's normal operating
mode, so stale checkouts at Route are structural, not accidental.
spend: lane mid→flagship (mismatch recorded; the duplicate W10 run plus this
findings fold-in ran flagship throughout) · dispatches 0 · out-tokens
flagship ≈45k (recipe-extracted at close, this session only; the parallel
#18 session's spend is its own eighth-update line) · cf-flagship omitted (no
dated price table supplied).
Prior update: 2026-07-24 (eighth update), **W10 shipped (v0.4 adapter, Ring 2)**:
new top-level `adapters/` tree with the quarantine README (everything under
it is a dated implementation of the portable core; the method never depends
on it). The Claude Code adapter ships the SessionStart playbook-pointer hook
(opt-in, not a default; absorbs W2, closes G2), the micro-brief template (the
handoff-spec contract at micro size, for subagent dispatch), and the
orchestration recipe running Route/Dispatch/Return/Close with native
subagents. Roll-up first, before convenience: the recipe re-verifies the
2026-07-06 extraction. Root cause of that recipe's drift — Claude Code writes
one transcript line per streaming update (same message id, growing
output_tokens), so `unique_by(.id)` kept an arbitrary partial row and
under-reported subagent out-tokens; fix is `group_by(.id) | map(max_by(.out))`,
verified against a real multi-dispatch session (subagent mid/small totals
moved from ~1131/~94 back to ~19089/~17048, matching harness usage blocks'
order of magnitude). G2 closed (#18); G9 stays open — evidence begins at the
first post-W10 orchestrated session. No changes to the method doc, skills,
templates, or manifest (all out of scope for Ring 2).
spend: lane mid→flagship (the recipe re-verification was the spec's
anticipated "escalate on recipe design"; the rest was mid mechanical
execution of the handoff spec) · dispatches 0 · single ongoing session,
out-tokens not extracted · cf-flagship omitted (no dated price table
supplied).
Prior update: 2026-07-23 (seventh update), **W9 shipped (v0.4.0 skills half)**:
the three skills now teach and apply the switchpoint taxonomy —
tokenomics-method gains a compact four-switchpoint teaching block;
tokenomics-handoff labels Mode A/B as the Dispatch/Close switchpoints and
gains a Return-side early-return subsection; tokenomics-bootstrap gains an
orchestration interview question feeding the generated playbook's
model-routing section. G8 fully closed (skills half); no new doctrine (every
switchpoint and rule name points at the method doc's shipped text).
spend: lane mid (executed from the W9 handoff spec, routed flagship→mid) ·
dispatches 0 · single session, docs-only diff (3 skill files, +66/-10) ·
out-tokens not extracted · cf-flagship omitted (no dated price table
supplied).
Prior update: 2026-07-23 (sixth update), **W8 shipped (v0.4.0 method half)**: switchpoint
taxonomy (Route, Dispatch, Return, Close) + Layer 4 controller contract; G8
method-doc half closed, G9 registered; W9–W11 queued, W2 absorbed into W10.
spend: lane flagship→flagship (controller) · dispatches 8 · out-tokens
flagship ≈170k / mid ≈115k / small ≈60k · cf-flagship omitted (no dated
price table supplied) — approximate whole-session figures from harness usage
blocks; the ledger recipe's jq extraction under-reported subagent out-tokens
on this run (transcript format drift since 2026-07-06 — re-verification
folded into W10's recipe work)
Prior update: 2026-07-06 (fifth update), **W5 shipped (v0.3.2)**: the
compression-forward reframe: README opening and method-doc thesis now lead
with context economics (cycle boundaries as compression points), with tier
arithmetic presented as the first application of that idea; G5 closed.
spend: lane flagship→flagship · dispatches 0 · single session, small diff
(2 docs reframed + ledger) · out-tokens not extracted · cf-flagship omitted
(no dated price table supplied).
Prior update: 2026-07-06 (fourth update), **W4 shipped (v0.3.1)**: the
escalation rule (§The cycle, third property), the verification axis in
Layer 1 ("route down only as far as your gates reach"), and the standing
escalation clause in the handoff template; W5–W7 queued from the same
flagship review (compression-forward reframe; when-it-doesn't-pay; bootstrap
salvage path).
spend: lane flagship→flagship · dispatches 15 · out-tokens flagship ≈265k /
mid ≈9.4k / small ≈1.1k · cf-flagship omitted (no dated price table
supplied), whole-session figures spanning v0.1→W4, approximate.
Prior update: **spend ledger shipped, v0.3.0**:
the spend line is live in the playbook template, the handoff skill's Mode B,
and the method doc's Layer 2 and cycle section; W1 done. Prior update same
day: **repo protocols live**: branch + PR flow with protected `main`, gates
enforced in CI (`.github/workflows/gates.yml`), CONTRIBUTING.md added;
session protocol rules 5–6 now carry the flow. Before that: **v0.2 shipped**:
the cycle section (macro / meso / micro nesting, context-compression
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
**claims without evidence**: the method asserts token savings but records
none, so the practice report cannot currently be checked against its own
history. Ordering rule: **work that makes the method's claims falsifiable
outranks work that adds surface area.**

Post-v0.4 corollary: every named switchpoint invites ceremony around
it, so W6's not-worth-it threshold grows more important as
orchestration lands, not less.

## Gap register

| # | Gap | Status | Severity |
| - | --- | ------ | -------- |
| G1 | No spend record: the method claims savings but no session logs its lane, scale of work, or handoff count; the practice report is unfalsifiable against its own history | design closed + implementation shipped: spend line live in template/skill/method doc | high (credibility) |
| G2 | Session-start discipline is manual: nothing injects the playbook pointer; every adopting project relies on the builder remembering the protocol | **closed** (#18): the Claude Code adapter ships an opt-in SessionStart playbook-pointer hook (W10 absorbed W2) | medium |
| G3 | Single-project validation: the method has one source project; a second adopter would test whether the lanes and playbook components transfer | open: **reframed 2026-07-06**: the repo has been shared and adopters are expected, so this is now actionable: collect adopter feedback and route findings into W3 | medium (maturity) |
| G4 | Downward-only routing: the method said when to send work down but not when a receiving tier must stop and return; mis-routed work ground out down-tier burns savings invisibly (gates catch defective output, not expensive output) | **closed**: W4: escalation rule in §The cycle, verification axis in Layer 1, standing escalation clause in the handoff template | high (method semantics) |
| G5 | Compression thesis buried: the method's most durable idea (context economics) lives in one paragraph mid-doc while the dating-prone idea (tier arithmetic) headlines | **closed**: W5: README opening and method-doc thesis lead with context economics; tier arithmetic framed as first application | medium (positioning) |
| G6 | No not-worth-it threshold: the method never says when its overhead exceeds its return, which reads as overclaim to skeptics | **closed**: W6: method doc §When this doesn't pay (no tier differential / single-context / throwaway) + README one-liner; the routing test turned on the process itself | low (credibility) |
| G7 | Bootstrap assumes greenfield: no path from an existing mid-project notes pile to a playbook, though that is the likelier adopter entry | open: W7 queued | medium (adoption) |
| G8 | Orchestration mechanics undocumented — Layer 4 was four bullets and the micro cycle had no dispatch contract | **closed** — method-doc half shipped (W8); skills half shipped (W9): the three skills teach and apply the switchpoint taxonomy | high (method semantics) |
| G9 | Orchestration claims lack orchestrated evidence — no ledger session yet records a verified, recipe-extracted multi-dispatch roll-up | open — evidence begins at the first post-W10 orchestrated session | medium (credibility) |
| G10 | Sessions route from stale playbook state. Tier-swapping is this method's normal mode — the builder switches terminals/checkouts to change models — and worktrees pin old branches, so the playbook copy a session reads at Route can predate the queue's true state. Observed 2026-07-24: W10 was done and recorded on main at 00:13 UTC, yet a session reading its worktree's playbook five minutes later saw "W10 open" and re-executed the whole item (#19, closed as duplicate — a full session's spend burned on shipped work). The SessionStart hook inherits the defect: it injects the checkout's playbook, not the default branch's. Fix direction: a freshness rule at the Route switchpoint — fetch and read the playbook at the default-branch tip before claiming an item — plus a claim marker for the genuinely-concurrent case | open — surfaced by the first multi-session day; fix direction exercised manually 2026-07-24 (the W11 session fetched and routed from the origin/main playbook before claiming — builder-prompted, not yet doctrine) | high (spend integrity: the failure mode silently doubles session cost) |

## Work queue

### Now (in order)

| ID | Work | Closes | Lane | Size | Status |
| -- | ---- | ------ | ---- | ---- | ------ |
| W1 | **Spend-ledger convention (v0.3).** Design the minimal per-session spend line: what a session records (lane used, rough scale of work (turns or dispatches, not exact token counts unless cheaply available) and handoff count), where it lives (a column or sub-line in the playbook's ledger update, not a new file), and what it may never claim (no savings assertions, records only). Then: template gains the field, handoff skill's Mode B writes it, method doc's Layer 2 documents it. Design-heavy first half (what to record without turning the ledger into an essay is the expensive-to-get-wrong part); mechanical second half. | G1 | flagship (design), mid (the template/skill edits from the design) | 1 session | done |
| W2 | **Session-start playbook-pointer hook.** A small installable hook (Claude Code `SessionStart`) that injects the playbook pointer automatically; ships as an optional extra with install notes, not a default. Spec-first: W1's design session should leave the spec behind if window time remains. | G2 | mid | 1 session | absorbed into W10 (the adapter ships the hook) |
| W6 | **"When this doesn't pay" section.** Name the threshold below which the discipline is ceremony: single-session projects, no tier differential, throwaway work. Method doc section + README one-liner. | G6 | mid | <1 session | done — 2026-07-24 |
| W7 | **Bootstrap salvage path.** Extend tokenomics-bootstrap with a mid-project entry: turn an existing TODO/notes pile into a playbook (interview asks what already exists; migration keeps the builder's items verbatim as the first queue; invents nothing). | G7 | mid (escalate if the interview needs new question design) | 1 session | open |
| W8 | **Switchpoint taxonomy + Layer 4 controller contract.** Rings 1a–1b of `docs/design/2026-07-23-switchpoints-design.md`. | G8 (with W9) | flagship | 1 session | done — 2026-07-23 |
| W9 | **Skills wiring.** Method skill teaches the four switchpoints; handoff skill reframes Mode A/B as Dispatch/Close and gains Return-side early-return guidance; bootstrap gains the orchestration interview section (interop mode excluded — W11). | G8 (with W8) | mid | 1 session | done — 2026-07-23 |
| W10 | **`adapters/claude-code/` (Ring 2).** Quarantine README; SessionStart hook (absorbs W2); micro-brief template; orchestration recipe with automated spend roll-up first. | G2; enables G9 | mid, escalate on recipe design | 1 session | done — 2026-07-24 (#18) |
| W11 | **Recursive-spine interop seam (Ring 3).** Method-doc seam section + bootstrap interop mode. | — (spec §Ring 3) | flagship (seam design) | 1 session | done — 2026-07-24 |

### Later

| ID | Work | Lane | Gate | Status |
| -- | ---- | ---- | ---- | ------ |
| W3 | Adopter feedback pass: revisit lane boundaries and playbook components against real external adoptions (repo shared 2026-07-06; adopters expected) | flagship | first substantive adopter feedback arriving | gated: gate now expected to open |

### Done (shipped queue items, ledger)

| ID | Work | Lane | Status |
| -- | ---- | ---- | ------ |
| v0.1 | Extraction: method doc, three skills, two templates, worked example, publish | flagship (design + judgment) with mid/small micro cycles for transcription, prose, and review | done: 2026-07-06 |
| v0.2 | The cycle reframe: macro/meso/micro section, compression thesis, up-channel rule, scale-invariant handoff template | flagship | done: 2026-07-06 |
| - | Repo protocols: branch + PR flow, CI gates workflow, main ruleset, CONTRIBUTING.md (owner-directed, unqueued) | mid-mechanics, flagship judgment on the gate set | done: 2026-07-06 |
| W1 | Spend-ledger convention (v0.3): the spend line, the counterfactual-flagship ratio, and the never-claim rules, designed in `docs/design/2026-07-06-spend-ledger-design.md` and wired into the playbook template, the handoff skill's Mode B, and the method doc's Layer 2 and cycle section. First data point recorded in the design spec itself. | flagship (design) + mid (mechanical half) | done: 2026-07-06 |
| W5 | Compression-forward reframe (v0.3.2): README opening and method-doc thesis now lead with context economics (cycle boundaries as compression points, working context dies at the boundary, only the distilled artifact crosses) with tier arithmetic presented as the first application of that idea, not the idea itself. Closes the buried-thesis gap. | flagship (positioning) | done: 2026-07-06 |
| W4 | Escalation rule + verification axis (v0.3.1): a cycle that cannot meet its exit bar returns early (§The cycle, third saving property); route down only as far as your gates reach (Layer 1 second axis); standing escalation clause added to the handoff template and the handoff skill's Mode A. Closes the downward-only-routing gap. | flagship (method semantics) | done: 2026-07-06 |
| W8 | Switchpoint taxonomy (Route, Dispatch, Return, Close — trigger/rule/artifact contract) + Layer 4 controller contract (controller discipline, dispatch contract with worked micro brief, parallelism rule, surfacing rule). Do-not-re-derive: switchpoints are named rules, not new doctrine, and are not a fifth layer. | flagship | done — 2026-07-23 |
| W9 | Skills wiring (v0.4.0 skills half): tokenomics-method gains a compact four-switchpoint teaching block (names + trigger/rule/artifact shape + pointer to §Switchpoints); tokenomics-handoff labels Mode A/B as the Dispatch/Close switchpoints and adds a Return early-return subsection; tokenomics-bootstrap gains an orchestration interview question mapped to Model routing (interop excluded, that is W11). Do-not-re-derive: skills point at the method doc's shipped text, no new doctrine; every name used appears verbatim in `reference/portable-method.md`. Closes G8's skills half. | mid (from the W9 handoff spec) | done — 2026-07-23 |
| W11 | Recursive-spine interop seam (v0.4, Ring 3): method doc gains §The seam — division of ownership, not a merge: the tracker wins on work state, tokenomics wins on spend. Co-installed: queue → issues/milestones, gap register → filed debts; playbook keeps frame, lanes, spend ledger, done ledger, standing constraints, and stays canonical for spend; issues carry a lane, closing records carry a spend line (annotation only). Bootstrap gains the detection-gated interop offer (question 7; offered never forced; declines reported as answers). Do-not-re-derive: switchpoint contracts untouched under interop — only Route's and Close's crossing artifacts change address; recursive-spine named exactly once in the portable core (quarantine style of the model mapping table); spine needs no change to benefit — lane and spend annotations ride in issue bodies and closing comments it already has. Plumb-line composes independently, one sentence, no wiring. | flagship (seam design, in-lane) | done — 2026-07-24 |
| W10 | Claude Code adapter (v0.4, Ring 2): new `adapters/` tree + quarantine README; the adapter ships an opt-in SessionStart playbook-pointer hook (absorbs W2, closes G2), the micro-brief template (dispatch contract at micro size), and an orchestration recipe running the four switchpoints with native subagents. Roll-up first: re-verified the 2026-07-06 spend-extraction recipe — `unique_by(.id)` under-reported because streaming updates repeat the message id with a growing `output_tokens`; fixed to `group_by(.id) | map(max_by(.out))`, cross-checked against harness usage blocks. Do-not-re-derive: adapter implements the shipped contract, amends nothing (method/skills/templates/manifest untouched); G9 opens for the first post-W10 orchestrated session. | mid (escalated to flagship on the recipe re-verification, as the spec anticipated) | done — 2026-07-24 (#18) |
| W6 | "When this doesn't pay" section (v0.4): method doc gains §When this doesn't pay naming the threshold below which the discipline is ceremony — no tier differential (routing is a label with no destination), single-context work (nothing crosses a boundary, so nothing to compress or hand off), throwaway output (paid-once judgment never spent twice); the rule is the routing test turned on the process itself. README §The method gains the matching one-liner. Closes G6. Do-not-re-derive: no new doctrine, the section self-applies the shipped routing test; assessed as an orchestration candidate and declined (the fleet to write this paragraph would be the ceremony it names). | mid | done — 2026-07-24 |

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
  it is released, every public commit is swept for identifying terms.
- The worked example is always labeled as an abstraction, never presented as
  the verbatim artifact.
- Lanes are flagship/mid/small everywhere; concrete model names only in the
  method doc's single as-of-dated mapping table.
- Maturity claims stay honest: practice report, one source project, no
  controlled comparison.
