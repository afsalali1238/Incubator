# HQ Dashboard — HTML Template

This file contains the template Claude uses to generate `hq.html` in Phase 7.

## How to use

1. Copy the HTML block below verbatim into `PROJECT_DIR/hq.html`
2. Replace every `<!-- INJECT: <section> -->` comment with the actual markdown content
   rendered as HTML (convert markdown headings → `<h2>/<h3>`, bold → `<strong>`,
   tables → `<table>`, bullet lists → `<ul>`, code blocks → `<pre><code>`)
3. Replace `{{PROJECT_NAME}}`, `{{CEO_VERDICT}}`, `{{LAST_UPDATED}}` with real values
4. Save. Zero external dependencies except Google Fonts.

## Content injection map

| Placeholder | Source file | Section to inject |
|-------------|-------------|-------------------|
| `<!-- INJECT: CHARTER -->` | `00_charter.md` | Full file |
| `<!-- INJECT: TEAM -->` | `02_hiring-plan.md` | Full file |
| `<!-- INJECT: ROSTER -->` | `roster.md` | Full file (with health emoji preserved) |
| `<!-- INJECT: ACTION_PLAN -->` | `action-plan.md` | Full file (if generated on non-technical path) |

---

## The HTML template

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{{PROJECT_NAME}} — HQ</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  :root {
    --bg:        #0d1117;
    --bg-panel:  #161b22;
    --bg-card:   #21262d;
    --border:    #30363d;
    --text:      #e6edf3;
    --text-muted:#8b949e;
    --accent:    #58a6ff;
    --green:     #3fb950;
    --yellow:    #d29922;
    --red:       #f85149;
    --purple:    #bc8cff;
    --radius:    8px;
    --sidebar-w: 220px;
  }

  body {
    font-family: 'Inter', system-ui, sans-serif;
    background: var(--bg);
    color: var(--text);
    display: flex;
    min-height: 100vh;
    font-size: 14px;
    line-height: 1.6;
  }

  /* ── Sidebar ── */
  .sidebar {
    width: var(--sidebar-w);
    background: var(--bg-panel);
    border-right: 1px solid var(--border);
    padding: 24px 0;
    position: fixed;
    top: 0; left: 0; bottom: 0;
    overflow-y: auto;
    z-index: 10;
  }
  .sidebar-logo {
    padding: 0 20px 24px;
    border-bottom: 1px solid var(--border);
    margin-bottom: 16px;
  }
  .sidebar-logo .project-name {
    font-size: 15px;
    font-weight: 700;
    color: var(--text);
    display: block;
  }
  .sidebar-logo .verdict {
    font-size: 11px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: var(--green);
    margin-top: 4px;
  }
  .sidebar-logo .verdict.refine { color: var(--yellow); }
  .sidebar-logo .verdict.pivot  { color: var(--red); }
  .nav-section {
    padding: 0 12px 8px;
    font-size: 11px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: var(--text-muted);
    margin-top: 16px;
  }
  .nav-item {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 7px 20px;
    color: var(--text-muted);
    text-decoration: none;
    border-radius: 0;
    cursor: pointer;
    transition: background 0.1s, color 0.1s;
    font-size: 13.5px;
    border-left: 2px solid transparent;
  }
  .nav-item:hover, .nav-item.active {
    background: var(--bg-card);
    color: var(--text);
    border-left-color: var(--accent);
  }
  .nav-item .icon { width: 16px; text-align: center; opacity: 0.7; }

  /* ── Main ── */
  .main {
    margin-left: var(--sidebar-w);
    flex: 1;
    padding: 32px;
    max-width: 1100px;
  }

  .page { display: none; }
  .page.active { display: block; }

  /* ── Page header ── */
  .page-header {
    margin-bottom: 28px;
    padding-bottom: 20px;
    border-bottom: 1px solid var(--border);
  }
  .page-header h1 {
    font-size: 22px;
    font-weight: 700;
    color: var(--text);
  }
  .page-header .meta {
    font-size: 12px;
    color: var(--text-muted);
    margin-top: 4px;
  }

  /* ── Cards ── */
  .card {
    background: var(--bg-panel);
    border: 1px solid var(--border);
    border-radius: var(--radius);
    padding: 20px 24px;
    margin-bottom: 20px;
  }
  .card h2 {
    font-size: 13px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.07em;
    color: var(--text-muted);
    margin-bottom: 14px;
  }
  .card h3 {
    font-size: 15px;
    font-weight: 600;
    color: var(--text);
    margin: 16px 0 8px;
  }
  .card p { color: var(--text-muted); margin-bottom: 10px; }
  .card strong { color: var(--text); font-weight: 600; }
  .card ul { padding-left: 20px; color: var(--text-muted); }
  .card ul li { margin-bottom: 4px; }

  /* ── Stat row ── */
  .stat-row {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 16px;
    margin-bottom: 24px;
  }
  .stat {
    background: var(--bg-panel);
    border: 1px solid var(--border);
    border-radius: var(--radius);
    padding: 16px 20px;
  }
  .stat .label { font-size: 11px; text-transform: uppercase; letter-spacing: 0.07em; color: var(--text-muted); }
  .stat .value { font-size: 24px; font-weight: 700; color: var(--text); margin-top: 4px; }
  .stat .value.green { color: var(--green); }
  .stat .value.yellow { color: var(--yellow); }
  .stat .value.red { color: var(--red); }

  /* ── Roster table ── */
  .roster-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 13px;
  }
  .roster-table th {
    text-align: left;
    padding: 10px 12px;
    font-size: 11px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.07em;
    color: var(--text-muted);
    border-bottom: 1px solid var(--border);
  }
  .roster-table td {
    padding: 10px 12px;
    border-bottom: 1px solid var(--border);
    color: var(--text-muted);
    vertical-align: top;
  }
  .roster-table td:first-child { color: var(--text); font-weight: 500; }
  .roster-table tr:last-child td { border-bottom: none; }
  .badge {
    display: inline-block;
    font-size: 11px;
    font-weight: 600;
    padding: 2px 8px;
    border-radius: 20px;
    background: var(--bg-card);
    border: 1px solid var(--border);
  }
  .badge.active  { color: var(--green);  border-color: var(--green); }
  .badge.blocked { color: var(--yellow); border-color: var(--yellow); }
  .badge.fired   { color: var(--red);    border-color: var(--red); }
  .badge.temp    { color: var(--purple); border-color: var(--purple); }

  /* ── Content prose (for injected markdown) ── */
  .prose { color: var(--text-muted); }
  .prose h2 { font-size: 16px; font-weight: 600; color: var(--text); margin: 20px 0 10px; }
  .prose h3 { font-size: 14px; font-weight: 600; color: var(--text); margin: 14px 0 6px; }
  .prose p  { margin-bottom: 10px; }
  .prose ul { padding-left: 20px; margin-bottom: 10px; }
  .prose li { margin-bottom: 4px; }
  .prose strong { color: var(--text); font-weight: 600; }
  .prose code {
    font-family: 'JetBrains Mono', monospace;
    font-size: 12px;
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: 4px;
    padding: 1px 6px;
    color: var(--purple);
  }
  .prose pre {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius);
    padding: 14px;
    overflow-x: auto;
    font-family: 'JetBrains Mono', monospace;
    font-size: 12px;
    color: var(--text-muted);
    margin: 10px 0;
  }
  .prose blockquote {
    border-left: 3px solid var(--accent);
    margin: 12px 0;
    padding: 8px 16px;
    color: var(--text-muted);
    font-style: italic;
  }
  .prose table { width: 100%; border-collapse: collapse; font-size: 13px; margin: 12px 0; }
  .prose table th { text-align: left; padding: 8px 12px; border-bottom: 2px solid var(--border); color: var(--text); font-weight: 600; }
  .prose table td { padding: 8px 12px; border-bottom: 1px solid var(--border); color: var(--text-muted); }

  /* ── Last updated bar ── */
  .last-updated {
    font-size: 11px;
    color: var(--text-muted);
    padding: 16px 32px;
    border-top: 1px solid var(--border);
    margin-top: 32px;
    margin-left: var(--sidebar-w);
  }
</style>
</head>
<body>

<!-- ── Sidebar ── -->
<nav class="sidebar">
  <div class="sidebar-logo">
    <span class="project-name">{{PROJECT_NAME}}</span>
    <span class="verdict">● {{CEO_VERDICT}}</span>
  </div>

  <div class="nav-section">Company</div>
  <a class="nav-item active" onclick="show('charter')">
    <span class="icon">📋</span> Charter
  </a>
  <a class="nav-item" onclick="show('roster')">
    <span class="icon">👥</span> Roster
  </a>
  <div class="nav-section">Team</div>
  <a class="nav-item" onclick="show('hiring')">
    <span class="icon">🎯</span> Hiring Plan
  </a>
  <a class="nav-item" onclick="show('action-plan')">
    <span class="icon">🚀</span> Action Plan
  </a>

  <div class="nav-section">Docs</div>
  <a class="nav-item" onclick="show('charter')">
    <span class="icon">📄</span> Full Charter
  </a>
</nav>

<!-- ── Main content ── -->
<main class="main">

  <!-- Charter page -->
  <div id="page-charter" class="page active">
    <div class="page-header">
      <h1>Company Charter</h1>
      <div class="meta">{{PROJECT_NAME}} · Last updated {{LAST_UPDATED}}</div>
    </div>
    <div class="card">
      <h2>Charter</h2>
      <div class="prose">
        <!-- INJECT: CHARTER -->
      </div>
    </div>
  </div>

  <!-- Roster page -->
  <div id="page-roster" class="page">
    <div class="page-header">
      <h1>Team Roster</h1>
      <div class="meta">Live team registry · Updated each session</div>
    </div>
    <div class="card">
      <h2>Active Agents</h2>
      <div class="prose">
        <!-- INJECT: ROSTER -->
      </div>
    </div>
  </div>

  <!-- Hiring plan page -->
  <div id="page-hiring" class="page">
    <div class="page-header">
      <h1>Hiring Plan</h1>
      <div class="meta">Sequenced by de-risking order</div>
    </div>
    <div class="card">
      <h2>Org & Hire Sequence</h2>
      <div class="prose">
        <!-- INJECT: TEAM -->
      </div>
    </div>
  </div>

  <!-- Action plan page -->
  <div id="page-action-plan" class="page">
    <div class="page-header">
      <h1>Action Plan</h1>
      <div class="meta">Assigned tasks and milestones</div>
    </div>
    <div class="card">
      <h2>Top Actions</h2>
      <div class="prose">
        <!-- INJECT: ACTION_PLAN -->
      </div>
    </div>
  </div>

</main>

<div class="last-updated">{{PROJECT_NAME}} HQ · Last updated {{LAST_UPDATED}} · Incubator by Afsal Ali</div>

<script>
function show(page) {
  document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
  document.querySelectorAll('.nav-item').forEach(n => n.classList.remove('active'));
  document.getElementById('page-' + page).classList.add('active');
  event.currentTarget.classList.add('active');
}
</script>
</body>
</html>
```
