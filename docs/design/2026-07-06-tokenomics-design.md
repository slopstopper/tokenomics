# tokenomics: design spec

Date: 2026-07-06
Status: accepted (owner-approved in the brainstorming session that produced it)
Origin: extraction of the method behind the model-effectiveness playbook of
a private, pre-release research project, generalized for any project.
Amended 2026-07-06: the worked example ships as a structure-faithful
abstraction of that playbook rather than a verbatim copy, because the source
project is unreleased.

## What this is

Tokenomics is the discipline of spending model capability like a scarce
budget: the expensive model does only the work that is expensive to get
wrong, every handoff crosses tiers on a written spec, and a living playbook
(not re-exploration) carries strategy between sessions.

The deliverable is a standalone, public, shareable repository that is also an
installable Claude Code plugin. The `plumb-line` extraction is the precedent
(README manifesto + reference docs + skills + worked example), but the
structure follows what tokenomics is (maximizing the token economics of
model tiering) rather than mirroring plumb-line part for part. The
recurring operational moment of this discipline is the **handoff** (scope →
lane → written spec → cheaper tier executes), so that is what the third
skill operationalizes; there is no audit half and no runtime half.

## Goals

1. Make the method portable: someone with no knowledge of the source
   project can read one document and run the discipline on their own project.
2. Make it operational, not aspirational: skills that teach it, bootstrap it
   into a project, and run its routing and handoff moments in practice.
3. Keep it honest about maturity: validated on one real project; a practice
   report, not a benchmark.

## Non-goals (v0.1)

- No enforcement adapters, hooks, or runtime primitives. Tokenomics is a
  process discipline; nothing exists yet for a git hook to check. A
  session-start playbook-pointer injection hook is a recorded "planned"
  item only.
- No audit skill. The discipline is enforced by the generated playbook's own
  session protocol and ledger, not by after-the-fact review machinery.
- No ADR directory. The two durable rationale decisions (tier-generic lanes;
  playbook-as-ledger) are short rationale sections inside
  `portable-method.md`, where they are actually read.
- No token counters, cost calculators, or pricing claims.
- No model-name coupling: lanes are tier-generic (flagship / mid / small);
  today's model names appear only as one illustrative mapping.

## Repository layout

```
tokenomics/
  README.md                     manifesto + install + layout
  LICENSE                       MIT
  .claude-plugin/
    plugin.json                 name: tokenomics
    marketplace.json            repo is its own plugin marketplace
  skills/
    tokenomics-method/SKILL.md
    tokenomics-bootstrap/SKILL.md
    tokenomics-handoff/SKILL.md
  reference/
    portable-method.md          canonical method doc (four layers + rationale)
    playbook-template.md        fill-in-the-blanks playbook skeleton
    handoff-spec-template.md    what a lane-crossing spec must contain
  examples/
    abstracted-playbook/
      README.md                 annotation: what to notice in the example
      model-effectiveness-playbook.md   structure-faithful abstraction of the real playbook
  docs/
    design/2026-07-06-tokenomics-design.md   this spec
```

## The portable method (reference/portable-method.md)

Four layers; each is stated as principle → mechanics → anti-patterns.

### Layer 1: Routing

Three tier-generic lanes defined by the *nature of the work*, never by
availability:

- **Flagship lane**: design-heavy, statistically or mathematically subtle,
  novel, cross-domain, or corpus-wide work; anything touching schemas,
  invariants, or taxonomy where a wrong decision is expensive to unwind.
- **Mid lane**: implementation from a written spec; code review passes;
  test expansion against existing contracts; doc updates following an
  established pattern.
- **Small lane**: high-volume, low-judgment, mechanical batches with
  automated green-gate verification (lint sweeps, status refreshes,
  type-annotation ratchets, archiving).

The one-line routing test: **"If this is done slightly wrong, is it
expensive?"** Yes → flagship. Clear contract with tests → mid. Mechanical
with automated verification → small.

The negative list is explicit: never spend flagship budget on UI polish,
formatting/lint chores, status upkeep, branch hygiene, running CI,
mechanical test additions, or executing a spec another session already
wrote.

### Layer 2: Session protocol

1. One session, one queue item. If an item finishes early, update the
   playbook and stop; don't start the next big item on a depleted context.
2. Open with the playbook pointer, not "explore the repo": read the
   playbook, the files the queue item names, nothing else up front.
3. Spec-first for anything designed in one lane and executed in another.
4. End-of-session ledger update: status column, gap register, date line,
   under a minute; the playbook is a ledger, not an essay.
5. Existing project gates always apply; the method adds no exceptions.
6. Full re-assessment only when the queue is empty or the strategic frame
   feels wrong, not per session.

### Layer 3: The living playbook

The document pattern itself, as the single cross-session re-entry point:

- **Status block**: what the doc owns and is/isn't canonical for.
- **Strategic frame**: why the queue is ordered the way it is; the one
  ordering rule everything follows.
- **Work queue**: ordered items sized to one session where possible, with
  Lane / Size / Status columns.
- **Gap register**: findings with severity; close with the PR number,
  reframe with a reason.
- **Done ledger**: shipped items kept verbatim, including
  "do-not-re-derive" findings, so no session pays to rediscover them.
- **Standing constraints**: non-negotiables carried in-document so no
  session re-derives them; linked docs stay canonical.

One pointer ("read the playbook, take the next unclaimed item in your
lane") replaces repo re-exploration at session start.

### Layer 4: Tiered orchestration

The cross-session cycle, from the practice that produced the method:

- The flagship model takes planning, complex reasoning, and the
  expensive-to-get-wrong parts. The moment work is scoped, it hands a
  written spec down-tier.
- Mid-tier models execute the spec and spawn small-model subagent teams to
  implement, test, and run review cycles.
- Results hand back up only at verification gates; the flagship never
  re-derives what a spec already records.
- Sessions stay specific and tightly scoped: scoping is itself the main
  context-cost control.
- **Lane-scarcity rule:** when premium access is time-boxed, lane scarcity
  dominates urgency. Anything a cheaper tier can execute from an existing
  spec is deferred past the window, even when it is the more urgent item in
  the abstract; every premium session should leave a cheaper-tier-executable
  spec behind.

### Rationale sections (in-document, replacing an ADR directory)

- **Tier-generic lanes.** Lanes are named flagship/mid/small rather than by
  model names so the method doesn't date itself; current model names appear
  once, as an illustrative mapping labeled with its as-of date.
- **Playbook as ledger.** Why a living, append-mostly document beats
  per-session re-assessment: one pointer replaces exploration; the done
  ledger prevents paid re-derivation; wholesale rewrites are forbidden.

### Maturity note

The method is a practice report validated on one real project (the worked
example); no controlled comparison exists. Say so plainly, in the
source-status vocabulary spirit: current for the practice, not benchmarked.

## The skills

- **tokenomics-method**: pure knowledge, takes no actions. Loads
  `reference/portable-method.md` for a builder who wants to learn or be
  reminded of the discipline. Mirrors `plumb-line-method`.
- **tokenomics-bootstrap**: interviews the builder: which model tiers they
  actually have and under what usage-limit shape; the project's green gates;
  where specs live; whether an existing backlog seeds the queue. Generates
  the project's `docs/model-effectiveness-playbook.md` from
  `reference/playbook-template.md` with their answers. Ships no default
  lanes, invents no queue items, invents no answers.
- **tokenomics-handoff**: the recurring operational skill, used at the two
  moments where tokens are actually saved. **Going down-tier:** given a task
  (or the next queue item), apply the routing test, assign a lane, and (when
  the work crosses tiers) produce the handoff spec from
  `reference/handoff-spec-template.md` so a cheaper tier executes without
  re-derivation. **Closing a session:** perform the end-of-session ledger
  update (status column, gap register, date line, nothing else). It flags,
  inline, when a task fails the routing test for the tier about to do it
  (e.g. flagship about to do negative-list work).

## The worked example

`examples/abstracted-playbook/` carries a structure-faithful abstraction of
the source project's real `model-effectiveness-playbook.md` (every section,
table shape, and working mechanic preserved; item titles, domain terms,
findings, and identifiers generalized pending the project's release) plus
an annotation README pointing at what to notice: the Lane column in action,
the ledger discipline, the lane-scarcity window note, the
"do-not-re-derive" schema-placement note, and the routing negative list.
The abstraction is labeled as such in the example itself; it is never
presented as the verbatim artifact.

## Delivery

- New public repo `github.com/effythealien/tokenomics`, local at
  `~/Documents/GitHub/tokenomics`, built directly on `main` (new docs-only
  repo; no code gates exist yet).
- Install story mirrors plumb-line: the repo is its own marketplace
  (`/plugin marketplace add effythealien/tokenomics`, then
  `/plugin install tokenomics@tokenomics`).
- License: MIT.

## Amendment: v0.2 (2026-07-06, owner-approved)

The four layers are components; at runtime they compose into one loop
(enter on a written brief, run at the cheapest capable tier, exit on a
verified artifact plus a ledger line) nested at three timescales: macro
(the project arc), meso (one session), micro (one subagent task). This
periodization view (owner's framing) was added to `portable-method.md` as
§The cycle, stating the two load-bearing properties explicitly: every cycle
boundary is a context-compression point, and findings escalate one cycle
level at cycle close (the up-channel). The handoff-spec template became
scale-invariant (same sections at meso and micro, sized to the cycle, with
a Scale line); the handoff skill's description and Mode B pick up the
boundary framing and the up-channel promotion rule. The repo also gained
its own `docs/model-effectiveness-playbook.md` (dogfooding), which queues
the v0.3 spend-ledger convention as W1.

## Acceptance

v0.1 is done when: the three skills (method, bootstrap, handoff) load and
describe/perform their jobs; `portable-method.md` reads standalone with no
source-project knowledge assumed and carries the two rationale sections; the
templates are fill-in-the-blanks usable; the worked example is annotated;
README covers install both ways; the repo is pushed and installable as a
plugin.
