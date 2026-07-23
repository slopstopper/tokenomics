# Domain gallery: the method across fields

The method assumes only two things: *some model calls cost more than others*
for your setup, and *your project outlives a single session*. Both hold in far
more places than software. Two full worked playbooks show the method in depth:

- [`abstracted-playbook/`](abstracted-playbook/): a real (code) project: a
  browser-local research instrument. Schemas, invariants, the full technical
  shape.
- [`analytical-desk-playbook/`](analytical-desk-playbook/): a non-code
  analytical/research desk. The gate-reach routing axis at its sharpest.

This page is the breadth counterpart to those two depth examples. Each vignette
below maps the method's vocabulary into a different field and calls out **the
one mechanic that field demonstrates most sharply**, then points at whichever
full playbook is closest to copy from.

**What never changes.** The four layers, the routing test and its second axis,
the three-lane structure, the lane-scarcity rule, the living playbook's six
components, and the do-not-re-derive ledger are identical in every field below.
Only the nouns move: what a gap closes *with*, what the *gates* are, what a
cycle's *deliverable* is. If a mapping row ever forces a change to a layer, that
is a finding worth reporting, so far none has.

---

## Editorial / publishing production

A recurring publication: an editorial operation producing several pieces per
cycle from a shared editorial line, across sessions.

| Method mechanic | In this field |
| --------------- | ------------- |
| Gap closes with… | the **published URL / issue number** |
| The gates are… | **copyedit pass, fact-check, style-guide check, link-check** |
| A cycle's deliverable is… | a **published piece / an edited draft** |
| The sensitive design call | the **cycle's editorial line and angle**: wrong, and every piece written under it is wasted |
| The small lane does… | headline formatting, tag/metadata cleanup, alt-text, link-checking |
| Standing invariant | no piece publishes without the fact-check pass; the line is set *before* drafting, not during |

**Mechanic it demonstrates most sharply: the high-volume mid-lane handoff and
the lane-scarcity cadence.** The flagship sets the cycle's editorial line and
outlines the slate *once*: expensive, because a wrong line is wrong across the
whole issue. Every individual piece is then a **mid-lane draft-from-outline**,
and formatting is small-lane. When flagship access is time-boxed, the
lane-scarcity rule bites cleanly: spend the window only on setting lines and
outlining slates for *future* issues (banking mid-executable outlines) and
never on drafting a single piece, however urgent, because a mid can draft any
piece whose line is already set.

*Closest deep-dive:* [`analytical-desk-playbook/`](analytical-desk-playbook/).

---

## Legal / compliance filings

A legal or compliance desk producing filings and memos against external
deadlines, across sessions.

| Method mechanic | In this field |
| --------------- | ------------- |
| Gap closes with… | the **filing ID / docket number** |
| The gates are… | **cite-check, precedent verification, reviewer sign-off, a rule-compliance checklist** |
| A cycle's deliverable is… | a **filed document / a cleared memo** |
| The sensitive design call | the **legal theory / argument structure**: expensive to unwind once filed |
| The small lane does… | citation formatting, exhibit assembly, docket entry, deadline calendaring |
| Standing invariant | nothing files without sign-off and a completed compliance checklist; deadlines are fixed and set the calendar |

**Mechanic it demonstrates most sharply: standing constraints plus hard
external deadlines driving the lane-scarcity rule.** Deadlines here are
immovable, so lane scarcity bites hardest: when flagship time is short and a
deadline looms, the scarce budget goes to the argument and theory (the only
work a cheaper tier cannot do) while drafting-from-theory and cite-checking are
banked as mid/small work that can run right up to the filing deadline without
any flagship time. The standing-constraints section does real work under
pressure: it carries the non-negotiable procedural rules in-document so no
session re-derives filing requirements against the clock.

*Closest deep-dive:* [`analytical-desk-playbook/`](analytical-desk-playbook/).

---

## Data / ML experimentation

An ML research effort running experiments across many sessions toward a model or
a result.

| Method mechanic | In this field |
| --------------- | ------------- |
| Gap closes with… | the **experiment ID / run URL** |
| The gates are… | the **eval harness on a held-out set, a seed-reproducibility check, data-pipeline tests** |
| A cycle's deliverable is… | a **logged run + its result / a trained checkpoint** |
| The sensitive design call | the **eval design and the metric**: no cheap gate; a wrong metric makes every downstream experiment measure the wrong thing |
| The small lane does… | hyperparameter-sweep batches under an automated metric gate, data-cleaning passes, run-logging, plot regeneration |
| Standing invariant | every reported number ties to a logged run + seed; no claim from an unlogged experiment; the eval set is never touched during development |

**Mechanic it demonstrates most sharply: the do-not-re-derive ledger at full
strength.** This is where the done ledger earns the most, because re-derivation
here costs compute, not just time. Settled experimental findings are exactly the
expensive-to-reach conclusions a later session will burn GPU-hours
rediscovering if they aren't frozen. A worked note reads:

> **Architecture-A vs B at this scale (settled: do not re-run).** A
> underperforms B by a stable margin across three seeds (runs #211–#219);
> holds at ≤ the current parameter budget. *Boundary:* re-open only above that
> budget: the gap narrowed at the top of the swept range and may invert.
> Learning rates above 3e-3 diverged in every run (#220–#224): dead region,
> do not re-sweep.

The note freezes both the finding *and its boundary of validity*, so a later
session neither re-runs the dead region nor over-trusts the result outside its
tested range. Note the second routing axis in the "sensitive design call" row:
the metric has no cheap gate (checking it means re-running everything) so it
stays flagship even though a sweep under it is small-lane work.

*Closest deep-dive:* [`abstracted-playbook/`](abstracted-playbook/): its power
study, harnesses, and green-gate discipline are the nearest technical match.

---

## Building your own

Whatever the field, start from
[`../reference/playbook-template.md`](../reference/playbook-template.md) and the
[`../reference/handoff-spec-template.md`](../reference/handoff-spec-template.md);
both are field-agnostic. Fill the mapping row for your domain (what a gap
closes with, what your gates are, what a cycle delivers) and the rest of the
skeleton is unchanged from the examples above.
