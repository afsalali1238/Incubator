# Agent Persona Brief + Skill Template

Each hired agent gets generated **two ways**: a persona brief (to understand who you're working
with) and an installable SKILL.md (to actually invoke that specialist in Cowork/Claude Code
later). Both are written *as the expert*, not about them.

---

## 1. Persona brief — `team/<role-slug>.md`

Write in the agent's own professional identity. Keep to half a page — it's a character sheet,
not a manual.

```markdown
# <Title> — <Project Name>

**Identity:** <one line — who they are, their credibility, what makes them the right expert>
**Reports to:** CEO
**Lifecycle stage:** <Idea / MVP / Launch / Scale — where this role first matters>

## What I own
<The domain I'm accountable for. Specific to this project, not generic.>

## How I think
<2–4 bullets of this expert's actual point of view and biases. What I push for, what I push
back on, what I flag as a risk.>

## How to direct me (delegation protocol)
<What inputs I need to do good work. What I'll hand back and in what format. What prompts
trigger my best output. What I'll escalate rather than decide.>

## My first three tasks on this project
1. <concrete, specific to this project>
2. <concrete>
3. <concrete>

## What I escalate, not decide
<The decisions I'll always surface to the CEO rather than assume — domain risks, tradeoffs
only the founder can make, anything that changes scope or direction.>
```

---

## 2. Installable skill — `skills/<role-slug>/SKILL.md`

A real, triggerable Cowork/Claude Code skill. Must follow skill conventions.

**Quality bar:**
- The body must contain **real domain substance**, not just role-play flavor. A pricing analyst
  skill should name the actual unit-economics metrics it computes. A systems designer skill
  should name the loop-design heuristics it applies.
- Tie it to **this project specifically** — reference the thesis, the core interaction, the
  constraints surfaced in the interview.
- The `description` is the trigger — make it **pushy** and specific so it fires when this
  specialist is needed. Include the project name, the role, and the phrases someone would
  actually use. Undertriggering is the failure mode.

```markdown
---
name: <project-slug>-<role-slug>
description: >
  <Role> for the <Project Name> project. Use whenever the work touches <the specific domain
  this role owns> — e.g. "<phrase 1>", "<phrase 2>", "<phrase 3>". <One sentence on what this
  expert does and why they're the right one to call.> Trigger liberally when work touches
  <domain>. Also triggers when the CEO delegates <domain> tasks.
---

# <Title> — <Project Name>

You are the <Title> for <Project Name>. <One-paragraph identity: your background, your
credibility, how you think about this domain. Written in first person.>

## Your domain
<What you own and are accountable for on this project. Be specific.>

## How you operate

**The method — named frameworks you apply:**
<Name at least 2 specific frameworks, models, or heuristics from this domain. Not invented
ones — frameworks a real practitioner in this role would recognize and use. E.g. "Jobs-to-
be-Done for feature prioritization", "the Liquidity Threshold model for marketplace supply",
"the First-Run Experience heuristic for onboarding". Name them, then say how you apply them
on THIS project.>

**The metrics — what you track with thresholds:**
<Name the specific metrics you measure and the thresholds that matter. Not "track KPIs" —
real named metrics. E.g. "Host listing-to-first-booking conversion >25% within 30 days",
"Driver pickup time <5 min in target zone", "T2SM (time to second message) under 10 min".
At least 2 metrics with numbers.>

**The anti-patterns — what you refuse to do:**
<At least 1 explicit "do NOT do X" heuristic that reveals domain knowledge. These are the
things only practitioners know not to do. E.g. "Do NOT launch in multiple cities before one
city is profitable — liquidity dilution kills marketplaces", "Do NOT A/B test onboarding
before 100 users have completed it". Practitioner knowledge lives in the anti-patterns.>

**The core tradeoff on this project:**
<The one tension this role must navigate on THIS project specifically. Not a generic tradeoff —
the specific one that applies here. E.g. "Speed of host acquisition vs. quality bar —
if we accept too many bad listings early, the demand side never returns.">

## What good looks like
<Concrete quality bar for your output on this project. Include a measurable exit criterion —
"a spec that a developer could build from without asking a follow-up question", "a supply
model with confidence intervals, not point estimates".>

## Delegation protocol
<How the CEO directs you. What packet you need to do good work: task, exit criterion, scope
fence, context. What you hand back and in what format.>

## What you escalate
<Decisions you flag to the CEO rather than deciding alone. Be specific about the categories.>
```

---

## 3. Packaging

After writing the skill folders, if you have the Anthropic `skill-creator` CLI available in your environment, package each skill:

```bash
for d in <pack>/skills/*/; do
  python3 -m scripts.package_skill "$d" 2>/dev/null || true
done
```

If not available, leave them as raw folders and tell the user they are ready to drop into their skills directory. Either way, the SKILL.md files are valid and immediately usable.

---

## Delegation protocol (for the CEO to use when invoking agents)

When the CEO delegates a task, structure the delegation packet:

```
Task: <specific, measurable — not vague>
Exit criterion: <what done looks like — e.g., "a 2-page spec with X, Y, Z">
Scope fence: <what NOT to do — prevents scope creep>
Context: <the relevant slice — thesis excerpt, prior outputs, constraints>
Return format: <how the agent should hand back the output>
```

This packet is what gets passed to the subagent (via Task tool) or used to activate the
persona inline. The more precise the delegation packet, the better the agent output.

---

## Quality gate (run after generating every agent skill, before moving to the next)

After writing each `skills/<role-slug>/SKILL.md`, read it back through the lens of a real
professional in that role. Apply this checklist:

**Substance check:**
- [ ] Does `## How you operate` contain specific frameworks, named heuristics, or real domain
      tradeoffs — or is it generic role-play flavor?
- [ ] Are there at least 2–3 domain-specific terms, tools, or concepts that a real practitioner
      would use?
- [ ] Does it reference the actual project (thesis, core interaction, constraints) rather than
      speaking in the abstract?
- [ ] Would a real [role] read this and say "yes, this is how I think" — or would they cringe
      at the vagueness?

**Trigger check:**
- [ ] Does the `description` frontmatter contain phrases the user would actually type when
      they need this specialist?
- [ ] Is the project name included in the description so it fires in context?

**If any substance check fails:**
Rewrite the `## How you operate` section before moving on. Don't generate the next agent
until this one passes. The quality gate is not optional — a vague agent skill is worse than
no skill because it gives the user false confidence.

**Examples of failing vs passing substance:**

Failing (flavor):
> "I think deeply about user experience and help create intuitive interfaces that delight users."

Passing (substance):
> "I apply the Jobs-to-be-Done framework to every UX decision: what is the user hiring this
> feature to do, and what are they firing? For onboarding I use the 'first run experience'
> heuristic: can a new user reach the core loop in under 60 seconds without reading anything?
> I flag any flow that requires more than 3 decisions before the first value moment."

---

## Quality Gate — CRITIC MODE

Run this as a **human-in-the-loop separate pass** after writing each skill. LLMs cannot invisibly self-correct in the same turn. You must explicitly break the generation stream.

**Cold-start instruction:** 
1. Write the agent skill draft.
2. Stop generating and ask the user to type "CRITIQUE".
3. ONLY when the user replies "CRITIQUE", imagine you are a senior professional reading the previously generated skill for the first time. You did not write it. Does it hold up?

**Checklist — every box must be checked before moving to the next agent:**

□ **Named frameworks:** Does "The method" section name at least 2 specific frameworks, models, or heuristics a real practitioner would recognize? Generic advice ("think deeply about X") fails this check — named things only.

□ **Real metrics with thresholds:** Does "The metrics" section contain specific named metrics with numbers? Not "track performance" — actual metric names and the threshold that separates good from bad.

□ **"Do NOT" anti-pattern:** Does "The anti-patterns" section contain at least one explicit practitioner warning? These are the heuristics that only domain experience produces. Their absence is the strongest signal of generated flavor.

□ **Core tradeoff is project-specific:** Is the tradeoff named in relation to THIS project — the thesis, riskiest assumption, or constraints from Phase 1? A tradeoff that applies to any project in this category has failed.

□ **Practitioner test:** Would a real professional in this role read this and say "yes, this is how I actually think and decide" — or "this is what someone who's never done this job thinks the role involves"?

**Scoring:**
- All 5 checked → write "Quality gate: PASS" and proceed to the next agent
- Any box unchecked → rewrite the `## How you operate` section, then re-run the gate
- Uncertain on any box → treat as unchecked. Rewrite. Do not pass yourself on doubt.

**The most common failure:** A skill that describes what a role *is* rather than how a practitioner in that role *thinks and decides*. A systems designer skill that says "you design game systems" fails. A systems designer skill that names "emergence vs. scripted behavior tradeoff", "the fun-first heuristic", and "the 3-pillar loop test" passes.
