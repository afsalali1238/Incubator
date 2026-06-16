# Changelog

## 1.8.0 — 2026-06-16
- Phase 5: health scores now disclosed as CEO judgment at every board meeting open;
  unreviewed outputs marked provisional (🟡(p)) — never auto-assigned 🟢
- Phase 2/3/4/5/6/7: visible phase transition headers printed before each phase
  ("━━ PHASE N — NAME ━━") so users can't lose track of where the session is
- ENTRY POINT: INCUBATOR.md read confirmed aloud with path and project name
- Phase 4 Step 6: INCUBATOR.md write confirmed with full path; explicit failure
  message if write fails (no more silent skips)
- Returning session: INCUBATOR.md update confirmed before board meeting opens
- Phase 7: first-run session close — lists all output files, tells user exact
  phrase to say next session ("board meeting" / "CEO check in")
- README: GIF placeholder added with exact recording instructions

## 1.7.0 — 2026-06-16
- Regenerated all 5 remaining example agent skills (Uber, Slack, 23andMe, Gymshark, Oculus)
  to meet the hardened quality gate: named frameworks, metrics with thresholds, do-NOT
  anti-patterns, project-specific tradeoffs
- All examples now pass the CRITIC MODE checklist

## 1.6.0 — 2026-06-16
- agent-skill-template.md: restructured "How you operate" section into four mandatory
  sub-sections — named frameworks (≥2), metrics with thresholds, do-NOT anti-patterns,
  project-specific tradeoff. Flavor-only output is structurally harder to produce.
- CRITIC MODE checklist aligned to new section structure; cold-start instruction retained
- Phase 5: doc-reconciliation step added — roster/charter/hiring-plan drift is surfaced
  and fixed before the board meeting health table, never silently skipped
- plugin.json: version 1.0.0 → 1.6.0 (version mismatch fixed)
- README: Design section reframed as "founding operating system, not company simulator"
  with honest explanation of what the model is doing; clears expectation mismatch

## 1.5.0 — 2026-06-16
- Removed 90-day calendar entirely: deleted 03_90-day-calendar.md from all 6 examples,
  stripped all references from SKILL.md (Phase 1/4/5/7), starter-pack.md, hq-template.md,
  orchestration.md, interview.md, and both READMEs; Calendar tab removed from HQ Dashboard
- Phase 1: added technical background question (tech: yes/no flag)
- Phase 3: adaptive panel count — 5 panels for side projects/MVPs, 9 for startups
- Phase 4: branched output on tech flag — non-technical founders get plain team-summary.md
  and action-plan.md instead of installable skill files
- README: fixed "9-panel" references (now adaptive), added "Why not just prompt Claude?"
  section, added companion-skills explanation with built-in fallbacks, added star CTA

## 1.4.0 — 2026-06-16
- Phase 5 re-entry: INCUBATOR.md error states handled explicitly — missing PROJECT_DIR,
  malformed file, and multiple files all have defined recovery paths
- Phase 4: explicit install instructions for generated agent skills (per-platform paths)
- Quality gate moved to agent-skill-template.md as standalone CRITIC MODE section with
  cold-start framing; no longer inline in SKILL.md where generation bias applies
- README: step-by-step install for claude.ai users including fallback for free plan

## 1.3.0 — 2026-06-16
- Phase 2: explicit search counter ("Search N/20:") makes hard cap self-enforcing; added
  INSUFFICIENT DATA mandatory protocol — gaps must be named, not synthesized
- Phase 4: roster derived from research panels — every hire requires a citation to a
  specific finding; org-design.md demoted to naming conventions only (not roster templates)
- Quality gate restructured as separate critic-mode pass; inline evaluation mode removed
- Rewrote Uber City GM and Slack UX Designer example agent skills with real domain depth

## 1.2.0 — 2026-06-16
- Phase 1 exit criterion tightened: CEO must state the locked hypothesis and get explicit
  user agreement before moving to research
- Phase 3: mandatory devil's advocate panel; INSUFFICIENT DATA allowed in report panels
- Phase 4: agent persona brief and skill file both required; quality gate added
- Session closing ritual added to Phase 5

## 1.1.0 — 2026-06-16
- Replaced terrarium-planet example with Airbnb (2008 founding scenario)
- Airbnb is now the lead example with all 7 output files: charter, findings report,
  hiring plan, roster, hq.html, and one installable agent skill
- Added 5 additional real-company examples: Slack, Uber, Gymshark, Oculus, 23andMe
- Rewrote examples/README.md with full index and output structure guide
- Deleted orphaned references/board-meeting.md (content moved to orchestration.md)
- Updated README.md file tree to reflect all example folders
- Repackaged dist/project-ceo.skill from live repo

## 1.0.1 — 2026-06-16
- Added Phase 5 (Board Meeting) for returning sessions
- Added session re-entry via INCUBATOR.md
- Added automatic HQ Dashboard generation (Phase 7)
- Added VC Pitch Deck generation (Phase 6)
- Added Phase 2 hard cap: 20 searches maximum
- Added quality gate on agent skills (domain substance check)
- Added time-commitment question in Phase 1 interview
- Replaced hardcoded personal references to support general use
- Provided fallbacks for missing companion skills (grill-me, vd, autoresearch)

## 1.0.0 — 2026-06-16
- Initial release: project-ceo skill, 4-phase sequence
