#!/usr/bin/env bash
# release.sh — bump version, package, commit, bundle
# Usage: ./release.sh 1.8.0 "brief description of changes"
set -e

VERSION="$1"
DESC="$2"

if [ -z "$VERSION" ] || [ -z "$DESC" ]; then
  echo "Usage: ./release.sh <version> \"description\""
  exit 1
fi

# ── 1. Sanity check: CHANGELOG must have an entry for this version ─────────────
if ! grep -q "^## ${VERSION}" CHANGELOG.md; then
  echo "ERROR: CHANGELOG.md has no entry for v${VERSION}"
  echo "Add the changelog entry first, then run this script."
  exit 1
fi

# ── 2. Bump plugin.json ────────────────────────────────────────────────────────
python3 -c "
import json, sys
with open('.claude-plugin/plugin.json') as f: p = json.load(f)
p['version'] = sys.argv[1]
with open('.claude-plugin/plugin.json', 'w') as f:
    json.dump(p, f, indent=2)
    f.write('\n')
print(f'plugin.json → {sys.argv[1]}')
" "$VERSION"

# ── 3. Package the skill ───────────────────────────────────────────────────────
SKILL_CREATOR_DIR="/sessions/loving-sweet-cerf/mnt/.claude/skills/skill-creator"
DIST_TMP="/tmp/dist-release-${VERSION}"

if [ -d "$SKILL_CREATOR_DIR" ]; then
  cd "$SKILL_CREATOR_DIR"
  python3 -m scripts.package_skill /tmp/incubator-work/skills/project-ceo "$DIST_TMP"
  cp "$DIST_TMP/project-ceo.skill" /tmp/incubator-work/dist/project-ceo.skill
  cd /tmp/incubator-work
  echo "✅ Skill packaged"
else
  echo "⚠️  skill-creator not found — skipping package step (run manually)"
fi

# ── 4. Assert versions are consistent before committing ───────────────────────
PLUGIN_VER=$(python3 -c "import json; print(json.load(open('.claude-plugin/plugin.json'))['version'])")
CHANGELOG_VER=$(grep -m1 "^## " CHANGELOG.md | sed 's/## \([0-9.]*\).*/\1/')

if [ "$PLUGIN_VER" != "$VERSION" ]; then
  echo "ERROR: plugin.json says $PLUGIN_VER, expected $VERSION"
  exit 1
fi
if [ "$CHANGELOG_VER" != "$VERSION" ]; then
  echo "ERROR: CHANGELOG top entry is $CHANGELOG_VER, expected $VERSION"
  exit 1
fi
echo "✅ Versions consistent: plugin.json=$PLUGIN_VER, CHANGELOG=$CHANGELOG_VER"

# ── 5. Commit ─────────────────────────────────────────────────────────────────
git add -A
git commit -m "v${VERSION} — ${DESC}"
echo "✅ Committed: v${VERSION} — ${DESC}"

# ── 6. Bundle (copy to workspace if mounted) ──────────────────────────────────
WORKSPACE="/sessions/loving-sweet-cerf/mnt/incub"
git bundle create "/tmp/incubator-v${VERSION}.bundle" --all
echo "✅ Bundle: /tmp/incubator-v${VERSION}.bundle"

if [ -d "$WORKSPACE" ]; then
  cp "/tmp/incubator-v${VERSION}.bundle" "${WORKSPACE}/incubator.bundle"
  cp dist/project-ceo.skill "${WORKSPACE}/project-ceo.skill"
  echo "✅ Delivered to workspace"
fi

echo ""
echo "🚀 Released v${VERSION}"
