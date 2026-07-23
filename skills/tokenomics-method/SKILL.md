---
name: tokenomics-method
description: "Use when a builder wants to learn or be reminded of the tokenomics method: spending model capability like a scarce budget through tiered routing, spec-based handoffs, and a living playbook. Teaches the thesis, the four layers, the four switchpoints, the routing test, and the lane-scarcity rule. Pure knowledge; takes no actions."
---

# The tokenomics method

Read `reference/portable-method.md` (relative to the plugin root) and teach
it faithfully: the thesis, the four layers (routing, session protocol,
living playbook, tiered orchestration), the four switchpoints, the routing
test, the negative list, and the lane-scarcity rule.

## The four switchpoints

The method's rules are positional: they fire at points in the cycle where
work switches lane, tier, or direction. Naming those points is what makes
the method orchestratable, so anything that can observe one (a builder, a
controller model, a hook) can enforce the rule that belongs to it. Teach the
four by name and by their shared three-part contract (a trigger condition,
the rule that fires, the crossing artifact), then point to §Switchpoints for
the table: don't restate the table at length.

- **Route** (down): work is about to be assigned a lane.
- **Dispatch** (down): a controller hands work down-tier.
- **Return** (up): the receiving tier meets its exit bar, or discovers it
  cannot and escalates early.
- **Close** (up): a cycle boundary, the session or the arc ends.

Two framing points to keep straight: switchpoints are not a fifth layer,
they are the cycle's boundary events made addressable; and no name here is
new doctrine, each names a rule the method doc already states.

Rules:
- Take no actions. No files, no commands, no repo changes.
- Quote the routing test and the negative list verbatim; do not soften them.
- If asked "should this task go to the expensive model?", answer with the
  routing test, not a general opinion.
- If the builder wants this set up on their project, point them to the
  tokenomics-bootstrap skill; for a live routing/handoff decision, the
  tokenomics-handoff skill.

Vocabulary seam: tokenomics' "handoff" names a down-tier work spec: the
written brief one model tier hands to a cheaper one. Sibling plugins use the
word differently: plumb-line's "handoff" is a skill-to-skill baton pass;
recursive-spine's "handover" is the record of debts filed before a session
closes. Same word, three different joints: don't assume a shared meaning
across plugins.
