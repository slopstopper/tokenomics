# Routing axes: design spec (v0.5.0, #25)

Status: **spec, not implemented.** Shape agreed in the 2026-10-03
brainstorm (owner + Claude), recorded on #25. Classes **named by the
owner** (see Names). Nothing here changes the method doc, skills,
templates, or labels yet; the implementation half executes from this spec.

## Problem

1. **Four tiers, three lanes.** The mapping table puts the top two model
   tiers in one Flagship row. The method was built to separate exactly
   those two (spend the top tier only where it is clearly worth it), so
   the decision it exists for is the one its lanes cannot express.
2. **The routing test asks one question.** "If this is done slightly
   wrong, is it expensive?" measures consequence only. Work that is cheap
   to get wrong but needs deep, novel understanding to do well
   (exploration) has nowhere to go.
3. **Lane is used two ways.** Layer 1 defines lanes by the nature of the
   work; bootstrap and the spend ledger use them as model tiers. Lane and
   tier, both tokenomics-owned terms (marketplace `shared-vocabulary.md`),
   blur.

## Decision: lane = class of work, scored on three axes

### The three questions

Asked of the work, before a lane is assigned, and again at every
boundary (see Re-scoring).

| # | Axis | Question | "Yes" means |
| - | ---- | -------- | ----------- |
| Q1 | Capability demand | Is this new ground: no precedent, pattern, or spec **in the project** to follow, or does it cross domains? | it needs understanding the project does not already hold |
| Q2 | Consequence | If it is slightly wrong, is that expensive: costly to fix, built on by other work, or **impossible to undo**? | errors cost; note separately whether the cost is *irreversibility* |
| Q3 | Verification | Would checking it mean redoing it: no test, contract, or gate that confirms it cheaply? | the gates do not reach it |

"Precedent in the project", not in the person: a builder new to a domain
does not make everything novel. The project's specs, patterns, and
playbook entries are the reference.

### Scoring: count the yeses (owner: AND, not OR)

| Yeses | Class | Default mapping |
| ----- | ----- | --------------- |
| 3 | 1 · **pathfinder** | top tier |
| 2 | 2 · **navigator** | second tier |
| 1 | 3 · **builder** | mid tier |
| 0 | 4 · **keeper** | small tier |

### Names (owner, 2026-10-03)

Titles, chosen to sound right as a team. Each class also carries a
three-word card for teaching (title · what the work asks for · relation
to precedent):

| Class | Label | Card |
| ----- | ----- | ---- |
| 1 | `lane:pathfinder` | pathfinder · frontier · uncharted |
| 2 | `lane:navigator` | navigator · judgment · charted |
| 3 | `lane:builder` | builder · build · specified |
| 4 | `lane:keeper` | keeper · routine · automatic |

Pathfinder and navigator both describe movement through territory, which
fits the new-ground axis. **Collision resolved:** "builder" was the
family's word for the *person* using the method (about 300 uses across
tokenomics, recursive-spine, plumb-line, hq and the marketplace
vocabulary). The owner chose to give the lane the word and rename the
person **operator**: someone running a coding agent is operating the
project. See Implementation.

### Veto (owner: add now)

**Irreversible AND unverifiable → class 1, whatever the count.** Q2's
"yes" is irreversibility specifically (not merely expensive), and Q3 is
"yes". This is the method's worst case: the wrong version reads like the
right one, and it cannot be taken back. Without the veto, familiar
irreversible work (e.g. a data migration following a known pattern)
scores 2.

### Spot checks

| Work | Q1 | Q2 | Q3 | Score | Class |
| ---- | -- | -- | -- | ----- | ----- |
| lint sweep | no | no | no | 0 | 4 |
| implementation from a spec, with tests | no | yes | no | 1 | 3 |
| familiar design call, no gate | no | yes | yes | 2 | 2 |
| exploration (disposable) | yes | no | yes | 2 | 2 (navigator), passed up by escalation when needed |
| novel load-bearing architecture | yes | yes | yes | 3 | 1 |
| familiar migration, irreversible, unverifiable | no | yes (irreversible) | yes | 2 → **veto** | 1 |

## Re-scoring: passing down and passing up

The class is not fixed for the life of the work. **Re-score at every
boundary** (Route, Dispatch, Return, Close):

- **Passing down.** A decision made or a spec written changes the answers:
  there is now precedent (Q1 → no) and often a gate (Q3 → no). The score
  drops, so the tier drops. The owner's original practice (expensive
  part decided, execution should move down) is a consequence of
  re-scoring, not a separate rule.
- **Passing up.** A Return (escalation) re-scores upward, e.g.
  exploration that turned out to be load-bearing.
- **Tier inertia** is what happens when nobody re-scores. Boundary nudges
  (#30) are prompts to re-score.

## Mapping table

- The four classes are method doctrine. **Which tier serves each class is
  the operator's mapping**, set in their playbook. An operator with two tiers
  maps four classes onto two; the bootstrap interview asks for the
  mapping, never ships one. (Replaces "ship no default lanes": the method
  now ships classes, still no default mapping.)
- The method doc keeps **one dated example mapping**, the only place
  concrete model names appear (CI rule unchanged), now four rows instead
  of three.
- **Effort lives in the mapping**, not the class: e.g. "class 2 → second
  tier, high effort". Data (spend-line `effort`, #32 turn counts)
  decides the defaults.

## Spend line

The provisional fields (`2026-10-03-spend-line-gathering.md`) gain:

- `class <n> (score <s>[, veto])` at Route, and the re-scored class at
  each crossing where it changed;
- `escalation <cause>`: `misscored` (an answer was wrong at Route: the
  routing test failed) or `under-provisioned` (class right, mapping's tier
  or effort insufficient: the mapping failed).

## Experiments (owner: agreed)

1. **Class 1/class 2 boundary.** Sample class-2 work, especially
   exploration and new-user exploration, and run a share on both tiers,
   compared blind (the adversarial-verify pattern from the G9 audit).
   Tests whether the count and veto route the top tier correctly.
2. **Exploration pattern.** "Class 2 with escalation" against "class 1
   throughout" against "diverge cheap, converge higher": spend fields and
   #32's turn counts, same kind of task.
3. **Turn count** (#32): does routing to the cheaper tier lose to extra
   turns? Bears on whether class 3/4 defaults should lift.

Descriptive comparisons only, never-claim rules apply, n stated.

## Implementation (executes from this spec)

| Where | Change |
| ----- | ------ |
| `reference/portable-method.md` Layer 1 | three questions, scoring, veto, re-scoring; four-row dated mapping |
| `reference/playbook-template.md` | Model routing section: class → tier mapping table (builder's) |
| `reference/handoff-spec-template.md` | handoff records class and score |
| `skills/tokenomics-method` | teach the three questions verbatim |
| `skills/tokenomics-handoff` | Route applies the three questions; Mode B records class/score/escalation cause; Dispatch re-scores |
| `skills/tokenomics-bootstrap` | interview asks for the class → tier mapping; "ship no default lanes" becomes "ship no default mapping" |
| `evals/*.json` | re-anchor routing-test assertions (they go UNRESOLVED by design); add anchors for the veto and re-scoring |
| examples (two playbooks) | re-route their queues under the four classes |
| CHANGELOG / version | **v0.5.0**: a change of meaning, minor bump; migration note for anyone using the three-lane names |
| recursive-spine (separate PR there) | `lane:*` labels move from three to four, tier-named → class-named (`lane:pathfinder/navigator/builder/keeper`) |
| marketplace `shared-vocabulary.md` | lane = class of work; tier = model rank; **operator** = the person using a tool |
| **person rename, family-wide** (one PR per repo) | "builder" (the person) → **operator**: tokenomics (~53), recursive-spine (~101), plumb-line (~150), hq (~3), marketplace (1). Mechanical but read each hit: only the *person* sense changes. Lands **before** `lane:builder` ships anywhere, so the two senses never coexist. |

## Not yet known

- Whether builders can answer Q1–Q3 at Route reliably; if they can't, the
  extra precision is ceremony.
- Whether the veto is the only weighting needed; the data may show other
  combinations mis-route.
- Whether effort can stand in for a tier step (e.g. second tier at max
  effort ≈ top tier on class 1 work). If so, the mapping collapses rows
  for some builders, which the design allows.
