# Changelog

## 1.9.7 — 2026-06-18
- SKILL.md (Phase 3): added Panel 05 "The Economics" to startup arc — mandatory unit economics
  panel: CAC range, LTV proxy, margin structure, feasibility verdict, all derived from Phase 2
  research; confidence labels required; INSUFFICIENT DATA flagged 🔴 not substituted
- SKILL.md (Phase 3): added Panel 03 "The Economics" to MVP arc — condensed feasibility check;
  MVP arc updated from 5 panels to 6
- SKILL.md (Phase 3): startup arc updated 9→10 panels; panel numbers renumbered throughout
  (Graveyard 05→06, Heresy 06→07, Trends 07→08, Org 08→09, The Call 09→10)
- SKILL.md (Phase 4): Step 1 panel references updated; Economics panel added as hire-sequencing
  source — roles that test CAC/LTV/margin assumptions surface earlier in the roster
- SKILL.md (Phase 5): added ECONOMICS CHECK as step 5 at every board meeting — pulls Panel 05
  estimates, asks for real numbers if users exist, flags ⚠️ ECONOMICS BLIND SPOT if unit
  economics have never been measured; cannot stay unflagged across two consecutive board meetings

## 1.9.6 — 2026-06-16
- SKILL.md (Phase 1): added pushback triggers for vague answers — CEO must challenge "segment not
  person" user definitions, generic "why now" answers, and universal riskiest assumptions before
  advancing; records unfixed gaps explicitly rather than silently moving on
- SKILL.md (Phase 1): added HOLD condition at Phase 1 exit — if critical gap remains after
  pushback, CEO refuses to go dark and resumes Phase 1; cannot get the nod on a weak thesis
- SKILL.md (Phase 3): added explicit Heresy panel instruction — must write the strongest case
  against the project without hedging; "proceed with caution" explicitly disqualified as a
  Heresy conclusion; if evidence says don't build, report says don't build
- SKILL.md (Phase 4): added uncited roster pushback — CEO names the missing justification and
  refuses to add the role until the founder articulates the problem it solves
- SKILL.md (Phase 5): added persistent 🔴 rule — two consecutive board meetings with nothing
  delivered is a fire decision, not a flag; CEO names it directly and assigns the work
- SKILL.md (Operating principles): split "don't flatter" into two explicit rules — pivot vs.
  refine distinction made explicit; "proceed with caution" named as flattery

## 1.9.5 — 2026-06-16
- SKILL.md (Phase 2): added DRIFT CHECK before synthesis — compares research signals against
  Phase 1 thesis on four dimensions (scope, audience, model, stage); 2+ flags trigger
  "⚠️ DRIFT DETECTED" output and inject "Assumption revisions" into Phase 3 Panel 01
- SKILL.md (Phase 3): added confidence labels (🔵🟡🔴) applied inline to every key finding;
  High = multiple independent sources, Medium = partial/conflicting, Low = inferred/thin/INSUFFICIENT
- SKILL.md (Phase 5): added ASSUMPTION AUDIT step before board meeting summary — re-reads
  Phase 1 thesis against current agent outputs and flags strategic drift as "⚠️ ASSUMPTION DRIFT"
  in board summary under "Revised Understanding"; fixed duplicate step-4 numbering in Phase 5
- SKILL.md (Phase 2/3/4): extended session-state.json schemas with operational fields:
  drift_flags, key_assumptions, confidence (Phase 2); confidence_summary, open_risks (Phase 3);
  unresolved_assumptions, critical_risks (Phase 4); plus summary field in all three
- orchestration.md: fixed file truncation (missing last 3 lines); added DEGRADATION MODES
  section — LOW_SIGNAL (≤30% probes returned data), CONFLICT (contradictory signals on core
  thesis), PARTIAL_RESUME (in-progress state detected) — each with explicit trigger + behavior
- orchestration.md: added CHECKPOINT SUMMARIES pattern — summary field in every
  session-state.json write, ≤20 words, reduces full file-read on resume

## 1.9.4 — 2026-06-16
- release.sh: removed dead `python3 - "$VERSION" << 'PY'` heredoc block (no-op code that
  misled readers about what was executing); step 2 now uses a single clean inline invocation
- release.sh: added integrity check (step 4) — unpacks .skill artifact and diffs every source
  file against packaged content; aborts commit if any mismatch is found; dist can no longer
  silently drift from source
- dist/project-ceo.skill: updated to current source (was stale at v1.0-era, 28K vs 31K)
- SKILL.md (Phase 2): restored stakes-aware search cap (20 standard / 30 VC-track or regulated
  vertical); restored running tally — cap announced at phase start, count reported at synthesis
- SKILL.md (resume logic): added session-state.json as authoritative phase checkpoint; file-
  existence inference now fallback-only; entry point reads JSON phase field first if present
- SKILL.md (Phase 2/3/4): write session-state.json after each phase completes so any dropout
  is recoverable to the exact phase boundary, not just approximated from file presence
- starter-pack.md: session-state.json added to both tech:yes and tech:no folder structures
- orchestration.md: STATE_JSON block declared as canonical source of truth for roster state;
  markdown table is now explicitly presentation-only; CEO reads/writes JSON first, regenerates
  table from it
- agent-skill-template.md + SKILL.md: quality gate now outputs explicit [CRITIQUE GATE] prompt
  and requires "Quality gate: PASS" or "Quality gate: FAIL — rewriting [section]" token before
  proceeding; cannot skip critique while appearing to comply

## 1.9.3 — 2026-06-16
- SKILL.md (CRITICAL): Moved INCUBATOR.md initial write from Phase 4 to end of Phase 1 —
  session anchor is now created the moment the thesis is locked, eliminating the data-loss
  window across Phases 2–3. Phase 4 Step 6 now updates the file (sets dir + verdict) rather
  than creating it from scratch.
- SKILL.md (HIGH): Entry point resume logic now detects 01_findings-report.md (no .html) and
  correctly routes returning users to the Phase 3 HTML render pause instead of forcing a
  full Phase 2 restart.

## 1.9.2 — 2026-06-16
- SKILL.md: Eliminated Phase 3 token limit collapse risk — chunked output into two steps (markdown first, then HTML on user confirm).
- SKILL.md: Phase 4 agent generation chunked to max 2 at a time with user "continue" gate to prevent output truncation.
- agent-skill-template.md: Fixed Critic Mode illusion — quality gate now requires human-in-the-loop pause (user types CRITIQUE) before evaluation begins.
- starter-pack.md: Hardened roster.md state management — added JSON STATE block at bottom to prevent markdown table parse drift.
- SKILL.md: Removed brittle "Search N/[CAP]" numerical counter; replaced with simpler 20-search hard cap.
- plugin.json: Repaired truncated file (license field was missing value).

## 1.9.1 — 2026-06-16
- SKILL.md: Fixed Phase 2/3 session resume paradox by tying the resume trigger to `INCUBATOR.md` instead of `00_charter.md` (which is generated in Phase 4).
- SKILL.md: Implemented chunking in Phase 4 agent generation (max 2 agents at a time) to prevent output token limit collapse.
- hq-template.md: Added new "Action Plan" sidebar tab and `<!-- INJECT: ACTION_PLAN -->` block to support non-technical founder paths.
- agent-skill-template.md: Removed hardcoded Linux mount paths for the packaging script; replaced with generic environment instructions.

## 1.9.0 — 2026-06-16

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
