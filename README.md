# tokenomics

Tokenomics is the discipline of spending model capability like a scarce
budget: the expensive model does only the work that is expensive to get
wrong, every handoff crosses tiers on a written spec, and a living
playbook — not re-exploration — carries strategy between sessions.

Concretely, tokenomics is a Claude Code plugin (three skills) paired with a
portable method doc and two templates the skills operate on. The skills
apply the discipline inside a session — routing a task, writing a handoff
spec, closing out with a ledger update; the method doc and templates make
the same discipline usable on any project, with or without the plugin.

## Who it's for

Builders with tiered access to models — usage-limited subscriptions,
time-boxed premium windows, per-token billing, or any mix of these —
running projects that span more than one session. It assumes only that
some model calls are more expensive than others for your setup, and that
your project outlives a single session.

## The method

The method has four layers. **Routing** sends each task to one of three
lanes — flagship, mid, or small — by the nature of the work, decided with
one question asked before a task is assigned a lane: **"If this is done
slightly wrong, is it expensive?"** **Session protocol** governs how a
single session runs: open with the playbook pointer rather than
re-exploring the repo, keep work spec-first across lane boundaries, and
close with a ledger update and nothing more. **The living playbook** is
the cross-session re-entry point — a status block, strategic frame, work
queue, gap register, done ledger, and standing constraints, kept as an
append-mostly document rather than rewritten each session. **Tiered
orchestration** describes the cycle across sessions and tiers: the
expensive model plans and hands off, cheaper tiers execute and can spawn
further subagent teams, and results return only at verification gates.
Full detail, including the negative list and the lane-scarcity rule, is in
[`reference/portable-method.md`](reference/portable-method.md).

## The skills

**tokenomics-method** — loads and teaches the method: the thesis, the four
layers, the routing test, and the lane-scarcity rule. Pure knowledge; takes
no actions.

**tokenomics-bootstrap** — interviews the builder about their model tiers,
limit shape, project gates, and backlog, then generates the project's
model-effectiveness playbook from the template. Ships no default lanes and
invents no queue items.

**tokenomics-handoff** — used at the two moments tokens are saved: routing
a task to a lane and writing the down-tier handoff spec, and closing a
session with the ledger update. Applies the routing test, flags
negative-list violations, and produces handoff specs a cheaper tier can
execute without re-derivation.

## Repository layout

| Path              | What's there                                          |
| ----------------- | ------------------------------------------------------ |
| `skills/`         | The three Claude Code skills — method, bootstrap, handoff |
| `reference/`      | The portable method doc, playbook template, handoff-spec template |
| `examples/`       | Worked example: a structure-faithful abstraction of a real project's playbook |
| `docs/design/`    | Design notes for this repository                      |

## Install

**As a Claude Code plugin (recommended).** The repository is its own
plugin marketplace. From inside Claude Code:

```
/plugin marketplace add effythealien/tokenomics
/plugin install tokenomics@tokenomics
```

The first command registers the repo as a marketplace; the second installs
the three skills. Updates come through `/plugin`.

**Manually.** Clone the repository and point Claude Code at the plugin
directory, or add it under `plugins` in your `.claude/settings.json`. The
method doc and templates under `reference/` are plain markdown — they're
usable as a manual discipline on any project, with or without Claude Code
at all.

## Status

v0.1 ships the three skills, the portable method doc, two templates
(playbook and handoff-spec), and one worked example — a structure-faithful
abstraction of the real, in-use playbook this method was extracted from
(the source project is
private and pre-release, so its specifics are generalized). This is a
practice report from one real project, not a benchmark: no controlled
comparison against alternative approaches exists yet. Planned, not
shipped: a session-start hook that injects a pointer to the project's
playbook automatically.

## License

MIT. See [`LICENSE`](LICENSE).
