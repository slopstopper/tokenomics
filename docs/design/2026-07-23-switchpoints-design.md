# Switchpoints — design spec (v0.4 phase, W8–W11)

Date: 2026-07-23
Status: accepted (owner-approved in a flagship brainstorming session; this
spec is the phase's entry artifact — each queue item below executes from
it, per the spec-first rule)
Closes: G2 (via W10) and the two new gaps this spec registers (G8, G9).
Touches: `reference/portable-method.md`, all three skills,
`docs/model-effectiveness-playbook.md`, new `adapters/` tree.

## What this is

The v0.4 phase design: the method's rules, which have always been
positional, get their positions named — four **switchpoints** where work
switches lane, tier, or direction — and the least-developed layer
(Layer 4, tiered orchestration) is deepened from four bullets into a real
controller contract. A second ring ships the first executable adapter
(Claude Code), and an interop seam lets tokenomics compose with the
recursive-spine tracking convention without either depending on the other.

The phase is built under its own rules: every build session enters via
the playbook, and once the adapter's micro-brief template exists, later
sessions dispatch sub-agents with it and record aggregated spend lines —
the first orchestrated data points in this repo's own ledger.

## Design constraints (inherited, non-negotiable)

- **Two rings, quarantined.** The portable core (method doc, skills,
  templates) never depends on the adapter. Everything harness-specific
  lives under `adapters/<harness>/`, dated, labeled as one implementation
  of the portable idea — the same quarantine the lane names already apply
  to model names.
- **Names, not inventions.** The switchpoint taxonomy names rules the
  method already has. If a taxonomy entry requires new doctrine, that is
  a design finding to surface, not something to slip in silently.
- **Ordering rule holds.** Falsifiability outranks surface area: the
  adapter's job is partly evidence collection (automatic spend capture),
  not just convenience.
- **Interop is offered, never forced** — mirroring recursive-spine's own
  etiquette toward tokenomics. Standalone behavior is unchanged.

## Ring 1a — the switchpoint taxonomy (`portable-method.md`, new section)

Four switchpoints. Each carries the same three-part contract: a
**trigger condition** (what you observe), the **rule that fires** (all
pre-existing), and the **crossing artifact** (nothing crosses a
switchpoint except a distilled artifact).

| Switchpoint | Trigger | Rule that fires | Crossing artifact |
| ----------- | ------- | --------------- | ----------------- |
| **Route** | scope time — work is about to be assigned a lane | routing test + verification axis | queue line with a lane |
| **Dispatch** | a controller hands work down (session→session or controller→subagent) | spec-first rule; lane-scarcity rule | handoff spec / task brief |
| **Return** | the receiving tier meets its exit bar — or discovers it cannot | exit-bar verification; escalation rule on the failure path | report + reviewed diff, or an early-return escalation artifact |
| **Close** | a cycle boundary — session or arc ends | compression point; ledger + spend line update | ledger line + spend line |

The section's thesis sentence: *the method's rules were always
positional — they fire at switchpoints, not continuously. Naming the
switchpoints is what makes the method orchestratable: anything that can
observe a switchpoint — a builder, a controller model, a hook — can
enforce the rule that belongs to it.*

Relation to the cycle: switchpoints are not a fifth layer. They are the
cycle's boundary events made addressable — Route and Dispatch on the way
down, Return and Close on the way up. The section lands adjacent to §The
cycle and cross-references it rather than restating it.

Naming note: "switchpoints" was chosen over "moments" deliberately —
recursive-spine's rules codex has a *moments map* (tracking discipline);
these are spend discipline. Cousin concepts, different layers, distinct
names.

## Ring 1b — Layer 4 deepened (orchestration mechanics, portable)

Layer 4 grows from four bullets into a controller contract, still
tool-agnostic:

- **Controller discipline.** A controller is a meso cycle running micro
  cycles. It dispatches on briefs, never forwards raw context, and
  aggregates sub-agent spend into its own spend line — dispatch count
  and out-tokens by tier roll *up*, so the ledger stays truthful when
  work is parallelized.
- **Dispatch contract.** A micro brief is the handoff-spec template at
  its smallest size. The template is already scale-invariant; this makes
  the micro-scale usage explicit, with one worked micro-brief example.
- **Parallelism rule.** Parallelize only work that is independent *and*
  down-lane-verifiable. Parallel flagship dispatches are a smell: if it
  needs flagship judgment, it probably needs the one context that holds
  the frame.
- **Surfacing rule.** Sub-agent findings cross at the Return switchpoint
  inside the report, never as leaked context; the controller promotes
  surviving findings at Close. (The existing one-level-at-a-time
  escalation property, restated for orchestration.)

## Ring 1c — skills wiring

- `tokenomics-method` teaches the four switchpoints alongside the four
  layers.
- `tokenomics-handoff` reframes its two modes as switchpoints (Mode A ≈
  Dispatch, Mode B ≈ Close) and gains Return-side guidance: recognizing
  mid-cycle that the lane test is failing, and writing the early-return
  artifact.
- `tokenomics-bootstrap` gains one interview section: does this project
  orchestrate (sub-agents available? controller pattern?) — and, when
  the repo shows recursive-spine installed, offers interop mode (§Ring
  3). Offers, never forces.

## Ring 2 — `adapters/claude-code/`

New top-level `adapters/` directory. Its README states the quarantine
rule: everything under here is a dated implementation of the portable
core; the method never depends on it. Contents:

- **SessionStart hook** injecting the playbook pointer — absorbs and
  closes W2/G2.
- **Micro-brief template** for Agent-tool dispatches, matched to the
  dispatch contract in Ring 1b.
- **Orchestration recipe** — how a Claude Code controller session runs
  the four switchpoints with native subagents, including per-dispatch
  out-token collection (building on the spend ledger's verified
  extraction recipe) so the roll-up is read, not estimated.
- Install notes. Everything optional.

Honest-limit language carries over from the spend-ledger spec: the
adapter reads harness internals that are not a public contract; its job
is to be re-verified, not trusted.

## Ring 3 — recursive-spine interop (the seam)

The tension to resolve: recursive-spine's first principle is *work state
lives in GitHub issues + milestones, never prose ledgers* — and the
tokenomics playbook is a prose ledger carrying a work queue and gap
register. Co-installed, one must yield.

The seam — spine wins on work state; tokenomics wins on spend:

- **Standalone (unchanged):** the playbook owns queue + gap register
  exactly as today.
- **Co-installed:** the queue delegates to issues/milestones and the gap
  register to filed debts; the playbook keeps what spine has no opinion
  on — strategic frame, routing lanes, spend ledger, done-ledger
  do-not-re-derive findings, standing constraints — and queue references
  become issue numbers. In return, tokenomics annotates spine's world:
  a spine issue carries a **lane**, and a spine closing record carries a
  **spend line**. Spine owns *what and when*; tokenomics owns *what tier
  and at what cost*.
- **Plumb-line:** composes independently; one acknowledging sentence, no
  wiring.

Ships as: a short portable-core section (method doc) plus the bootstrap
interop mode (Ring 1c). Changes to recursive-spine itself are out of
scope for this repo's phase; the seam is designed so spine needs no
change to benefit (lane and spend annotations ride in issue bodies and
closing comments spine already has).

## New gaps this spec registers

- **G8 — orchestration mechanics undocumented** (Layer 4 is four
  bullets; the micro cycle has no dispatch contract). Closed by W8+W9.
- **G9 — orchestration claims lack orchestrated evidence** (no session
  in this repo's ledger has recorded an aggregated multi-dispatch spend
  line). Closed by the first W-item session that ships work through the
  adapter's dispatch flow and records the roll-up.

## Queue decomposition

| ID | Work | Closes | Lane | Size |
| -- | ---- | ------ | ---- | ---- |
| W8 | Switchpoint taxonomy + Layer 4 deepening in the method doc (Rings 1a+1b) | G8 (with W9) | flagship | 1 session |
| W9 | Skills wiring from W8's shipped text (Ring 1c, minus interop mode) | G8 (with W8) | mid | 1 session |
| W10 | `adapters/claude-code/` (Ring 2); absorbs W2 | G2, enables G9 | mid, escalate on recipe design | 1 session |
| W11 | Recursive-spine interop: method-doc seam section + bootstrap interop mode (Ring 3) | — | flagship (seam design) | 1 session |

Order: W8 → W9 → W10 → W11. W8 is the design-heavy heart and everything
else executes from its shipped text. W6/W7 keep their queue places;
their ordering against W8–W11 is a playbook call at each session's Close.

## Out of scope (named to stay honest)

- No changes to recursive-spine, plumb-line, or their skills.
- No second-harness adapter; `adapters/` ships with one child and the
  quarantine README, not a speculative matrix.
- No savings claims from orchestration — G9 closes with *records*, per
  the spend ledger's never-claim rules.
