# tokenomics

*Spend your working context well and you spend fewer tokens: tighter
context drifts less, and drift is where the waste hides.*

Tokenomics is a discipline of context economics: a model's working
context is the scarce resource, spent well only when work runs in cycles
whose boundaries compress it. At every cycle boundary the working context
dies (the exploration, the dead ends, the reasoning) and only the distilled
artifact crosses: a spec, a queue line, a ledger update. That discipline
pays off in tokens: a tight, deliberately compressed context costs fewer of
them per cycle and drifts less, and drift is where a lot of token waste
quietly hides. Tier routing is the first application of that idea, not the
idea itself: the expensive model does only the work that is expensive to get
wrong, every handoff crosses tiers on a written spec, and a living playbook,
not re-exploration, carries strategy between sessions.

Concretely, tokenomics is a Claude Code plugin (three skills) paired with a
portable method doc and two templates the skills operate on. The skills
apply the discipline inside a session: routing a task, writing a handoff
spec, closing out with a ledger update. The method doc and templates make
the same discipline usable on any project, with or without the plugin.

For why this discipline exists, not just how it works, see
[`docs/why.md`](docs/why.md): matching the model to the work rather than
reaching for the most expensive one by default, why that's worth the trouble
(compute isn't free, economically or environmentally), and the not-knowing it
was born from.

## Who it's for

Builders with tiered access to models (usage-limited subscriptions,
time-boxed premium windows, per-token billing, or any mix) who run
projects that span more than one session. It assumes only that
some model calls are more expensive than others for your setup, and that
your project outlives a single session.

## The method

The method has four layers. **Routing** sends each task to one of three
lanes (flagship, mid, or small) by the nature of the work, decided with
one question asked before a task is assigned a lane: **"If this is done
slightly wrong, is it expensive?"** A second axis decides how far down is
safe: route down only as far as your gates reach. Work with no cheap way to
verify it (a design call, a taxonomy decision, anything where checking it
means redoing it) is flagship work even when it looks easy, because the
wrong version reads exactly like the right one. **Session protocol** governs
how a single session runs: open with the playbook pointer rather than
re-exploring the repo, keep work spec-first across lane boundaries, and
close with a ledger update and nothing more. **The living playbook** is
the cross-session re-entry point: a status block, strategic frame, work
queue, gap register, done ledger, and standing constraints, kept as an
append-mostly document rather than rewritten each session. **Tiered
orchestration** describes the cycle across sessions and tiers: the
expensive model plans and hands off, cheaper tiers execute and can spawn
further subagent teams, and results return only at verification gates.

At runtime the four layers compose into one loop (*enter on a written
brief, run at the cheapest capable tier, exit on a verified artifact plus a
ledger line*), nested at three timescales: macro (the project arc), meso
(one session), micro (one subagent task). Every cycle boundary is a
context-compression point: working context dies there, and only the
distilled artifact crosses. Full detail, including the cycle table, the
negative list, and the lane-scarcity rule, is in
[`reference/portable-method.md`](reference/portable-method.md).

The method is scoped on purpose: where there is no tier differential, no
cycle boundary to compress at, or nothing worth reusing, the discipline is
ceremony and the honest move is to skip it (see
[When this doesn't pay](reference/portable-method.md#when-this-doesnt-pay)).

## The skills

**tokenomics-method** loads and teaches the method: the thesis, the four
layers, the routing test, and the lane-scarcity rule. Pure knowledge; takes
no actions.

**tokenomics-bootstrap** interviews the builder about their model tiers,
limit shape, project gates, and backlog, then generates the project's
model-effectiveness playbook from the template. Ships no default lanes and
invents no queue items.

**tokenomics-handoff** is used at the two moments tokens are saved: routing
a task to a lane and writing the down-tier handoff spec, and closing a
session with the ledger update. Applies the routing test, flags
negative-list violations, and produces handoff specs a cheaper tier can
execute without re-derivation.

## Repository layout

| Path              | What's there                                          |
| ----------------- | ------------------------------------------------------ |
| `skills/`         | The three Claude Code skills: method, bootstrap, handoff |
| `reference/`      | The portable method doc, playbook template, handoff-spec template |
| `examples/`       | Two full worked playbooks (a real code project; a non-code analytical desk) plus a domain gallery mapping the method into more fields |
| `docs/design/`    | Design notes for this repository                      |

## Install

**As a Claude Code plugin (recommended).** The repository is its own
plugin marketplace. From inside Claude Code:

```
/plugin marketplace add slopstopper/tokenomics
/plugin install tokenomics@tokenomics
```

The first command registers the repo as a marketplace; the second installs
the three skills. Updates come through `/plugin`.

**Manually.** Clone the repository and point Claude Code at the plugin
directory, or add it under `plugins` in your `.claude/settings.json`. The
method doc and templates under `reference/` are plain markdown, usable as a
manual discipline on any project, with or without Claude Code at all. In
particular, the playbook and handoff-spec templates work as project
knowledge in a claude.ai Project: paste them in, keep the playbook as a
living document there, and run the routing-and-handoff discipline by hand,
no Code required.

## Status

v0.3 ships the three skills; the portable method doc, including the cycle
section (macro/meso/micro) added in v0.2; two scale-invariant templates
(playbook and handoff-spec); two worked example playbooks (a structure-faithful
abstraction of the real, in-use playbook this method was extracted from, with
specifics generalized because the source project is private and pre-release,
and a second, non-code one, an analytical desk) plus a domain gallery covering
further fields; this repo's own dogfooded playbook; and the spend-ledger
convention, a minimal per-session record of lane used and rough scale of work
that makes the method's savings claims falsifiable against its own history. This is a practice report from one real project,
not a benchmark: no controlled comparison against alternative approaches
exists yet. Planned, not shipped: a session-start hook that injects a
pointer to the project's playbook automatically, queued in this repo's own
[playbook](docs/model-effectiveness-playbook.md).

## License

Credit-first, per the slopstopper family formula: all prose (skills,
docs, the method, examples) is **CC BY 4.0**: take it anywhere, adapt
it, use it commercially; the one-line credit travels with every copy.
CI plumbing is Apache-2.0. The scope map and the requested attribution
format live in [`LICENSE`](LICENSE). Using the plugin as a plugin
requires nothing: these terms bind republishing, not use. Previously
published versions remain MIT.
