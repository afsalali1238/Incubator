# HQ Dashboard Template

The CEO generates `hq.html` in Phase 7 to serve as the virtual office for the company. It is a single HTML file containing embedded CSS and JavaScript to create a Slack-like UI.

When generating `hq.html`, the CEO must inject the actual markdown contents of the project's files into the designated hidden `div`s inside the HTML. The javascript uses a lightweight markdown parser (marked.js) to render the channels.

Use this exact boilerplate for `hq.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company HQ</title>
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
    <style>
        :root { --bg-dark: #1E1E1E; --bg-panel: #252526; --text-main: #CCCCCC; --accent: #007ACC; --border: #333333; }
        body { margin: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: var(--bg-dark); color: var(--text-main); display: flex; height: 100vh; overflow: hidden; }
        #sidebar { width: 250px; background: var(--bg-panel); border-right: 1px solid var(--border); display: flex; flex-direction: column; }
        .sidebar-header { padding: 20px; font-weight: bold; font-size: 1.2rem; border-bottom: 1px solid var(--border); color: #fff; }
        .channel-list { list-style: none; padding: 10px 0; margin: 0; }
        .channel { padding: 10px 20px; cursor: pointer; color: #aaa; transition: 0.2s; }
        .channel:hover { background: #333; color: #fff; }
        .channel.active { background: var(--accent); color: #fff; font-weight: bold; }
        #main-content { flex: 1; padding: 40px; overflow-y: auto; line-height: 1.6; }
        #main-content h1, #main-content h2, #main-content h3 { color: #fff; }
        .hidden-data { display: none; white-space: pre-wrap; }
    </style>
</head>
<body>
    <div id="sidebar">
        <div class="sidebar-header" id="company-name">Project HQ</div>
        <ul class="channel-list">
            <li class="channel active" onclick="switchChannel('charter', this)"># announcements</li>
            <li class="channel" onclick="switchChannel('calendar', this)"># 90-day-sprints</li>
            <li class="channel" onclick="switchChannel('team', this)"># team-roster</li>
            <li class="channel" onclick="switchChannel('board', this)"># board-room</li>
        </ul>
    </div>
    <div id="main-content"></div>

    <!-- INJECT MARKDOWN CONTENT HERE -->
    <pre id="data-charter" class="hidden-data">
<!-- CEO INJECTS 00_charter.md HERE -->
    </pre>
    <pre id="data-calendar" class="hidden-data">
<!-- CEO INJECTS 03_90-day-calendar.md HERE -->
    </pre>
    <pre id="data-team" class="hidden-data">
<!-- CEO INJECTS 02_hiring-plan.md HERE -->
    </pre>
    <pre id="data-board" class="hidden-data">
<!-- CEO INJECTS PHASE 5 BOARD MEETING NOTES HERE -->
    </pre>

    <script>
        function switchChannel(channelId, element) {
            document.querySelectorAll('.channel').forEach(el => el.classList.remove('active'));
            element.classList.add('active');
            const mdContent = document.getElementById('data-' + channelId).innerText;
            document.getElementById('main-content').innerHTML = marked.parse(mdContent);
        }
        // Initialize
        document.getElementById('main-content').innerHTML = marked.parse(document.getElementById('data-charter').innerText);
    </script>
</body>
</html>
```

The CEO must cleanly dump the unformatted raw Markdown text into the respective `<pre class="hidden-data">` blocks without breaking the HTML structure.
