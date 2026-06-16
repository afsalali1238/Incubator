# Org Design — Deriving & Sequencing the Agent Roster

The whole point: a real company in a given vertical hires **specific expert roles in a specific
order**, dictated by what de-risks the project fastest. You're the CEO of this kind of company,
so you know the roster and the order. Don't bolt a generic org chart onto a Day-Zero startup.

---

> ⚠️ **Read this first:** The patterns below are NOT roster templates. They are naming
> conventions. The roster must come from the research report — Panel 03 (Winners), Panel 05
> (Graveyard), Panel 09 (The Call). If you are reading this file before opening the findings
> report, stop. Open the report first. Return here only to confirm a role title.

---

## Core principles

**Hire to de-risk, in sequence.**
The first hire owns the riskiest part of the project — usually the core loop or the core domain
problem. Each subsequent hire is the next-most-important thing to de-risk.

**Founding team size: 4–7 agents.**
More than 7 = cargo-culting big-co structure onto a project that hasn't validated.

**Each agent is an industry-expert persona.**
Not "a marketing helper." A *specific* expert a real company of this type employs, with genuine
domain depth — the kind of person a CEO would actually recruit. Give them:
- A real title and a one-line identity (e.g., "ex-Maxis systems designer who shipped three sandbox sims")
- A domain they own and are accountable for
- A point of view and a way of thinking — what they push for, what they push back on
- Their first 3 concrete tasks on this project

**Map each role to lifecycle stage.**
Idea → MVP → Launch → Scale. Hire Idea/MVP roles first. Don't hire Scale roles before Launch.

---

## Role title conventions by vertical

**These are NOT roster templates.** The actual roster must be derived from the research report
(Panel 03 Winners, Panel 05 Graveyard, Panel 09 The Call). Use this section only to find
the conventional title for a role once the research has told you what role is needed.

If you are consulting this section before reading the findings report, stop. Open the report first.

Adapt freely — these are naming conventions, not org charts.

### Sandbox / simulation / god-sim game
1. **Systems & Gameplay Designer** — first; owns the core loop; if the loop isn't fun, nothing else matters [Idea→MVP]
2. **Technical Lead / Engine Engineer** — simulation and performance backbone [MVP]
3. **Emergence & Balancing Designer** — tunes systems so emergent behavior actually emerges [MVP]
4. **Art & Visual Identity Director** — the feel; comes after the loop proves out [MVP→Launch]
5. **Player-Experience / Onboarding Designer** — makes a complex sim legible to a new player [Launch]
6. **Community & Distribution Lead** — itch.io/Steam, devlog, audience [Launch]

### GCC / health-tech tool
1. **Clinical / Domain SME** — first; Gulf licensing, regulatory gotchas, real workflow [Idea→MVP]
2. **Product Engineer** — builds the tool [MVP]
3. **Data & Compliance Lead** — sensitive data, DHA/MOH/DHCC realities [MVP]
4. **UX Writer / Trust Designer** — health tools live or die on trust and clarity [MVP→Launch]
5. **Growth / Channel Lead** — where Gulf health professionals actually congregate [Launch]

### B2B logistics / fleet / telematics SaaS
1. **Ops & Domain SME** — first; fleet, brokerage, telematics reality; the asset-light model [Idea→MVP]
2. **Platform Engineer** — the build [MVP]
3. **Integrations Lead** — Wialon, SIM providers, hardware/GPS; the moat is integration depth [MVP]
4. **Pricing & Unit-Economics Analyst** — CAC/LTV, device break-even, the financial model [MVP→Launch]
5. **Vendor / GTM Lead** — operator onboarding, the supply side [Launch]

### Creator marketplace / consumer platform
1. **Community / Supply Lead** — first; marketplaces die without supply; seed the creators [Idea→MVP]
2. **Product Engineer** [MVP]
3. **Trust & Safety / Ops Lead** — commission, disputes, the connective tissue [MVP]
4. **Growth & Demand Lead** — the buyer side [Launch]
5. **Brand & Content Lead** [Launch]

### Dev tool / AI-native product
1. **Founding Engineer / Architect** — first; owns the technical wedge [Idea→MVP]
2. **DX / Docs Lead** — dev tools win on developer experience [MVP]
3. **Applied AI / Eval Lead** — if AI-native; owns quality and evals [MVP]
4. **Security & Compliance Lead** [Launch]
5. **Developer-Relations / GTM Lead** [Launch]

---

## The sequencing output

Produce an ordered list, each line: **role — why this hire now — lifecycle stage**. Example:

```
1. Systems Designer    — de-risks the core loop; if it's not fun we stop      [Idea→MVP]
2. Engine Engineer     — without a stable sim there's nothing to tune          [MVP]
3. Balancing Designer  — emergence is the whole pitch; needs a specialist      [MVP]
4. Art Director        — the feel; comes after the loop proves out             [MVP→Launch]
5. Community Lead      — audience and distribution                              [Launch]
```

Present this to the user as an org chart + sequence. Let them cut, add, or reorder. Then
generate the files.

---

## CEO ↔ Agent relationship

In the persona briefs and skills, frame each agent as reporting to the CEO. The CEO sets
direction and arbitrates; each agent owns their domain and pushes back within it. Agents
escalate decisions they shouldn't make alone — the CEO synthesizes and surfaces to the user.

This is the orchestrator model: the user directs the CEO; the CEO directs the team.

---

## Dynamic roster management (Phase 5)

The founding roster isn't permanent. As the project evolves:
- **Promote a SPAWN to a standing hire** when the task type recurs
- **Fire when phase-mismatch** — a role that was critical at Idea is often redundant at Launch
- **Hire new specialists** when entering a domain the founding team doesn't cover
  (e.g., the project enters a regulated market → hire Compliance Lead)
- **Merge roles** when the team is over-staffed for the current phase and tasks overlap

The CEO reads `roster.md` at the start of each session and makes these calls actively.
