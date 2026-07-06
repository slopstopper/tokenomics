# Worked example: an abstracted playbook from a real project

[`model-effectiveness-playbook.md`](model-effectiveness-playbook.md) is an
abstraction of the real, in-use playbook of a private, pre-release project —
a browser-local research instrument. The structure, section order, table
shapes, and every working mechanic are preserved from the original; item
titles, domain terms, findings, and identifiers have been generalized
pending the project's release. Nothing is invented — each mechanic shown was
used in practice across several weeks of multi-session work — but the
specifics are deliberately not the real ones.

It is not an idealized sample: the abstraction was taken mid-history, with
real queue churn, real gaps in flight, and a real "Last updated" line still
on it.

## What to notice

**The Lane column.** Every queue item carries its lane (flagship / mid /
small) decided at queue time, not at session time. Routing is a property of
the work, recorded when the work is scoped — see the `Lane` column in every
work-queue table.

**The ledger discipline.** Shipped items move to `### Done (shipped queue
items — ledger)` and their rows are kept verbatim. The only churn a normal
session produces is the status column, the gap register, and the
"Last updated" line — the document is a ledger, not an essay.

**The lane-scarcity window.** The blockquote above the Now table
("Flagship availability window") is the lane-scarcity rule in action: with
premium access time-boxed, **lane scarcity dominates urgency**. W10 is the
worked case — the project's top-urgency item, deferred past the window
anyway, because its design had already landed and a mid model could build
it. Every window session leaves a mid-executable spec behind.

**The do-not-re-derive note.** The `W3 schema-placement note` blockquote
under the Done ledger froze a finished decision *and its full reasoning* —
the two options, the finding that collapsed the tension, the consequence,
and a mid-lane fallback breakdown — so no later session pays to rediscover
any of it. This is the playbook acting as institutional memory.

**The negative list.** Under `### Flagship lane`, the "Do not spend
flagship budget on" list is as important as the positive routing: it names
the work the premium lane must never do, so the rule survives sessions that
would each individually rationalize an exception.

**The strategic frame's one rule.** The frame ends in a single bolded
ordering rule ("work that increases the rate, durability, or validity of
data collection outranks work that improves how the instrument displays")
that every queue decision cites. One sentence carries the whole
prioritization.

## What is abstraction and what is method

Abstracted: the item titles, gap contents, domain vocabulary, document
names, dates, counts, and findings — those belong to the private project.

Method (unchanged from the original): every section heading, the status
block, the strategic frame ending in one ordering rule, the gap register
columns, the queue tables with Lane/Size/Status, the window blockquote, the
done ledger with frozen reasoning, the three-lane routing with a negative
list, the routing test, the session protocol, and the standing-constraints
section. Start from [`../../reference/playbook-template.md`](../../reference/playbook-template.md)
and yours will have the same skeleton.
