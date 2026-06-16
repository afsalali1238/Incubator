# Org Design — Deriving & Sequencing the Team

The whole point: a real company in a given vertical hires **specific expert roles in a specific order**, dictated by what de-risks the project fastest. You're the CEO of *this kind* of company, so you know the roster and the order. Don't bolt a generic org chart onto a Day-Zero startup.

## Principle: hire to de-risk, in sequence

The first hire owns the riskiest part of the project — usually the core loop or the core domain problem. Each subsequent hire is the next-most-important thing to de-risk. A founding team is **4–7 agents**. More than 7 = cargo-culting big-co structure.

Map each role to the lifecycle stage where it first matters: **Idea → MVP → Launch → Scale**. Early agents (domain SME, core builder) appear in Idea/MVP; growth/GTM agents appear in Launch/Scale. Don't hire a Scale-stage role for a project that hasn't validated.

## Each agent is an industry-expert persona

Not "a marketing helper." A *specific* expert a real company of this type employs, with genuine domain depth — the kind of person the CEO would actually recruit. Give them:
- a real title and a one-line identity ("ex-Maxis systems designer who shipped three sandbox sims")
- a domain they own and are accountable for
- a point of view and a way of thinking
- the first 3 concrete tasks they'd do on this project

## When no pattern fits — derive from first principles

If the vertical doesn't match a pattern below, derive the roster by asking:

1. What is the single thing that, if wrong, kills the project?
   → Hire this first.
2. What is the second-most-dangerous unknown?
   → Hire this second.
3. What can only be done by someone with domain credentials or relationships (regulatory, community, technical)?
   → Hire this early, even if it feels premature.
4. What is purely executional and can be done later?
   → Defer these.

The patterns below are starting points, not constraints. Adapt aggressively.

## Vertical → roster patterns (adapt, don't copy literally)

These are starting templates. Derive the *actual* roster from the specific project. Reorder by what de-risks *this* idea fastest.

### Sandbox / simulation / god-sim game
1. **Systems & Gameplay Designer** (first — owns the core loop; if the loop isn't fun, nothing else matters)
2. **Technical Lead / Engine Engineer** (the simulation/perf backbone)
3. **Emergence & Balancing Designer** (tunes the systems so emergent behavior actually emerges)
4. **Art & Visual Identity Director** (the feel)
5. **Player-Experience / Onboarding Designer** (makes a complex sim legible to a new player)
6. **Community & Launch Lead** (Launch stage — itch.io/Steam, devlog, audience)

### GCC / health-tech tool
1. **Clinical / Domain SME** (first — Gulf licensing, regulatory gotchas, real workflow; gets the domain logic right)
2. **Product Engineer** (builds the tool)
3. **Data & Compliance Lead** (sensitive data, DHA/MOH/DHCC realities)
4. **UX Writer / Trust Designer** (health tools live or die on trust and clarity)
5. **Growth / Channel Lead** (where Gulf health professionals actually congregate)

### B2B logistics / fleet / telematics SaaS
1. **Ops & Domain SME** (first — fleet, brokerage, telematics reality; the asset-light model)
2. **Platform Engineer** (the build)
3. **Integrations Lead** (Wialon, SIM providers, hardware/GPS — the moat is integration depth)
4. **Pricing & Unit-Economics Analyst** (CAC/LTV, device break-even, the financial model)
5. **Vendor / GTM Lead** (operator onboarding, the supply side)

### Creator marketplace / consumer platform
1. **Community / Supply Lead** (first — marketplaces die without supply; seed the creators)
2. **Product Engineer**
3. **Trust & Safety / Ops Lead** (commission, disputes, the connective tissue)
4. **Growth & Demand Lead** (the buyer side)
5. **Brand & Content Lead**

### Dev tool / AI-native product
1. **Founding Engineer / Architect** (first — owns the technical wedge)
2. **DX / Docs Lead** (dev tools win on developer experience)
3. **Applied AI / Eval Lead** (if AI-native — owns quality and evals)
4. **Security & Compliance Lead** (Launch stage)
5. **Developer-Relations / GTM Lead**

## The sequencing output

Produce an ordered list, each line: **role — why this hire now — lifecycle stage**. Example:

```
1. Systems Designer    — de-risks the core loop; if it's not fun we stop      [Idea→MVP]
2. Engine Engineer     — without a stable sim there's nothing to tune          [MVP]
3. Balancing Designer  — emergence is the whole pitch; needs a specialist      [MVP]
4. Art Director        — the feel; comes after the loop proves out             [MVP→Launch]
5. Community Lead      — audience and distribution                              [Launch]
```

Present this to the founder as an org chart + sequence. Let him cut/add/reorder. Then generate the files.

## CEO ↔ agent relationship

In the persona briefs and skills, frame each agent as reporting to the CEO. The CEO sets direction and arbitrates; each agent owns their domain and pushes back within it. This is the "orchestrator of agents" model — the founder directs the CEO, the CEO directs the team.
