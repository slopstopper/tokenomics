# The portable method

Tokenomics treats a model's working context as the scarce resource. Model
prices and tier names churn on a timescale of months; the economics of
context do not: every session fills a working context that is expensive to
fill and impossible to keep, and whatever isn't deliberately distilled out
of it before it dies is paid for again next session. The method's core
move is to run work in cycles whose boundaries are compression points:
the working context dies at the boundary, and only a distilled artifact
crosses.

Tier arithmetic (spending model capability like a scarce budget) is the
first application of that idea, not the idea itself. Three claims follow
from the framing. First, most work in a real project does not
need the best model available: it needs the cheapest model that will do the
job correctly. Second, the expensive model's output is only durable when it
leaves a written spec behind; a brilliant decision that lives only in one
session's context is a decision that gets re-derived, and re-paid for, next
session. Third, the cheapest way to start a session is a pointer into a
living playbook, not another pass of re-exploring the repository.

The discipline that follows from these three claims is short enough to state
in one sentence: route work by its nature, hand work off on written specs,
and carry strategy across sessions in a ledger rather than in memory.

This document is that discipline, in full. It assumes no prior knowledge of
where it came from.

## Who this is for

Operators with tiered access to models (usage limits, time-boxed premium
windows, per-token billing, or any mix of these) running projects that span
more than one session. It matters most for solo operators, who don't have a
team to absorb the cost of a badly-routed task or a re-explored repo; every
wasted token is a wasted token against their own budget, and every
re-derivation is a session that produced nothing new.

It does not assume a specific tool, language, or project type. It assumes
only that "some model calls are more expensive than others" is true for your
setup, and that your project outlives a single session.

## The cycle

The four layers below are the components of the method. At runtime they
compose into a single loop, and the loop is the same at every timescale:

> **Enter on a written brief. Run at the cheapest capable tier. Exit on a
> verified artifact plus a ledger line.**

The method runs that loop at three nested scales:

| Cycle | Timescale | Entry artifact | Exit artifact | Who runs it |
| ----- | --------- | -------------- | ------------- | ----------- |
| **Macro** | weeks: the project arc | strategic frame + work queue (the playbook) | re-assessment; an updated frame and queue | the class the work scores (Layer 1) |
| **Meso** | hours: one session | the playbook pointer + one queue item, or a handoff spec | verified deliverable + the end-of-session ledger update | the class the queue item names |
| **Micro** | minutes: one subagent task | a task brief | a report and a reviewed deliverable (a diff, a draft, a checked dataset) | the cheapest capable tier |

Three properties of this nesting are where the token saving is claimed to
come from.

**Every cycle boundary is a context-compression point.** A cycle's full
working context (the exploration, the dead ends, the reasoning) dies at
its boundary. Only the distilled artifact crosses: a queue line at macro, a
handoff spec at meso, a brief or report at micro. Tokenomics is
tier-matching *within* cycles plus deliberate context-shedding *between*
them; a boundary that lets raw context leak across (pasting a session's
history into the next dispatch, re-deriving a decision the ledger already
records) is paying twice for the same tokens. The spend line appended at
each meso-cycle close is what makes this compression claim checkable rather
than asserted: it records what actually ran instead of what the loop
assumes should have run.

**Findings escalate one cycle level, at cycle close.** Information flows
down the cycles as briefs and specs; it flows back up through the exit
artifacts, one level at a time. A micro-cycle reviewer's structural finding
lands in its report; the meso cycle's close promotes it to the gap register
if it outlives the session; the macro re-assessment reorders the queue
around it. Nothing skips a level, and nothing escalates mid-cycle except a
blocker.

**A cycle that cannot meet its exit bar returns early.** Routing is decided
at scope time, and scope-time judgments are sometimes wrong. The escalation
rule: when the receiving tier discovers mid-cycle that the work scores
higher than the class it was routed as (the judgment calls keep coming,
the gates don't reach, the turns multiply) it stops and hands back up
with what it learned: what was tried, what broke, and what decision is actually needed.
An early return is cheap tuition. Pushing through is the method's invisible
failure mode: a cheap model grinding out triple the turns on work it cannot
do burns the savings the routing bought, and the gates won't show it,
because gates catch defective output, not expensive output. Escalation
crosses the boundary the same way everything else does, as an artifact,
one level up.

The handoff contract is scale-invariant: the same sections serve a
session-to-session handoff and a controller-to-subagent dispatch, sized to
the cycle, see `handoff-spec-template.md`.

## Switchpoints

The rules above were always positional — they fire at particular
points in the cycle, not continuously. A **switchpoint** is one of
those points made addressable: the place where work switches class,
tier, or direction, and where a rule stated elsewhere in this method
is applied. Naming the switchpoints is what makes the method
orchestratable: anything that can observe a switchpoint — an operator,
a controller model, a hook — can enforce the rule that belongs to it.

Every switchpoint carries the same three-part contract: a **trigger
condition** (what you observe), the **rule that fires** (nothing
below is new doctrine — the taxonomy names rules this document
already states), and the **crossing artifact** (nothing crosses a
switchpoint except a distilled artifact).

| Switchpoint | Trigger | Rule that fires | Crossing artifact |
| ----------- | ------- | --------------- | ----------------- |
| **Route** | scope time — work is about to be assigned a class | the three questions, the count, and the veto (Layer 1) | a queue line carrying a class |
| **Dispatch** | a controller hands work down — session to session, or controller to subagent | re-score (Layer 1); the spec-first rule (Layer 2); the tier-scarcity rule (Layer 4) | a handoff spec or task brief |
| **Return** | the receiving tier meets its exit bar — or discovers it cannot | re-score; the project's gates on the success path; the escalation rule on the failure path | a report and reviewed diff, or an early-return escalation artifact |
| **Close** | a cycle boundary — the session or the arc ends | re-score; the compression point; the ledger and spend-line update (Layer 2, rule 4) | a ledger line plus spend line |

Every switchpoint is a boundary, and the class is re-scored at every
boundary (§Layer 1, Re-scoring). Switchpoints are not a fifth layer.
They are the cycle's boundary events (§The cycle) made addressable — Route and Dispatch on the way
down, Return and Close on the way up. Route and Close mark a cycle's
own boundaries; Dispatch and Return mark the boundaries of every
cycle it runs beneath itself. Return's two paths — the verified exit
and the early escalation — are the same crossing in opposite moods,
and both land one level up, never further.

The re-score at Dispatch, Return, and Close also covers the session the
operator is in: whether to clear it, compact it, or switch its tier. Said
to the operator, that re-score is a **boundary nudge**. Operators rarely
know when the moment is, so the agent leads: it dispatches lower-class work
to the mapped tier itself, and for the session's own clear, compact, or
model switch (the operator's commands) it says so and gets everything
ready. It speaks whenever the re-score says change. Staying is a valid
answer when it was decided. A clear or compact comes after the state is
written down, because compression is safe only when the state lives
outside the context. The tokenomics-handoff skill
carries the nudges.

## Layer 1: Routing

Work is routed to one of four lanes. A lane is a **class of work**, not a
model tier: it is defined by the *nature of the work*, never by what
happens to be available at the moment and never by the rank of the model
that will run it. Tier is the model's rank; which tier serves which class
is the operator's mapping (below), not part of the method.

| Class | Lane | Card (title · what the work asks for · relation to precedent) |
| ----- | ---- | ------------------------------------------------------------- |
| 1 | `lane:pathfinder` | pathfinder · frontier · uncharted |
| 2 | `lane:navigator` | navigator · judgment · charted |
| 3 | `lane:builder` | builder · build · specified |
| 4 | `lane:keeper` | keeper · routine · automatic |

("Builder" names this class only. The person using the method is the
operator.)

### The three questions

Asked of the work before a class is assigned, and again at every boundary
(see Re-scoring):

| # | Axis | Question | "Yes" means |
| - | ---- | -------- | ----------- |
| Q1 | Capability demand | Is this new ground: no precedent, pattern, or spec **in the project** to follow, or does it cross domains? | it needs understanding the project does not already hold |
| Q2 | Consequence | If it is slightly wrong, is that expensive: costly to fix, built on by other work, or **impossible to undo**? | errors cost; note separately whether the cost is *irreversibility* |
| Q3 | Verification | Would checking it mean redoing it: no test, contract, or gate that confirms it cheaply? | the gates do not reach it |

Precedent is in the project, not in the person: an operator new to a
domain does not make everything new ground. The project's specs, patterns,
and playbook entries are the reference.

### Scoring: count the yeses

Count the yeses (AND, not OR):

| Yeses | Class |
| ----- | ----- |
| 3 | 1 · **pathfinder** |
| 2 | 2 · **navigator** |
| 1 | 3 · **builder** |
| 0 | 4 · **keeper** |

**Veto: irreversible AND unverifiable → pathfinder, whatever the count.**
Q2's yes is irreversibility specifically (not merely expensive) and Q3 is
yes. This is the method's worst case: the wrong version reads like the
right one, and it cannot be taken back. Without the veto, familiar
irreversible work (a data migration following a known pattern) would score
2.

Spot checks:

| Work | Q1 | Q2 | Q3 | Score | Class |
| ---- | -- | -- | -- | ----- | ----- |
| lint sweep | no | no | no | 0 | keeper |
| implementation from a spec, with tests | no | yes | no | 1 | builder |
| familiar design call, no gate | no | yes | yes | 2 | navigator |
| exploration (disposable) | yes | no | yes | 2 | navigator, passed up by escalation when needed |
| novel load-bearing architecture | yes | yes | yes | 3 | pathfinder |
| familiar migration, irreversible, unverifiable | no | yes (irreversible) | yes | 2 → **veto** | pathfinder |

Q3 is the verification axis, and it is why routing down is safe exactly as
far as your gates reach: tests, contracts, diffs, checks that make
correctness cheap to confirm without judgment. Work with no cheap gate
(design prose, a taxonomy call, anything where checking it means
redoing it) scores a yes on Q3 even when it looks easy, because
verification costs as much as execution and the wrong version reads
exactly like the right one. Route down only as far as your gates reach;
and when a scope-time routing call turns out wrong mid-cycle, the
escalation rule (§The cycle) applies: return early, don't push through.

### Re-scoring: passing down and passing up

The class is not fixed for the life of the work. **Re-score at every
boundary** (Route, Dispatch, Return, Close; §Switchpoints):

- **Passing down.** A decision made or a spec written changes the answers:
  there is now precedent (Q1 → no) and often a gate (Q3 → no). The score
  drops, so the tier drops. Spending the top tier on the expensive part
  and handing execution down is a consequence of re-scoring, not a
  separate rule.
- **Passing up.** A Return (escalation) re-scores upward, for example
  exploration that turned out to be load-bearing.
- **Tier inertia** is what happens when nobody re-scores: work keeps
  running on the tier it started on after its score has changed.

### The negative list

The scoring cuts against a natural but wasteful instinct: reaching for the
best model out of habit or anxiety, regardless of what the task actually
needs. The negative list makes that instinct concrete by naming what it
looks like in practice: never spend top-tier budget on presentation
polish, formatting chores, status upkeep, running the gates, mechanical
additions against an existing pattern, or executing a spec another session
already wrote: in a codebase that is UI polish, lint, branch hygiene, CI
runs, and rote test additions; in a publishing or analytical operation it
is the equivalent low-judgment upkeep. Every item is checkable or
pattern-following work and scores at most 1: none of it is new ground,
and none of it needs the tier that costs the most to run.

### The mapping is the operator's

The method ships classes, never a default mapping. Which tier serves each
class is set by the operator in their playbook; an operator with two tiers
maps four classes onto two. Effort lives in the mapping, not the class
(for example "class 2 → second tier, high effort"). The one mapping below
is an example, dated because model names and generations turn over
quickly:

| Class | one mapping, as of 2026-10 |
|-------|----------------------------|
| 1 pathfinder | Fable-class |
| 2 navigator  | Opus-class |
| 3 builder    | Sonnet-class |
| 4 keeper     | Haiku-class |

The classes outlive any mapping. The shape of the work (what is new
ground, what is expensive to get wrong, what the gates reach) does not
turn over. Keep your own mapping current in your playbook, but route by
the three questions, not by brand name.

## Layer 2: Session protocol

Six rules govern how a single working session runs, independent of which
lane it's in:

1. **One session, one queue item, and stop early if it finishes early.**
   If the item completes with context to spare, update the playbook and
   stop. Don't reach for the next big item on a context budget that's
   already been spent; a fresh session with full context does that item
   better than a depleted one does.
2. **Open with the playbook pointer, not "explore the repo."** Read the
   playbook, then read the specific files the queue item names. Nothing
   else, up front. Broad re-exploration at the start of every session is
   exactly the cost this method exists to eliminate.
3. **Spec-first across classes.** Anything designed in one class and
   executed in another crosses that boundary as a written spec, never as a verbal
   summary, a half-remembered plan, or an assumption that the executing
   session will "just know what was meant."
4. **End-of-session ledger update, and nothing more.** Touch the status
   column, the gap register, and the date line. This should take under a
   minute; the playbook is a ledger, not an essay. Don't rewrite the
   strategic frame or restate history that's already recorded: append the
   delta and stop. The update also carries a spend line: how the session
   entered (playbook pointer or ad hoc), class planned at Route vs. class
   run after re-scoring, dispatch count, output tokens by tier, and the
   counterfactual-flagship ratio where a dated price table makes it
   computable. It is records, not claims: it never asserts savings
   against an unmeasured baseline. See `docs/design/2026-07-06-spend-ledger-design.md` for the
   field format and the extraction recipe.
5. **Existing project gates always apply.** The method adds no exceptions
   for the verification a project already has: build, test, lint, review,
   fact-check, sign-off. Tokenomics is a routing and handoff discipline, not
   a license to skip verification.
6. **Full re-assessment only on an empty queue or a wrong-feeling frame.**
   Re-examining the whole strategic picture is itself expensive; reserve it
   for the moments that actually call for it: the queue running dry, or a
   session noticing that the ordering no longer makes sense, not as a
   per-session ritual.

## Layer 3: The living playbook

The playbook is the single cross-session re-entry point. It has six
components:

- **Status block**: states plainly what the document owns, and what it is
  and isn't canonical for. A reader should be able to tell in one glance
  whether this document is the source of truth for a given question.
- **Strategic frame**: the reasoning behind the current queue order,
  including the one ordering rule everything else follows. Not a general
  mission statement; the specific logic that decided what comes next.
- **Work queue**: the ordered list of upcoming items, sized to fit one
  session wherever possible, carrying at minimum a Lane column, a Size
  column, and a Status column.
- **Gap register**: findings and open issues with a severity, closed with
  the identifier that resolved them (a PR number, a filing ID, a published
  URL) or reframed with a stated reason when they're deprioritized rather
  than fixed.
- **Done ledger**: shipped items kept verbatim, including
  "do-not-re-derive" findings: conclusions that were expensive to reach the
  first time and must not be silently re-investigated by a later session
  that didn't know they'd already been settled.
- **Standing constraints**: the project's non-negotiables, carried
  in-document so no session has to re-derive them from scratch. Where a
  constraint has a canonical source elsewhere, this section links to it
  rather than duplicating it.

Two of the six — the work queue and the gap register — are exactly the
ground an issue-tracker-first tracking convention claims for itself. When
one is co-installed, those two components delegate and the playbook keeps
the rest; see §The seam below.

The property that makes all six worth maintaining is a single pointer: read
the playbook, take the next unclaimed item in your lane. That one sentence
replaces repo re-exploration at the start of every session. A session that
opens by reading the playbook and its named files starts with exactly the
context it needs; a session that opens by re-exploring the repository pays,
again, for context the playbook already held.

## Layer 4: Tiered orchestration

Layers 1 through 3 describe a single session. Layer 4 describes the cycle
across sessions and tiers, in the practice that produced this method:

- The higher classes (pathfinder, navigator) take planning, complex
  reasoning, and the expensive-to-get-wrong parts of the work. The moment
  that work is scoped, re-scoring drops it (a decision is made, a spec is
  written) and it hands a written spec down-tier: it does not continue
  holding the problem just because it's still in context.
- Builder-class sessions execute the spec. Where the implementation, test,
  and review work can be further parallelized, such a session spawns
  keeper-class subagent teams to carry it out.
- Results hand back up only at verification gates. The higher tier
  never re-derives what a spec already records; if a spec was wrong, that's
  a finding for the gap register, not a reason to redo the planning from
  scratch inline.
- Sessions stay specific and tightly scoped. Scoping is itself the main
  context-cost control in this method: a narrowly scoped session finishes
  cleanly inside its budget; a loosely scoped one drifts and spends more
  than the task warranted.

Layer 4's loop is governed by a controller contract — four rules that
hold whenever one context is running cycles beneath itself, whatever
the harness:

- **Controller discipline.** A controller is a meso cycle running
  micro cycles. It dispatches on briefs, never by forwarding raw
  context, and it aggregates sub-agent spend into its own spend line —
  dispatch count and out-tokens by tier roll *up*, so the ledger stays
  truthful when work is parallelized.
- **Dispatch contract.** A micro brief is the handoff-spec template at
  its smallest size — the contract is scale-invariant, so no section
  is dropped, only shortened. A worked micro brief, whole:

  > Handoff: Q-17 status-table refresh · micro · builder → keeper
  > (class 4, score 0)
  > **Goal:** the six status rows in the catalog doc match the done
  > ledger. **Context pointers:** the catalog doc; the playbook's done
  > ledger; nothing else. **Decisions already made:** row order stays
  > (readers link to anchors); status wording copied verbatim from the
  > ledger. **Deliverables:** the catalog doc, status column only.
  > **Gates:** link gate green; diff touches one column. **Out of
  > scope:** every other column and all surrounding prose. Standing
  > escalation clause applies.

- **Parallelism rule.** Parallelize only work that is independent
  *and* verifiable down-class. Parallel pathfinder dispatches are a
  smell: work that needs pathfinder judgment usually needs the one
  context that holds the frame.
- **Surfacing rule.** Sub-agent findings cross at Return inside the
  report, never as leaked context; the controller promotes the
  findings that outlive the session at Close. This is the
  one-level-at-a-time escalation property (§The cycle), restated for
  orchestration.

The cycle has one governing rule for when premium access is scarce in time
rather than in judgment:

**Tier-scarcity rule:** when premium access is time-boxed, tier scarcity dominates urgency. Anything a cheaper tier can execute from an existing
spec is deferred past the premium window, even when it is the more urgent
item in the abstract. Every premium session should leave a cheaper-tier-
executable spec behind: that spec is what lets the urgent-but-cheap item
get done without spending scarce top-tier time on it.

## The seam: composing with a tracking convention

Tokenomics overlaps with issue-tracker-first tracking conventions at
exactly one point: the playbook carries a work queue and a gap register,
and a convention whose first principle is "work state lives in issues and
milestones, never prose ledgers" claims that same ground. Co-installed,
one must yield. The seam is a division of ownership, not a merge:

**The tracker wins on work state; tokenomics wins on spend.**

- **Standalone** (no tracking convention installed): nothing changes. The
  playbook owns the queue and the gap register exactly as Layer 3
  describes. Standalone is the unmarked case; the rest of this section
  activates only on co-installation.
- **Co-installed:** the work queue delegates to issues and milestones,
  and the gap register to filed debts. The playbook keeps everything the
  tracker has no opinion on — the strategic frame, the routing classes
  and the operator's mapping, the spend ledger, the done ledger's
  do-not-re-derive findings, and the standing constraints — and its queue
  references become issue numbers. In return, tokenomics annotates the
  tracker's world: an issue carries a **lane** (its class), and a closing
  record carries a **spend line**. The tracker owns *what and when*;
  tokenomics owns *what class and at what cost*.

Under interop the switchpoints keep their contracts; two crossing
artifacts change address. Route's queue-line-carrying-a-class becomes an
issue carrying a lane label. Close's exit splits by owner: the work-state
half (status, what shipped) lands in the issue's closing record, while the
ledger line and spend line stay in the playbook, which remains canonical
for spend — the spend line copied into the closing record is an
annotation for the tracker-side reader, never a second source of truth.
Dispatch and Return are unaffected: handoff specs and reports never
lived in the playbook to begin with.

The seam is designed so the tracker needs no change to benefit: lane and
spend annotations ride in issue bodies and closing comments every issue
tracker already has. The convention this seam was designed against is
**recursive-spine** (named here once, the same quarantine model names
get); any convention matching the shape — issues own work state, closings carry a structured record — composes the same way.
Interop is offered, never forced: the bootstrap skill offers it only
when it detects such a convention installed, mirroring the etiquette of
conventions that offer tokenomics wiring without requiring it.
Plumb-line, the epistemic-honesty discipline, composes with both
independently; nothing in this seam wires to it.

## Rationale

### Classes of work, not tiers

Lanes are classes of work (pathfinder, navigator, builder, keeper), never
named for a model or a tier, so the method doesn't date itself and the
word "lane" never doubles as a tier name. Model generations turn over on a
timescale of months; the distinctions the three questions draw (is this
new ground, is a slip expensive, would checking it mean redoing it) do
not. A single consequence question cannot place work that is cheap to get
wrong but needs deep, novel understanding (exploration); three questions
can. Which tier serves a class is the operator's mapping. Today's model
names appear exactly once in this document, in the dated mapping table in
Layer 1. When that table goes stale, update it: the classes, the
questions, and the rest of this method don't need to change.

### Playbook as ledger

A living, append-mostly document beats a fresh strategic assessment every
session for three reasons. One pointer (read the playbook, take the next
item in your lane) replaces the cost of re-exploring a repository at the
start of every session; that cost is paid once, when the playbook is
written or updated, instead of once per session forever after. The done
ledger prevents paid re-derivation: a finding that cost top-tier
reasoning to reach the first time should never cost that again because a
later session didn't know it had already been settled. And wholesale
rewrites of the playbook are forbidden by the session protocol's own rule
(the end-of-session update touches the status column, the gap register, and
the date line, nothing else) because a document that gets rewritten
wholesale stops being a ledger and starts being a new essay every session,
which defeats the purpose it exists to serve.

## When this doesn't pay

This method spends an expensive tier's judgment once and reuses it cheaply.
Where there is nothing to reuse, or no cheaper tier to reuse it on, the
overhead is ceremony. Three shapes cross that line:

- **No tier differential.** If every task runs on the same model anyway
  (only one tier is available, or the project is small enough that the top
  tier never hands down), routing is a label with no destination and the
  handoff spec has no second reader. Keep the routing *questions* as a triage
  habit if it earns its keep; drop the classes, the specs, and the ledger.
- **Single-context work.** The playbook and the handoff spec pay off at
  cycle boundaries, where working context dies and only the distilled
  artifact crosses. Work that starts and finishes inside one context never
  crosses a boundary: there is nothing to compress and nothing to hand off.
  A one-off script, a single-sitting fix, a prototype you will throw away:
  do the work, skip the ledger.
- **Throwaway output.** If the artifact is discarded, the paid-once judgment
  is never spent a second time, so there was never anything to bank.

The rule is Q2 turned on the process itself: **if getting the
process slightly wrong is not expensive, don't run the process.** This
matters more as orchestration lands, not less. Every switchpoint invites
ceremony around it, and a fan-out of subagents to produce one paragraph
costs more than it saves. Reach for the machinery when the work is large
enough, repeated enough, or costly-enough-to-get-wrong to amortize it;
below that line, the honest move is to not.

## Maturity

This method is a practice report, not a benchmark. It has been validated on
one real project (a private, pre-release research instrument; see the
structure-faithful abstraction of its playbook, archived at
[`../examples/archive/abstracted-playbook-v0.4/`](../examples/archive/abstracted-playbook-v0.4/)
under the v0.4 lane names) and no
controlled comparison against alternative approaches exists. Treat it as
current for the practice it describes, not as a proven-optimal strategy.
If your project's shape differs substantially from the one it was drawn
from, expect to adapt the class boundaries and the playbook components
rather than apply them unmodified.
