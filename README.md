# Incubator — idea in, company out

![Incubator Banner](./assets/banner.png)

A Claude skill collection for **founding a new project from zero**. You bring an idea. You walk out with a validated thesis, a market-research report, and a team of specialist AI agents — structured exactly the way a real company in that vertical would build itself.

Built for [Claude Cowork](https://claude.ai), Claude Code, and claude.ai.

---

## What it does

Start any new project and invoke the **`project-ceo`** skill. Claude stops being a generic assistant and becomes the **founding CEO** of a company built around your idea — with real, specific industry expertise for that vertical (a god-sim game, a health-tech tool, a logistics SaaS, a creator marketplace, whatever you're building).

It then runs a seven-phase founding sequence:

| Phase | What happens | Reuses |
|-------|--------------|--------|
| **1. The Interview** | The CEO interrogates your idea one question at a time until it's a *testable hypothesis*, not a vague observation. Ends with a one-paragraph thesis you both agree on. | `grill-me`, `karpathy-guidelines` |
| **2. Autonomous Research** | Fully autonomous, no check-ins. Maps competitors by tier, finds 2–4 successful analogues and reverse-engineers **the order they built things in**, digs the graveyard for causes of death, and runs a devil's-advocate pass that's allowed to tell you to pivot. | `autoresearch` (spirit) |
| **3. The Report** | Packages findings as a numbered-panel, scroll-snap HTML **Visual Document** — Thesis → Market → Winners → Playbook → Graveyard → Heresy → Trends → Org → Call. | `vd` |
| **4. Hire the Team** | Derives a 4–7 agent roster *from your vertical*, sequenced by what de-risks the project fastest. Generates each agent as both a **persona brief** and an **installable `.skill` file** you can invoke later. | — |
| **5. Board Meeting** | On return sessions: loads state, presents team health scores, and updates living documents as work progresses. | `INCUBATOR.md` |
| **6. The Data Room** | (Optional) If raising VC, automatically builds a 10-slide markdown pitch deck focused on the Wedge and Graveyard findings. | — |
| **7. HQ Dashboard** | Generates `hq.html`, a Slack-like UI that loads all project documents into channels so you can manage your company from a virtual office. | — |

**The final output** is a `<your-project>-company/` folder — a complete *company starter pack*:

```
<project>-company/
├── 00_charter.md            # thesis, CEO verdict, riskiest assumption, the org at a glance
├── 01_findings-report.html  # the VD research report
├── 02_hiring-plan.md        # org chart + sequenced hire order with reasons
├── 03_90-day-calendar.md    # week-by-week build plan, each block owned by an agent
├── team/                    # persona briefs, one per hired agent
└── skills/                  # installable specialist-agent skills, one per role
```

---

## Install

### Claude Code (coming soon)

> ⚠️ The `/plugin marketplace` command is not yet live in Claude Code.
> Use the manual install below while this is in development.

```
/plugin marketplace add afsalali1238/Incubator
/plugin install incubator
```

Then start any project and say **"be the CEO for this — I'm building \<your idea\>"** and the sequence kicks off.

### Claude Cowork / claude.ai (manual)

1. Download [`project-ceo.skill`](./dist/project-ceo.skill) from this repo.
2. Add it via your skills/capabilities settings (upload the `.skill` file).
3. Start a project and say **"I'm starting a new project, act as CEO"**.

Or drop the `skills/project-ceo/` folder into your skills directory directly.

---

## How to trigger it

Any of these will wake the CEO:

- "I'm starting a new project — be the CEO for this."
- "I want to build \<X\>, help me kick it off."
- "Run point on this build as founder."
- Just describe a fresh idea you intend to *build*, not just discuss.

It will **not** trigger for editing an existing project's code, or for projects that already have a team — that's normal work, not a founding.

---

## What's inside

```
Incubator/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── skills/
│   └── project-ceo/
│       ├── SKILL.md
│       └── references/
│           ├── interview.md            # CEO interview decision tree + question bank
│           ├── research.md             # autonomous research method + competitor tiering
│           ├── org-design.md           # deriving & sequencing the agent roster per vertical
│           ├── agent-skill-template.md # how each hired agent is generated (brief + SKILL.md)
│           └── starter-pack.md         # charter, hiring plan, 90-day calendar contents
└── dist/
    └── project-ceo.skill               # packaged, installable skill file
```

---

## Companion skills (recommended)

`project-ceo` reuses these skills if they're installed. It works without them, but they make it sharper:

- **`grill-me`** — relentless one-question-at-a-time interviewing.
- **`karpathy-guidelines`** — surface assumptions, avoid overcomplication.
- **`vd`** — the Visual Document report format used in Phase 3.
- **`autoresearch`** — the autonomous-loop discipline Phase 2 is modeled on.

---

## See it in action

→ [Terrarium Planet — company starter pack](./examples/terrarium-planet-company/)  
A god-sim game concept run through the full founding sequence.  
Includes: [charter](./examples/terrarium-planet-company/00_charter.md), findings report, [HQ Dashboard](./examples/terrarium-planet-company/hq.html), and [Systems Designer skill](./examples/terrarium-planet-company/skills/systems-designer/SKILL.md).

---

## Design notes

The structure follows the **AI-native startup lifecycle** — *Idea → MVP → Launch → Scale* — where the founder is the *orchestrator of agents*, not the individual contributor. The whole point of the skill is to keep your **sense-making ahead of your building**, because agentic coding makes building feel free, and that's the trap that kills AI-native startups: shipping a prototype and mistaking it for validation.

The roster pattern (each agent is a domain-expert persona, hired in a de-risking order) is adapted from the role-as-advisor approach in [slavingia/skills](https://github.com/slavingia/skills).

---

## Developing

After editing any file in `skills/project-ceo/`, run:
```bash
bash scripts/package.sh
```
to update the installable dist file.

---

## License

MIT © [Afsal Ali](https://github.com/afsalali1238)
