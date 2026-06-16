# Autonomous Research Method

This phase is fully autonomous. Once you start, **do not check in** until the report is ready. Mirror the `/autoresearch` spirit: set the loop running, iterate through probes, surface results at the end.

## The loop

Run these probes. Scale searches to the project — a niche tool needs fewer than a broad consumer play. **Run a maximum of 20 searches total across all probes.** If a single probe yields nothing useful after 2 searches, move on. **Search each competitor and each market question separately**; combined queries return shallow results.

### Probe 1 — Competitive landscape, tiered
Map competitors into four tiers. Search each named player individually.
- **Direct** — solving the same problem the same way.
- **Indirect** — solving the same problem a different way (often the *real* competition: the spreadsheet, the manual workaround, the incumbent tool).
- **Potential acquirers** — bigger players who'd buy rather than build.
- **Adjacent** — players one step away who could move into the space.

For each tier, make the *strongest* case for why it threatens this project — not the easy-to-dismiss version. Competitor neglect (underweighting what others do because you're in love with your own vision) is the trap.

### Probe 2 — The winners (the core deliverable)
Find **2–4 genuinely successful analogous projects**. They don't have to be exact competitors — analogues count (a successful sandbox game is an analogue for a new god-sim even if the theme differs). For each, reverse-engineer:
- **The wedge** — the narrow first thing they nailed before expanding.
- **The first feature / first version** — what their MVP actually was.
- **The build sequence** — what they shipped in what order. *This is what Afsal wants most.* He's copying sequencing, not features.
- **Monetization** — how/when they started charging.
- **The moat** — what's hard to replicate now (data, workflow lock-in, community, domain depth).

### Probe 3 — The graveyard
Find analogues or competitors that **died or stalled**. Extract the cause of death (wrong market, premature scaling, no moat, mistimed, ran out of money, feature-bloat). Failed-project evidence is more valuable than success stories — it's where founders stop looking.

### Probe 4 — Market shape
Sketch TAM/SAM/SOM from public data. Don't manufacture a fundable-looking number — pressure-test the assumptions behind it. Determine whether the market is **expanding, consolidating, or mature**; this sets timing and differentiation strategy. Note who holds budget vs who influences the decision.

### Probe 5 — Trends
Identify **2–3 external trends** (regulatory, technological, demographic) that will move this market in ~24 months. Label each a **tailwind** or **headwind** for this specific hypothesis.

### Probe 6 — Devil's advocate (mandatory)
Make the strongest possible case that a competitor wins and this project doesn't. Why their approach is better, why customers choose them, why the differentiator isn't as defensible as Afsal thinks. If the research genuinely surfaces evidence the idea needs revision, **the report must say so**. Confirmation bias with a research engine attached is the failure mode you're guarding against.

## Discipline

- **Use deep scrape tools:** Standard web search often fails on paywalls, developer docs, or deep API references. If you encounter a blocker on a critical competitor, use tools like `fetch` or `curl` to pull down the raw text of their pages to get the exact unit economics or features.
- **Cite real sources.** Paraphrase findings; never reproduce source text. One short quote per source maximum, under 15 words.
- **Believe surprising-but-sourced results**, but stay skeptical on SEO-heavy areas (product rankings, "best X" listicles) — corroborate.
- **Don't flatter.** Your job is the truth that makes the next decision better, not the narrative that makes Afsal feel good.
- When the loop is done, write the report (Phase 3). Don't ask permission.

## What to carry into the report

A tight bundle: the tiered competitor map, the 2–4 winners with their build sequences, the graveyard table with causes of death, the market shape, the trends, and your own synthesized devil's-advocate case. Panel 04 of the VD (The Playbook) is built almost entirely from Probe 2's sequencing findings — make sure that's rich.
