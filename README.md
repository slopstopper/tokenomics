<h1 align="center">
  <img src="docs/logo.svg" alt="" height="42" align="middle">
  &nbsp;tokenomics
</h1>

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

**tokenomics-handoff** is used at the two moments the method targets savings:
routing a task to a lane and writing the down-tier handoff spec, and closing
a session with the ledger update. Applies the routing test, flags
negative-list violations, and produces handoff specs a cheaper tier can
execute without re-derivation.

## Repository layout

| Path              | What's there                                          |
| ----------------- | ------------------------------------------------------ |
| `skills/`         | The three Claude Code skills: method, bootstrap, handoff |
| `reference/`      | The portable method doc, playbook template, handoff-spec template |
| `examples/`       | Two full worked playbooks (a real code project; a non-code analytical desk) plus a domain gallery mapping the method into more fields |
| `evals/`          | Skill-text assertions CI checks: the rules each skill must keep |
| `adapters/`       | Optional, opt-in harness implementations of the method (Claude Code) |
| `docs/design/`    | Design notes for this repository                      |
| `CHANGELOG.md`, `RELEASING.md` | Version history and how a release is cut |

## Install

**As a Claude Code plugin (recommended).** tokenomics is listed in the
slopstopper marketplace alongside plumb-line and recursive-spine. From inside
Claude Code:

```
/plugin marketplace add slopstopper/marketplace
/plugin install tokenomics@slopstopper
```

The first command registers the family marketplace; the second installs the
three skills. Updates come through `/plugin`. The repository is also its own
single-plugin marketplace (`/plugin marketplace add slopstopper/tokenomics`,
then `/plugin install tokenomics@tokenomics`) if you want tokenomics alone.

**Manually.** Clone the repository and point Claude Code at the plugin
directory, or add it under `plugins` in your `.claude/settings.json`. The
method doc and templates under `reference/` are plain markdown, usable as a
manual discipline on any project, with or without Claude Code at all. In
particular, the playbook and handoff-spec templates work as project
knowledge in a claude.ai Project: paste them in, keep the playbook as a
living document there, and run the routing-and-handoff discipline by hand,
no Code required.

## Status

**v0.4.0** is the first tagged release ([CHANGELOG](CHANGELOG.md); earlier
version labels were never tagged). It ships the three skills; the portable
method doc, now including the cycle (macro/meso/micro), the spend ledger, the
escalation rule and verification axis, the four switchpoints with a
controller contract for orchestration, [When this doesn't
pay](reference/portable-method.md#when-this-doesnt-pay), and the seam for
composing with an issue-tracker-first convention such as recursive-spine; two
scale-invariant templates (playbook and handoff-spec); an opt-in Claude Code
adapter (session-start playbook-pointer hook, micro-brief template, and an
orchestration recipe that reads the per-tier spend roll-up from transcripts);
two worked example playbooks (a structure-faithful abstraction of the real,
in-use playbook this method was extracted from, with specifics generalized
because the source project is private and pre-release, and a second, non-code
one, an analytical desk) plus a domain gallery covering further fields; and
this repo's own dogfooded playbook.

This is a practice report from one real project, not a benchmark: no
controlled comparison against alternative approaches exists yet, and the
spend ledger, which makes the savings claim falsifiable in design, has not
yet produced a counterfactual-cost figure (no dated price table has been
supplied to any recorded session). Next: v0.5.0, "routing axes": whether a
lane names a class of work or a model tier
([#25](https://github.com/slopstopper/tokenomics/issues/25)), and how prompt
caching and auto-compaction change the economics of a cycle boundary.

**Outside corroboration of the failure modes, not of the savings.** An
independent project, the [superpowers](https://github.com/obra/superpowers)
plugin (MIT, © Jesse Vincent), reports two of the failures this method
names, found in its own runs: subagents that silently inherit the session's
most expensive model when none is named ("one run put all 26 of its
reviewers on the top tier", v6.4.2 release notes), and work lost to
compaction ("controllers that lost their place have re-dispatched entire
completed task sequences — the single most expensive failure observed",
`skills/subagent-driven-development/SKILL.md`), the same failure as this
repo's G10. A second observer reaching the same failures is evidence the
problems are real. It is not evidence that tokenomics' remedies save
anything; that still rests on one source project.

## License

Credit-first, per the slopstopper family formula: all prose (skills,
docs, the method, examples) is **CC BY 4.0**: take it anywhere, adapt
it, use it commercially; the one-line credit travels with every copy.
CI plumbing is Apache-2.0. The scope map and the requested attribution
format live in [`LICENSE`](LICENSE). Using the plugin as a plugin
requires nothing: these terms bind republishing, not use. Previously
published versions remain MIT.
