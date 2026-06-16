# Company Starter Pack — Contents

The final deliverable of Phase 4. One folder, everything needed to actually run the project
with a team.

**Build path:**
```
1. Check if /mnt/user-data/outputs/ exists → use it   (Claude Cowork)
2. Else check if ./outputs/ exists         → use it   (Claude Code)
3. Else create ./outputs/                  → use it
PROJECT_DIR = <output-dir>/<project-slug>-company/
```

Build in PROJECT_DIR. Present `00_charter.md` first, then the report, then the folder.

---

## Folder structure

**Tech: yes (developer) branch:**
```
<project-slug>-company/
├── 00_charter.md               # The one-pager. Read this first.
├── 01_findings-report.html     # Research report from Phase 3
├── 02_hiring-plan.md           # Org chart + sequenced hire order
├── roster.md                   # LIVE team registry — updated every session
├── team/                       # Persona briefs, one per agent
│   ├── <role-slug>.md
│   └── ...
└── skills/                     # Installable skill files, one per agent
    ├── <role-slug>/SKILL.md
    └── ...
```

**Tech: no (non-technical founder) branch:**
```
<project-slug>-company/
├── 00_charter.md               # The one-pager. Read this first.
├── 01_findings-report.html     # Research report from Phase 3
├── 02_hiring-plan.md           # Org chart + sequenced hire order
├── team-summary.md             # Plain-English team overview — one paragraph per role
├── action-plan.md              # Ordered top-10 actions, assigned by role, with done-when criteria
└── roster.md                   # LIVE team registry — updated every session
```
*Note: skills/ and team/ persona briefs are not generated on the non-technical path.*

---

## 00_charter.md — the one-pager

Single screen. The document read first, every session.

- **Project:** name + the one-paragraph thesis (exact text from Phase 1 exit)
- **CEO verdict:** Build / Refine / Pivot — one line, with conviction
- **The riskiest assumption:** named, plus the cheapest test to disprove it
- **The wedge:** the single core interaction to build first
- **The scope fence:** what this deliberately is NOT doing yet
- **The org at a glance:** hire sequence as a numbered list, one line each
- **Next action:** the single most important thing to do this session

Write in the user's voice: short sentences, no hedging, no corporate filler.

---

## roster.md — the living team registry

This file is the nerve center of Phase 5. The CEO reads it at the start of every session
and updates it after every action. Never let it go stale.

```markdown
# Roster — <Project Name>
Last updated: <date>
CEO verdict: Build / Refine / Pivot

## Active Agents

| Role | Skill | Status | Current Task | Stage | Last Action |
|------|-------|--------|-------------|-------|-------------|
| Systems Designer | skills/systems-designer/ | active | Build core loop spec | MVP | <date>: <what happened> |

## Temporary Agents (SPAWN)

| Role | Task | Date | Outcome |
|------|------|------|---------|

## Archived Agents

| Role | Status | Reason | Work Redistributed To |
|------|--------|--------|-----------------------|
```

---

## 02_hiring-plan.md — the org

- **Org chart** (CEO at top, agents below, grouped by lifecycle stage — ASCII tree is fine)
- **The hire sequence** — ordered list: `role — why this hire now — lifecycle stage`
- **For each role:** one paragraph on what they de-risk and what their first win looks like
- Pointer to the matching `team/<role>.md` brief and `skills/<role>/` skill


---


---

## INCUBATOR.md — the session index (write to workspace root)

This file is what allows the CEO to re-enter the project next session without asking the user
where the project lives. Write it after the roster is initialized (end of Phase 4). Update the
`last-session` field at the end of every Phase 5 session.

```markdown
# INCUBATOR — Active Project Index

## Active Project
name: <project name>
slug: <project-slug>
dir: <full absolute path to PROJECT_DIR>
started: <date>
last-session: <date>
CEO verdict: Build / Refine / Pivot
time-budget: <X hrs/week>
board-meeting-cadence: <bi-weekly / monthly>

## Project History
- <date>: Founded. Team: [roles]. Verdict: [Build/Refine/Pivot].
- <date>: Board meeting. [Key decision or roster change].
```

Write to `./INCUBATOR.md` at the workspace root — the same directory the user opened Claude in.
If multiple projects exist, add them as additional `## Project` sections with a `status: archived`
field on completed ones.

## Presentation order

1. `present_files` with `00_charter.md` first — most immediately useful
2. `01_findings-report.html` — the research
3. The full `<project-slug>-company/` folder

Close with: a short CEO sign-off, the single next action, and nothing else. The user opens
the files themselves. Don't over-explain what's in them.
