# Model Effectiveness Playbook: tokenomics

Status block:

- Status: active working playbook, living document, update at session end.
- Owns: this repo's cross-session work queue, model routing, session
  protocol, and gap register.
- Canonical for: what to work on next in this repo and which model tier to
  spend on it.
- Not canonical for: the method itself (`reference/portable-method.md`) or
  the v0.1/v0.2 design record (`docs/design/`).

Last updated: 2026-10-03 (fifteenth update), **session close: v0.4.0
follow-through and v0.5.0 handed off**. Shipped after the v0.4.0 tag:
skill-text evals (#28); the six provisional spend fields and the
API-list-price decision (#28); G12's recurrence correction and W15 (#31);
the routing-axes spec with the classes named pathfinder / navigator /
builder / keeper and the person renamed **operator** (#33); the coin icon
and a README rewritten in tokenomics' own voice (#33); brand canon in
slopstopper/hq#17. Filed: #25 decided, #26, #29, #30, #32, #34 with children
#35, recursive-spine#134, plumb-line#643, hq#16, and recursive-spine#133.
Owner decision recorded on #30: when a nudge suggests clearing or
compacting, it **offers a ready-made handover**, which also makes clearing
safe. Next session starts from `docs/design/2026-10-03-v0.5.0-handoff.md`.
spend (extended format): lane —→flagship (unqueued; release follow-through,
brainstorms, brand, README) · effort flagship medium · dispatches 3 (tiers:
flagship×2 inherited, not routed; mid×1 named) · out-tokens flagship 263k
(main session) / mid ≈5k (dispatch) / small 0 · in flagship uncached 0.7k /
cache-read 145M / cache-write 1.4M · compactions 0, and the session was never
cleared across 322 assistant messages: the case W15's clear/compact nudge
exists for (cache reads ≈550× output) · cf-flagship ≈1.0 against the merged
top lane; not computable against the top tier, which did not run (source:
harness API list-price estimate ≈$42.50, Claude Code 2.1.288).
Prior update: 2026-10-03 (fourteenth update), **W13 shipped (v0.4.0, first
tagged release)**: a cross-repo review found three disagreeing version claims
(manifest 0.3.2, README v0.3, ledger v0.4) and no tags or releases ever; the
site showed v0.3 only from a manual fallback. Fix: version bumped to 0.4.0;
`CHANGELOG.md` reconstructs v0.1.0 to v0.3.2 as untagged history from this
ledger and the merged PRs; recursive-spine's version-triggered release
harness transplanted (`release.yml` reuses `gates.yml` whole, notes from the
CHANGELOG section); a new gate (`scripts/check-version-agreement.sh`) keeps
manifest, CHANGELOG, and README status in agreement; `RELEASING.md` added;
README install leads with the family marketplace (`tokenomics@slopstopper`,
owner-confirmed current). Owner decisions this session: name stays (it came
from token spend; context economics is how the saving is made); v0.5.0 is
"routing axes": lane as class of work vs model tier (owner prefers class of
work, names left to a brainstorm, #25), prompt caching vs the compression
thesis, auto-compaction (G12). The recursive-spine bootstrap of this repo is
**held** for spine's declare+reconcile label stamp
(slopstopper/recursive-spine#133, owner decision) and for #25's lane names,
so nothing is labelled twice; until it lands this playbook stays canonical
for the queue. Do-not-re-derive: the per-repo marketplace stays as a second
install route (all three family READMEs used it; plumb-line and
recursive-spine still do).
spend (corrected 2026-10-03, first line in the provisional extended format
of `docs/design/2026-10-03-spend-line-gathering.md`; the original line
omitted that both dispatches ran flagship): lane —→flagship (unqueued
cross-repo review + release design; in-lane) · effort flagship medium ·
dispatches 2 (tiers: flagship×2, **inherited, not routed**: read-only surveys
were mid/small work by the routing test) · out-tokens flagship 72.2k (main
session only; subagent output not extractable, see G12) / mid 0 / small 0 ·
in flagship uncached 0.2k / cache-read 14.7M / cache-write 0.26M ·
compactions 0 (self-reported) · cf-flagship 1.00 against the flagship
*lane* as mapped (the top two tiers merged), but this session ran the second of
four tiers, so against the top tier R < 1, not computed: the harness
record prices only models used, and the top tier did not run (source
harness API list-price estimate, Claude Code 2.1.288, 2026-10-03; snapshot,
session still running). The lane merging the top two tiers is filed on #25.
Prior update: 2026-07-24 (thirteenth update), **W7 shipped (v0.4, bootstrap
salvage path)**: tokenomics-bootstrap gains a mid-project entry — the likelier
adopter shape (G7). Question 4 now invites an existing TODO/notes pile, and a
new Step-2 generation rule ("Migrate, don't curate") carries each item into the
first Now queue **verbatim** — nothing reworded, reordered, merged, split, or
dropped, the pile's own order preserved — with Lane and Size left **unrouted**,
because routing is the builder's first-session act, not a bootstrap invention.
Threaded through the frontmatter, the Q4→template mapping, and Reporting
(greenfield-empty vs salvaged-from-pile, with a verbatim count). G7 closed.
Do-not-re-derive: salvage is the complement of "invent no queue items", not an
exception — it invents nothing either, it preserves what exists. The interview
design ran flagship in-session (the queue's "escalate if the interview needs
new question design" clause); the writing was mid.
spend: lane mid→flagship (in-session design escalation on the interview
extension; mechanical write mid) · dispatches 0 · continuation of session
00c284ba, already rolled up at the twelfth update — no new dispatches, so
out-tokens not separately re-extracted · cf-flagship omitted (no dated price
table supplied).
Prior update: 2026-07-24 (twelfth update), **first orchestrated session —
G9 closed, v0.4 audit**: the first controller session to actually run the
four switchpoints with native subagents, dispatched to test whether
orchestration is ever worth it here (the standing observation being that every
authoring item so far correctly declined it). Answer: on a **review/audit**
task it pays — 7 dispatches (5 blind audit dimensions over the v0.4 doc set +
2 adversarial verifiers, all mid; controller flagship). Three dimensions came
back clean (skills↔method-doc verbatim; interop-seam claims incl.
recursive-spine-named-once; ledger↔shipped-text). Two raised findings; the
adversarial pass killed one (README epigraph — founding-thesis register, not a
never-claim breach) and confirmed three, all shipped in this PR: the
tokenomics-handoff Mode A mislabelled macro→meso queue-pickup (Route's
artifact) as Dispatch — corrected to Dispatch's actual two scales
(meso→meso / meso→micro); and two savings-**outcome** overstatements softened
to the method's *claim* (§The cycle "do the actual token saving" → "claimed
to come from"; "the two moments tokens are saved" → "the method targets
savings", in the README and the handoff skill's machine-read frontmatter).
Running the recipe on itself also hardened the adapter: subagent transcripts
landed under a `tasks/*.output` root, not the recipe's `subagents/agent-*.jsonl`
glob (harness variant); `jq -rs` aborted on one malformed line (now
`inputs | fromjson?`); the transcript dir over-counted dispatches — all three
folded into `adapters/claude-code/orchestration-recipe.md`. G9 closed: this is
the first verified, recipe-extracted multi-dispatch roll-up. Also filed
(builder-directed from this session's discussion, the up-channel promoting a
finding that outlived the session): G11 — the queue routes by Lane and Size
but has no decomposability axis at Route, so orchestration surfaces as an
exception rather than a routed default — with W12 queued to design the
fix (a fan-out hint at Route, not a queue that pre-decomposes).
spend: lane flagship (controller) · dispatches 7 (5 audit + 2 verify, all
mid) · out-tokens flagship ≈36k / mid ≈31k / small 0 (recipe-extracted at
close; read from the `tasks/*.output` root after the `subagents/` glob came
back empty, robust `inputs | fromjson?` after `jq -rs` choked; cross-checked
same-order-of-magnitude against the harness's per-agent usage) · dir held 8
transcript files vs 7 dispatched — one unknown-provenance file, recorded not
smoothed · cf-flagship omitted (no dated price table supplied).
Prior update: 2026-07-24 (eleventh update), **W6 shipped (v0.4, not-worth-it
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
| G2 | Session-start discipline is manual: nothing injects the playbook pointer; every adopting project relies on the operator remembering the protocol | **closed** (#18): the Claude Code adapter ships an opt-in SessionStart playbook-pointer hook (W10 absorbed W2) | medium |
| G3 | Single-project validation: the method has one source project; a second adopter would test whether the lanes and playbook components transfer | open: **reframed 2026-07-06**: the repo has been shared and adopters are expected, so this is now actionable: collect adopter feedback and route findings into W3 | medium (maturity) |
| G4 | Downward-only routing: the method said when to send work down but not when a receiving tier must stop and return; mis-routed work ground out down-tier burns savings invisibly (gates catch defective output, not expensive output) | **closed**: W4: escalation rule in §The cycle, verification axis in Layer 1, standing escalation clause in the handoff template | high (method semantics) |
| G5 | Compression thesis buried: the method's most durable idea (context economics) lives in one paragraph mid-doc while the dating-prone idea (tier arithmetic) headlines | **closed**: W5: README opening and method-doc thesis lead with context economics; tier arithmetic framed as first application | medium (positioning) |
| G6 | No not-worth-it threshold: the method never says when its overhead exceeds its return, which reads as overclaim to skeptics | **closed**: W6: method doc §When this doesn't pay (no tier differential / single-context / throwaway) + README one-liner; the routing test turned on the process itself | low (credibility) |
| G7 | Bootstrap assumes greenfield: no path from an existing mid-project notes pile to a playbook, though that is the likelier adopter entry | **closed**: W7: tokenomics-bootstrap Q4 invites an existing pile and the "Migrate, don't curate" rule carries it into the first Now queue verbatim (lanes unrouted, invents nothing) | medium (adoption) |
| G8 | Orchestration mechanics undocumented — Layer 4 was four bullets and the micro cycle had no dispatch contract | **closed** — method-doc half shipped (W8); skills half shipped (W9): the three skills teach and apply the switchpoint taxonomy | high (method semantics) |
| G9 | Orchestration claims lack orchestrated evidence — no ledger session yet records a verified, recipe-extracted multi-dispatch roll-up | **closed** (twelfth update): the first orchestrated session — a v0.4 doc-set audit, 7 dispatches (5 audit + 2 adversarial verify), recipe-extracted roll-up (flagship ≈36k / mid ≈31k) cross-checked against harness usage; it also found 3 confirmed doc defects and hardened the adapter recipe against transcript-path/parse drift | medium (credibility) |
| G10 | Sessions route from stale playbook state. Tier-swapping is this method's normal mode — the operator switches terminals/checkouts to change models — and worktrees pin old branches, so the playbook copy a session reads at Route can predate the queue's true state. Observed 2026-07-24: W10 was done and recorded on main at 00:13 UTC, yet a session reading its worktree's playbook five minutes later saw "W10 open" and re-executed the whole item (#19, closed as duplicate — a full session's spend burned on shipped work). The SessionStart hook inherits the defect: it injects the checkout's playbook, not the default branch's. Fix direction: a freshness rule at the Route switchpoint — fetch and read the playbook at the default-branch tip before claiming an item — plus a claim marker for the genuinely-concurrent case | open — surfaced by the first multi-session day; fix direction exercised manually 2026-07-24 (the W11 session fetched and routed from the origin/main playbook before claiming — operator-prompted, not yet doctrine) | high (spend integrity: the failure mode silently doubles session cost) |
| G11 | The queue routes by Lane (capability) and Size but not by decomposability — orchestration-shape is an orthogonal axis (a task can be mid+fan-out or flagship+solo). With no fan-out hint read at Route, a controller is spawned only when a session discovers the decomposition mid-item, or never, so orchestration surfaces as an exception (the twelfth-update audit was the repo's first) rather than a routed default. Fix direction: a lightweight fan-out hint on known-decomposable queue items, read at the Route switchpoint — **not** pre-decomposing items into queue sub-items, which would collapse the meso/micro boundary and manufacture the ceremony W6 names (the controller's within-session decomposition and its synthesis/verify-barrier role must stay). | open — surfaced by the first orchestrated session (twelfth update); design queued as W12 | low-medium (efficiency; not a falsifiability gap, so it ranks below claim-hardening work per the strategic frame) |
| G12 | The method predates harness features that change cycle economics: per-call reasoning effort (a second dial inside a tier), prompt caching (a deliberate boundary now forfeits a warm cache), auto-compaction (an uncontrolled compression boundary), and native dispatch with per-subagent model choice. None is addressed in the method doc; the mapping table is dated 2026-07. **Observed 2026-10-03:** (a) *silent tier inheritance*: native subagent dispatch without a named model inherits the controller's tier and effort, so the expensive default is the silent one (this session's two read-only surveys ran flagship); (b) the spend-extraction recipe has broken again: subagent transcripts hold only streaming partials on Claude Code 2.1.288, so dispatched output is under-reported. This is a **recurrence**, not a new defect: the same under-reporting was recorded 2026-07-23 (sixth update, "transcript format drift") and fixed in W10. The finding is that the recipe drifts with every harness update, so it needs a re-verification step per harness version, not another patch; (c) cache reads were ~200× output by volume in one session. Six provisional spend-line fields are being gathered in this repo (`docs/design/2026-10-03-spend-line-gathering.md`). | open — v0.5.0 "routing axes"; lane semantics in #25, caching + compaction in #26 | high (method currency) |

## Work queue

### Now (in order)

| ID | Work | Closes | Lane | Size | Status |
| -- | ---- | ------ | ---- | ---- | ------ |
| W1 | **Spend-ledger convention (v0.3).** Design the minimal per-session spend line: what a session records (lane used, rough scale of work (turns or dispatches, not exact token counts unless cheaply available) and handoff count), where it lives (a column or sub-line in the playbook's ledger update, not a new file), and what it may never claim (no savings assertions, records only). Then: template gains the field, handoff skill's Mode B writes it, method doc's Layer 2 documents it. Design-heavy first half (what to record without turning the ledger into an essay is the expensive-to-get-wrong part); mechanical second half. | G1 | flagship (design), mid (the template/skill edits from the design) | 1 session | done |
| W2 | **Session-start playbook-pointer hook.** A small installable hook (Claude Code `SessionStart`) that injects the playbook pointer automatically; ships as an optional extra with install notes, not a default. Spec-first: W1's design session should leave the spec behind if window time remains. | G2 | mid | 1 session | absorbed into W10 (the adapter ships the hook) |
| W6 | **"When this doesn't pay" section.** Name the threshold below which the discipline is ceremony: single-session projects, no tier differential, throwaway work. Method doc section + README one-liner. | G6 | mid | <1 session | done — 2026-07-24 |
| W7 | **Bootstrap salvage path.** Extend tokenomics-bootstrap with a mid-project entry: turn an existing TODO/notes pile into a playbook (interview asks what already exists; migration keeps the operator's items verbatim as the first queue; invents nothing). | G7 | mid (escalate if the interview needs new question design) | 1 session | done — 2026-07-24 |
| W13 | **v0.4.0 release.** Align the version claims, reconstruct the CHANGELOG, transplant the version-triggered release harness, add the version-agreement gate. | (version drift) | flagship (release design), mid (writes) | 1 session | done — 2026-10-03 |
| W14 | **Adopt recursive-spine tracking on this repo.** Run recursive-spine-bootstrap; migrate the open queue and gap register into issues verbatim per §The seam. Blocked on slopstopper/recursive-spine#133 (label reconcile) and #25 (lane names). | G10 (likely: Route becomes a live issue query, the claim marker becomes assignment) | mid (interview answers are the owner's) | 1 session | blocked |
| W16 | **Routing axes (v0.5.0).** Lane = class of work: three questions (new ground, consequence, verification), count the yeses for four classes, veto (irreversible + unverifiable → class 1), re-score at every boundary. Spec: `docs/design/2026-10-03-routing-axes-design.md`. Classes named: pathfinder, navigator, builder, keeper; the person becomes **operator** family-wide first (rename lands before `lane:builder`). Tracked in #25. | G12 | flagship (spec, done); mid (implementation from spec) | multi-session | spec done; named; ready to implement |
| W15 | **Boundary nudges (v0.5.0 headline).** When to clear, compact, or switch the session's tier, at the method's four boundaries; skill text first, then opt-in hooks, then a status-line recipe; works without other plugins. Tracked in #30; shapes #29. | G12 | flagship (design) | multi-session | open |
| W12 | **Orchestration axis at Route.** Add a decomposability hint to the queue, orthogonal to Lane, so Route can spawn a controller for known fan-out-shaped items instead of a session discovering it mid-item (or never). Design-first: how the hint is expressed in a queue row, how Route reads it, its interaction with Lane and the verification axis, and where the controller-vs-queue decomposition line sits — do not pre-decompose items into sub-items. Ranks below falsifiability work per the strategic frame; surfaced by the first orchestrated session. | G11 | flagship (method-design axis, expensive to get wrong) | 1 session | open |
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
| W13 | v0.4.0, the first tagged release: version claims aligned (manifest, README, CHANGELOG), v0.1.0 to v0.3.2 recorded as untagged history, recursive-spine's version-triggered release harness transplanted, version-agreement gate added, install leads with `tokenomics@slopstopper`. Do-not-re-derive: never tag by hand; earlier versions are not retro-tagged. | flagship | done — 2026-10-03 |
| W7 | Bootstrap salvage path (v0.4): tokenomics-bootstrap gains a mid-project entry — Q4 invites an existing TODO/notes pile, and a new Step-2 rule ("Migrate, don't curate") carries each item into the first Now queue verbatim (nothing reworded, reordered, merged, split, or dropped; order preserved), Lane and Size left unrouted since routing is the builder's first-session act. Threaded through frontmatter, Q4→template mapping, and Reporting. Closes G7. Do-not-re-derive: salvage is the complement of "invent no queue items", not an exception — invents nothing, preserves what exists; interview design ran flagship in-session, the write was mid. | mid→flagship (in-session design escalation, as the queue anticipated) | done — 2026-07-24 |

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
   merge: relative links resolve; `jq`-valid manifests; versions agree
   across `plugin.json`, CHANGELOG, and README status; skill-text evals
   (`evals/*.json`) hold, all three skills covered; skill frontmatter
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
