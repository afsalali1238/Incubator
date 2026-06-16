# Company Starter Pack — Contents

The final deliverable. One folder, everything the founder needs to actually start running the project with a team. Build directly in the workspace: `./<project-slug>-company/`.

```
<project-slug>-company/
├── 00_charter.md
├── 01_findings-report.html   (the VD report from Phase 3)
├── 02_hiring-plan.md
├── 03_90-day-calendar.md
├── hq.html                   (the Slack-like dashboard from Phase 7)
├── team/      (persona briefs)
└── skills/    (installable skill folders)
    ├── install-team.sh
    └── install-team.ps1
```

---

## 00_charter.md — the one-pager

The document the founder reads first. Keep it to a single screen. Contents:

- **Project:** name + the one-paragraph thesis (the exact one he agreed to in Phase 1).
- **CEO verdict:** Build / Refine / Pivot — one line, with conviction.
- **The riskiest assumption:** named, plus the cheapest test to disprove it.
- **The wedge:** the single core interaction to build first (from the interview + winners' sequencing).
- **The scope fence:** what this deliberately is NOT doing yet.
- **The org at a glance:** the hire sequence as a numbered list, one line each.
- **Next action:** the single most important thing to do this week.

Write it in the founder's voice. Confident, short sentences, no hedging.

---

## 02_hiring-plan.md — the org

- **Org chart** (CEO at top, agents below, grouped by lifecycle stage). A simple indented/ASCII tree is fine.
- **The hire sequence** — the ordered list from org-design, each line: `role — why this hire now — lifecycle stage`.
- **For each role:** one paragraph on what they de-risk and what their first win looks like.
- A pointer to the matching `team/<role>.md` brief and `skills/<role>/` skill.

---

## 03_90-day-calendar.md — the build plan

Map the **Idea → MVP → Launch** arc onto ~12 weeks. This is where the team becomes real — each block names the agent who owns it, so the founder can see who he's "working with" when.

Structure (adapt week counts to the project):

```markdown
## Weeks 1–2 — Validate (Idea stage)
Owner: <Domain SME agent>
- <the cheap test of the riskiest assumption>
- <customer/player discovery actions>
Exit: <problem-solution fit signal>

## Weeks 3–6 — Build the core loop (MVP stage)
Owner: <Core builder agent> (+ <SME> reviewing)
- Build ONLY the single core interaction
- <architecture/scope-doc setup — CLAUDE.md, scope fence>
Exit: a real human can touch the core thing and react

## Weeks 7–10 — Iterate toward evidence (MVP → Launch)
Owner: <relevant agents>
- <measurement framework before users arrive>
- <iteration loops>
Exit: genuine signal (retention / payment / referral / "very disappointed" test)

## Weeks 11–12 — Launch readiness (Launch stage)
Owner: <Launch/GTM agent>
- <security/quality pass>
- <distribution / audience / first real users>
Exit: <repeatable way to get the next users>
```

Principles baked in:
- **Don't build before week 3.** Validation first — that's the whole CEO discipline.
- **Build only the core interaction in the MVP block.** Scope fence holds.
- **Measurement framework before users**, so early traction isn't mistaken for product-market fit.
- Each block has an **exit criterion**, not just tasks.
- Assign every block to an agent so the org chart maps to real work.

---

## Presentation

Before presenting, **ensure the project is added to `INCUBATOR.md` at the root of the workspace**. Append it as a new line: `- [Project Name](./<project-slug>-company/)`. This acts as the session re-entry anchor.

Generate the `install-team.sh` and `install-team.ps1` scripts inside the `skills/` directory. These scripts should simply copy all the `.skill` folders into the user's global Claude Code skills directory.

`present_files` order: `hq.html` first (as the virtual office), then `00_charter.md`, then `01_findings-report.html`. Close with a short CEO sign-off, instructing the founder to open `hq.html` in a browser, and state the single next action. No long postamble.
