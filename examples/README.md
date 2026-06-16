# Examples

Real output from running `project-ceo` on real companies. Each folder is what the skill produces after a full founding sequence — interview, research, report, team hire.

**Lead example:** [`airbnb/`](./airbnb/) — the most complete, with all 7 output files including the rendered HQ Dashboard.

---

## Airbnb (2008)
**Vertical:** Peer-to-peer lodging marketplace  
**Wedge:** IDSA Design Conference, SF — hotels sold out, 3 hosts, sell out all 3 nights  
**CEO verdict:** BUILD

| File | What it shows |
|------|--------------|
| [`00_charter.md`](./airbnb/00_charter.md) | Thesis, verdict, riskiest assumption, scope fence, org at a glance |
| [`01_findings-report.html`](./airbnb/01_findings-report.html) | 9-panel research report — open in browser |
| [`02_hiring-plan.md`](./airbnb/02_hiring-plan.md) | Org chart + sequenced hire order with de-risk rationale |
| [`03_90-day-calendar.md`](./airbnb/03_90-day-calendar.md) | Week-by-week plan calibrated to full-time budget |
| [`roster.md`](./airbnb/roster.md) | Live team registry with 🟢/🟡/🔴 health scores |
| [`hq.html`](./airbnb/hq.html) | Rendered HQ Dashboard — open in browser |
| [`team/community-supply-lead.md`](./airbnb/team/community-supply-lead.md) | Agent persona brief — real host acquisition framework |
| [`skills/community-supply-lead/SKILL.md`](./airbnb/skills/community-supply-lead/SKILL.md) | Installable agent skill — supply-side playbook, not role-play |

---

## Other examples

Each has: charter, findings report, hiring plan, 90-day calendar, and one installable agent skill.

| Company | Vertical | Wedge | Agent skill shown |
|---------|---------|-------|------------------|
| [`slack-company/`](./slack-company/) | B2B team messaging | Tiny Speck's internal IRC tool during Glitch shutdown | UX Designer |
| [`uber-company/`](./uber-company/) | Ride-hailing | UberCab black car iPhone app, SF, 2010 | City GM |
| [`gymshark-company/`](./gymshark-company/) | DTC fitness apparel | Ben Francis dropshipping from garage, 2012 | Community Manager |
| [`oculus-company/`](./oculus-company/) | Consumer VR headset | Kickstarter prototype, 2012 | Optical Engineer |
| [`23andme-company/`](./23andme-company/) | Consumer DNA testing | Spit kit for personal ancestry + health risk, 2006 | Regulatory SME |

---

## What the output structure looks like

```
<your-project>-company/
├── 00_charter.md              ← thesis, verdict, riskiest assumption, org at a glance
├── 01_findings-report.html    ← 9-panel research report (open in browser)
├── 02_hiring-plan.md          ← org chart + sequenced hire order with reasons
├── 03_90-day-calendar.md      ← week-by-week plan calibrated to your time budget
├── hq.html                    ← dark-mode command centre (Charter/Roster/Calendar/Agents)
├── roster.md                  ← live team registry with health scores
├── team/                      ← persona briefs, one per hired agent
└── skills/                    ← installable agent skills, one per role
```

## What to notice

- The **charter** is one screen — thesis, verdict, riskiest assumption, scope fence, org, next action.
- The **hiring plan** sequences agents by de-risking order, not by role importance. Supply Lead before Product Engineer. Always.
- The **agent skills** contain real domain substance — named frameworks, specific heuristics, domain tradeoffs. Not role-play flavor.
- The **roster** shows health scores before validation is complete — most are 🟡 because the riskiest assumption is still untested.
- The **HQ Dashboard** is a zero-dependency HTML file — open it in any browser, no server needed.
