# Worked example: an analytical desk (non-code domain)

[`model-effectiveness-playbook.md`](model-effectiveness-playbook.md) is a
second worked example, deliberately outside software, to show the method
carries beyond code. It models a one-person **analytical desk**: a standing
research operation that maintains a longitudinal evidence base on a structural
phenomenon across several sectors and publishes recurring briefs plus a
periodic synthesis.

It is a companion to the [`abstracted-playbook`](../abstracted-playbook/),
which is drawn from a real (code) project. This one is illustrative rather
than an abstraction of a single real desk — but every mechanic it shows is one
the method actually prescribes, and the skeleton is identical to the code
example's. That is the point: **only the domain vocabulary changed.**

## Same method, different vocabulary

Every load-bearing mechanic is present; the words around it are the desk's,
not software's.

| Method mechanic | Code example | This example |
| --------------- | ------------ | ------------ |
| Gap closes with… | a PR number | a **brief ID / published URL** |
| The gates are… | typecheck, build, lint, tests | a **fact-check pass, source-trace, numbers-reconcile** |
| A cycle's deliverable is… | a reviewed diff | a **published brief / an updated dataset** |
| The sensitive design call | schema-field placement | a **category-boundary definition** |
| The small lane does… | type-annotation ratchets, lint sweeps | **citation formatting, source-log normalization** |
| Standing invariant | "no interpretive value in the measured layer" | "logged evidence is never edited to fit the thesis" |

Nothing in the four layers had to change. That is the claim the second
example exists to make good on.

## What to notice

**The second routing axis, at its sharpest.** The `### Routing rule of thumb`
section is the reason this example was worth writing. An analytical desk
splits its work almost perfectly by *whether a cheap gate exists*: a
fact-checkable claim (does this quote match, does this number reconcile) has
one and routes down safely; a framing call (where the category boundary sits,
whether the synthesis holds) has none — checking it means redoing it — so it
stays flagship even when it looks like "just one sentence." Route down only as
far as your gates reach.

**The Lane column.** Every queue item carries its lane, decided at queue time,
not session time — routing is a property of the work, recorded when the work
is scoped.

**The ledger discipline.** Shipped items move to `### Done (shipped queue
items — ledger)` and their rows are kept verbatim. The only churn a normal
session produces is the status column, the gap register, and the "Last
updated" line.

**The lane-scarcity window.** The blockquote above the Now table is the
lane-scarcity rule in action: with premium access time-boxed, **lane scarcity
dominates urgency**. W10 (the verification runner) is the worked case — the
desk's top-risk item, deferred past the window anyway, because its design had
already landed and a mid model could build it.

**The do-not-re-derive note.** The `W3 definitional-boundary note` froze a
finished decision *and its full reasoning* — the two options, the finding that
collapsed the tension (no cumulative count had been published yet, so the
broad boundary was free), the timing consequence, and a mid-lane fallback
breakdown — so no later session pays to rediscover any of it.

**The strategic frame's one rule.** The frame ends in a single bolded ordering
rule ("work that increases the integrity, traceability, or coverage-honesty of
the evidence base outranks work that increases how much gets published") that
every queue decision cites.

Start from
[`../../reference/playbook-template.md`](../../reference/playbook-template.md)
and your desk's playbook will have the same skeleton.
