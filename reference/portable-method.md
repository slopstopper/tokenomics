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

Builders with tiered access to models (usage limits, time-boxed premium
windows, per-token billing, or any mix of these) running projects that span
more than one session. It matters most for solo builders, who don't have a
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
| **Macro** | weeks: the project arc | strategic frame + work queue (the playbook) | re-assessment; an updated frame and queue | flagship |
| **Meso** | hours: one session | the playbook pointer + one queue item, or a handoff spec | verified deliverable + the end-of-session ledger update | the lane the queue item names |
| **Micro** | minutes: one subagent task | a task brief | a report and a reviewed deliverable (a diff, a draft, a checked dataset) | the cheapest capable tier |

Three properties of this nesting do the actual token saving.

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
rule: when the receiving tier discovers mid-cycle that the work fails its
lane's routing test (the judgment calls keep coming, the gates don't
reach, the turns multiply) it stops and hands back up with what it
learned: what was tried, what broke, and what decision is actually needed.
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
those points made addressable: the place where work switches lane,
tier, or direction, and where a rule stated elsewhere in this method
is applied. Naming the switchpoints is what makes the method
orchestratable: anything that can observe a switchpoint — a builder,
a controller model, a hook — can enforce the rule that belongs to it.

Every switchpoint carries the same three-part contract: a **trigger
condition** (what you observe), the **rule that fires** (nothing
below is new doctrine — the taxonomy names rules this document
already states), and the **crossing artifact** (nothing crosses a
switchpoint except a distilled artifact).

| Switchpoint | Trigger | Rule that fires | Crossing artifact |
| ----------- | ------- | --------------- | ----------------- |
| **Route** | scope time — work is about to be assigned a lane | the routing test and its verification axis (Layer 1) | a queue line carrying a lane |
| **Dispatch** | a controller hands work down — session to session, or controller to subagent | the spec-first rule (Layer 2); the lane-scarcity rule (Layer 4) | a handoff spec or task brief |
| **Return** | the receiving tier meets its exit bar — or discovers it cannot | the project's gates on the success path; the escalation rule on the failure path | a report and reviewed diff, or an early-return escalation artifact |
| **Close** | a cycle boundary — the session or the arc ends | the compression point; the ledger and spend-line update (Layer 2, rule 4) | a ledger line plus spend line |

Switchpoints are not a fifth layer. They are the cycle's boundary
events (§The cycle) made addressable — Route and Dispatch on the way
down, Return and Close on the way up. Route and Close mark a cycle's
own boundaries; Dispatch and Return mark the boundaries of every
cycle it runs beneath itself. Return's two paths — the verified exit
and the early escalation — are the same crossing in opposite moods,
and both land one level up, never further.

## Layer 1: Routing

Work is routed to one of three lanes, defined by the *nature of the work*,
never by what happens to be available at the moment:

- **Flagship lane**: design-heavy, statistically or mathematically subtle,
  novel, cross-domain, or corpus-wide work; anything touching a schema, an
  invariant, a taxonomy, or a definitional boundary where a wrong decision is
  expensive to unwind.
- **Mid lane**: execution from a written spec; review passes against a
  settled standard (a code review, an edit pass, a cite-check); coverage
  expansion against existing contracts; updates that follow an established
  pattern.
- **Small lane**: high-volume, low-judgment, mechanical batches with
  automated green-gate verification: lint sweeps and type-annotation ratchets
  in code, citation formatting and link-checks in prose, data-cleaning passes
  in analysis, status refreshes and archiving anywhere: work where a script,
  a checklist, or a test suite can confirm correctness without judgment.

The routing test is one question, asked before any task is assigned a lane:

**"If this is done slightly wrong, is it expensive?"**

- Yes → flagship. The cost of a wrong decision here compounds; pay for
  judgment up front.
- Clear contract with tests → mid. Correctness is checkable against
  something already written down.
- Mechanical with automated verification → small. A green gate is enough.

The test has a second axis, usually left implicit: **the cost of
verification.** Routing down is safe exactly as far as your gates reach:
tests, contracts, diffs, checks that make correctness cheap to confirm
without judgment. Work with no cheap gate (design prose, a taxonomy call,
anything where checking it means redoing it) is flagship work even when it
looks easy, because verification costs as much as execution and the wrong
version reads exactly like the right one. Route down only as far as your
gates reach; and when a scope-time routing call turns out wrong
mid-cycle, the escalation rule (§The cycle) applies: return early, don't
push through.

The test cuts against a natural but wasteful instinct: reaching for the
best model out of habit or anxiety, regardless of what the task actually
needs. The negative list makes that instinct concrete by naming what it
looks like in practice: never spend flagship budget on presentation polish,
formatting chores, status upkeep, running the gates, mechanical additions
against an existing pattern, or executing a spec another session already
wrote: in a codebase that is UI polish, lint, branch hygiene, CI runs, and
rote test additions; in a publishing or analytical operation it is the
equivalent low-judgment upkeep. Every item is checkable or pattern-following
work; none of it is expensive to get wrong, and none of it needs the tier
that costs the most to run.

Lane names are deliberately generic. They map to today's models like this:

| Lane      | one mapping, as of 2026-07 |
|-----------|----------------------------|
| Flagship  | Claude Fable/Opus-class    |
| Mid       | Sonnet-class               |
| Small     | Haiku-class                |

The lanes outlive any mapping. Model names and generations turn over
quickly; the shape of the work (what's expensive to get wrong, what's
routine, what's mechanical) does not. Keep the mapping current in your own
notes if it's useful, but route by the test above, not by brand name.

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
3. **Spec-first across lanes.** Anything designed in one lane and executed
   in another crosses that boundary as a written spec, never as a verbal
   summary, a half-remembered plan, or an assumption that the executing
   session will "just know what was meant."
4. **End-of-session ledger update, and nothing more.** Touch the status
   column, the gap register, and the date line. This should take under a
   minute; the playbook is a ledger, not an essay. Don't rewrite the
   strategic frame or restate history that's already recorded: append the
   delta and stop. The update also carries a spend line: lane planned vs.
   run, dispatch count, output tokens by tier, and the counterfactual-
   flagship ratio where a dated price table makes it computable. It is
   records, not claims: it never asserts savings against an unmeasured
   baseline. See `docs/design/2026-07-06-spend-ledger-design.md` for the
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

The property that makes all six worth maintaining is a single pointer: read
the playbook, take the next unclaimed item in your lane. That one sentence
replaces repo re-exploration at the start of every session. A session that
opens by reading the playbook and its named files starts with exactly the
context it needs; a session that opens by re-exploring the repository pays,
again, for context the playbook already held.

## Layer 4: Tiered orchestration

Layers 1 through 3 describe a single session. Layer 4 describes the cycle
across sessions and tiers, in the practice that produced this method:

- The flagship model takes planning, complex reasoning, and the
  expensive-to-get-wrong parts of the work. The moment that work is scoped,
  it hands a written spec down-tier: it does not continue holding the
  problem just because it's still in context.
- Mid-tier sessions execute the spec. Where the implementation, test, and
  review work can be further parallelized, a mid-tier session spawns
  small-model subagent teams to carry it out.
- Results hand back up only at verification gates. The flagship model
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

  > Handoff: Q-17 status-table refresh · micro · mid → small
  > **Goal:** the six status rows in the catalog doc match the done
  > ledger. **Context pointers:** the catalog doc; the playbook's done
  > ledger; nothing else. **Decisions already made:** row order stays
  > (readers link to anchors); status wording copied verbatim from the
  > ledger. **Deliverables:** the catalog doc, status column only.
  > **Gates:** link gate green; diff touches one column. **Out of
  > scope:** every other column and all surrounding prose. Standing
  > escalation clause applies.

- **Parallelism rule.** Parallelize only work that is independent
  *and* verifiable down-lane. Parallel flagship dispatches are a
  smell: work that needs flagship judgment usually needs the one
  context that holds the frame.
- **Surfacing rule.** Sub-agent findings cross at Return inside the
  report, never as leaked context; the controller promotes the
  findings that outlive the session at Close. This is the
  one-level-at-a-time escalation property (§The cycle), restated for
  orchestration.

The cycle has one governing rule for when premium access is scarce in time
rather than in judgment:

**Lane-scarcity rule:** when premium access is time-boxed, lane scarcity dominates urgency. Anything a cheaper tier can execute from an existing
spec is deferred past the premium window, even when it is the more urgent
item in the abstract. Every premium session should leave a cheaper-tier-
executable spec behind: that spec is what lets the urgent-but-cheap item
get done without spending scarce flagship time on it.

## Rationale

### Tier-generic lanes

Lanes are named flagship, mid, and small (never by a specific model name)
so the method doesn't date itself. Model generations turn over on a
timescale of months; the distinction between "expensive to get wrong,"
"executable from a written contract," and "mechanical with an automated
gate" does not. Today's model names appear exactly once in this document,
in the mapping table above, labeled with the date the mapping was current.
When that mapping goes stale, update the table: the lanes, the routing
test, and the rest of this method don't need to change.

### Playbook as ledger

A living, append-mostly document beats a fresh strategic assessment every
session for three reasons. One pointer (read the playbook, take the next
item in your lane) replaces the cost of re-exploring a repository at the
start of every session; that cost is paid once, when the playbook is
written or updated, instead of once per session forever after. The done
ledger prevents paid re-derivation: a finding that cost flagship-tier
reasoning to reach the first time should never cost that again because a
later session didn't know it had already been settled. And wholesale
rewrites of the playbook are forbidden by the session protocol's own rule
(the end-of-session update touches the status column, the gap register, and
the date line, nothing else) because a document that gets rewritten
wholesale stops being a ledger and starts being a new essay every session,
which defeats the purpose it exists to serve.

## Maturity

This method is a practice report, not a benchmark. It has been validated on
one real project (a private, pre-release research instrument; see the
structure-faithful abstraction of its playbook at
[`../examples/abstracted-playbook/`](../examples/abstracted-playbook/)) and no
controlled comparison against alternative approaches exists. Treat it as
current for the practice it describes, not as a proven-optimal strategy.
If your project's shape differs substantially from the one it was drawn
from, expect to adapt the lane boundaries and the playbook components
rather than apply them unmodified.
