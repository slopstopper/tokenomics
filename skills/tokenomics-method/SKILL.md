---
name: tokenomics-method
description: "Use when an operator wants to learn or be reminded of the tokenomics method: spending model capability like a scarce budget through routing by class of work, spec-based handoffs, and a living playbook. Teaches the thesis, the four layers, the four switchpoints and their boundary nudges, the three routing questions with scoring, veto and re-scoring, and the tier-scarcity rule. Pure knowledge; takes no actions."
---

# The tokenomics method

Read `reference/portable-method.md` (relative to the plugin root) and teach
it faithfully: the thesis, the four layers (routing, session protocol,
living playbook, tiered orchestration), the four switchpoints, the three
routing questions, the negative list, and the tier-scarcity rule.

## Routing: classes of work, three questions

A lane is a **class of work**, not a model tier. Four classes, each with a
three-word card (title · what the work asks for · relation to precedent):
1 pathfinder · frontier · uncharted; 2 navigator · judgment · charted;
3 builder · build · specified; 4 keeper · routine · automatic. Labels are
`lane:pathfinder`, `lane:navigator`, `lane:builder`, `lane:keeper`.
"Builder" is the class only; the person using the method is the operator.

Teach the three questions verbatim, asked of the work before a class is
assigned:

- **Q1 (new ground):** Is this new ground: no precedent, pattern, or spec
  in the project to follow, or does it cross domains? Precedent is in the
  project, not in the person: an operator new to a domain does not make
  everything new ground.
- **Q2 (consequence):** If it is slightly wrong, is that expensive: costly
  to fix, built on by other work, or impossible to undo?
- **Q3 (verification):** Would checking it mean redoing it: no test,
  contract, or gate that confirms it cheaply?

**Count the yeses** (AND, not OR): 3 → pathfinder, 2 → navigator,
1 → builder, 0 → keeper. **Veto:** irreversible (Q2's yes is specifically
irreversibility) AND unverifiable (Q3 yes) → pathfinder, whatever the
count. Exploration scores 2 (navigator) and is passed up by escalation
when needed.

**Re-score at every boundary** (Route, Dispatch, Return, Close). Passing
down (a decision made or a spec written means precedent, so Q1 no, often
Q3 no) and passing up (a Return or escalation) both fall out of
re-scoring. Tier inertia is what happens when nobody re-scored.

The class → tier mapping is the operator's, set in their playbook; the
method ships classes and no default mapping. Effort lives in the mapping,
not the class. Concrete model names appear only in the method doc's one
dated example mapping.

## The four switchpoints

The method's rules are positional: they fire at points in the cycle where
work switches class, tier, or direction. Naming those points is what makes
the method orchestratable, so anything that can observe one (an operator, a
controller model, a hook) can enforce the rule that belongs to it. Teach the
four by name and by their shared three-part contract (a trigger condition,
the rule that fires, the crossing artifact), then point to §Switchpoints for
the table: don't restate the table at length.

- **Route** (down): work is about to be assigned a class.
- **Dispatch** (down): a controller hands work down-tier.
- **Return** (up): the receiving tier meets its exit bar, or discovers it
  cannot and escalates early.
- **Close** (up): a cycle boundary, the session or the arc ends.

Two framing points to keep straight: switchpoints are not a fifth layer,
they are the cycle's boundary events made addressable; and no name here is
new doctrine, each names a rule the method doc already states.

## Boundary nudges

At Dispatch, Return, and Close the re-score covers the session itself, not
only the work: should the operator clear it, compact it, or switch its
tier? Operators rarely know when that moment is, so the agent leads: a
boundary nudge is that re-score said out loud, with the work done or
prepared (the tokenomics-handoff skill carries the full set). Teach four
points:

- **Act where you can, prepare where you can't.** The agent can dispatch
  lower-class work to a subagent on the mapped tier itself. Clear, compact,
  and switch-model for the session are the operator's commands; the agent
  gets everything ready so the operator only types the command.
- **Speak up whenever the re-score says change**, at every boundary and on
  long-cycle signs, without waiting to be asked; if the operator says not
  now, raise it again at the next boundary.
- **Staying is a valid answer**, as long as it was decided. A decision
  made is a reason to re-score, not a rule to drop a tier.
- **Write state down, then compact.** Compaction and clearing are safe only
  when state lives outside the context, so a nudge to clear or compact
  comes with an offer to write the handover file first.

Rules:
- Take no actions. No files, no commands, no repo changes.
- Quote the three questions and the negative list verbatim; do not soften
  them.
- If asked "should this task go to the expensive model?", answer by
  scoring the three questions, not with a general opinion.
- If the operator wants this set up on their project, point them to the
  tokenomics-bootstrap skill; for a live routing/handoff decision, the
  tokenomics-handoff skill.

Vocabulary seam: tokenomics' "handoff" names a down-tier work spec: the
written brief one model tier hands to a cheaper one. Sibling plugins use the
word differently: plumb-line's "handoff" is a skill-to-skill baton pass;
recursive-spine's "handover" is the record of debts filed before a session
closes. Same word, three different joints: don't assume a shared meaning
across plugins.
