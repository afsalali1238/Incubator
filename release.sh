#!/usr/bin/env bash
# release.sh — bump version, package, commit, bundle
#
# Usage:
#   ./release.sh 1.9.0 "brief description"
#
# Environment variables (optional overrides):
#   SKILL_CREATOR_DIR  — path to the skill-creator MCP (for packaging)
#   WORKSPACE_DIR      — path to copy the final bundle + .skill for delivery
#
# If SKILL_CREATOR_DIR is not set, the script tries the Claude Cowork default
# location. If not found, the package step is skipped with a warning.
# If WORKSPACE_DIR is not set, the bundle stays in /tmp only.

set -e

VERSION="$1"
DESC="$2"

if [ -z "$VERSION" ] || [ -z "$DESC" ]; then
  echo "Usage: ./release.sh <version> \"description\""
  exit 1
fi

REPO_ROOT="$(git rev-parse --show-toplevel)"
SKILL_DIR="$REPO_ROOT/skills/project-ceo"

# ── 1. CHANGELOG must have an entry for this version ──────────────────────────
if ! grep -q "^## ${VERSION}" "$REPO_ROOT/CHANGELOG.md"; then
  echo "ERROR: CHANGELOG.md has no entry for v${VERSION}"
  echo "Add the changelog entry first, then run this script."
  exit 1
fi

# ── 2. Bump plugin.json ───────────────────────────────────────────────────────
python3 - "$VERSION" << 'PY'
import json, sys
path = sys.argv[1] + '/.claude-plugin/plugin.json'
# argv[1] is REPO_ROOT passed via env; version is argv[2] but we read from shell
PY

python3 -c "
import json, sys, os
repo = os.environ.get('REPO_ROOT', '.')
version = sys.argv[1]
p = json.load(open(f'{repo}/.claude-plugin/plugin.json'))
p['version'] = version
json.dump(p, open(f'{repo}/.claude-plugin/plugin.json', 'w'), indent=2)
open(f'{repo}/.claude-plugin/plugin.json', 'a').write('\n')
print(f'plugin.json → {version}')
" "$VERSION" REPO_ROOT="$REPO_ROOT"

# ── 3. Package the skill ──────────────────────────────────────────────────────
DIST_TMP="/tmp/dist-release-${VERSION}"

# Locate skill-creator: env var → Claude Cowork default → skip
if [ -z "$SKILL_CREATOR_DIR" ]; then
  # Try common Cowork install path (platform-agnostic search)
  COWORK_SEARCH=$(find "$HOME" -name "skill-creator" -type d \
    -path "*/.claude/skills/*" 2>/dev/null | head -1)
  SKILL_CREATOR_DIR="${COWORK_SEARCH:-}"
fi

if [ -n "$SKILL_CREATOR_DIR" ] && [ -d "$SKILL_CREATOR_DIR" ]; then
  (cd "$SKILL_CREATOR_DIR" && python3 -m scripts.package_skill "$SKILL_DIR" "$DIST_TMP")
  cp "$DIST_TMP/project-ceo.skill" "$REPO_ROOT/dist/project-ceo.skill"
  echo "✅ Skill packaged → dist/project-ceo.skill"
else
  echo "⚠️  skill-creator not found. Skipping package step."
  echo "   Set SKILL_CREATOR_DIR=/path/to/skill-creator or package manually."
fi

# ── 4. Assert version consistency before committing ───────────────────────────
PLUGIN_VER=$(REPO_ROOT="$REPO_ROOT" python3 -c "import json,os; print(json.load(open(os.environ['REPO_ROOT']+'/.claude-plugin/plugin.json'))['version'])")
CHANGELOG_VER=$(grep -m1 "^## " "$REPO_ROOT/CHANGELOG.md" | sed 's/## \([0-9.]*\).*/\1/')

if [ "$PLUGIN_VER" != "$VERSION" ]; then
  echo "ERROR: plugin.json=$PLUGIN_VER, expected $VERSION — aborting"
  exit 1
fi
if [ "$CHANGELOG_VER" != "$VERSION" ]; then
  echo "ERROR: CHANGELOG top entry=$CHANGELOG_VER, expected $VERSION — aborting"
  exit 1
fi
echo "✅ Versions consistent: plugin.json=$PLUGIN_VER, CHANGELOG=$CHANGELOG_VER"

# ── 5. Commit ─────────────────────────────────────────────────────────────────
cd "$REPO_ROOT"
git add -A
git commit -m "v${VERSION} — ${DESC}"
echo "✅ Committed: v${VERSION} — ${DESC}"

# ── 6. Bundle ─────────────────────────────────────────────────────────────────
BUNDLE="/tmp/incubator-v${VERSION}.bundle"
git bundle create "$BUNDLE" --all
echo "✅ Bundle: $BUNDLE"

# Copy to workspace if provided
WORKSPACE_DIR="${WORKSPACE_DIR:-}"
if [ -n "$WORKSPACE_DIR" ] && [ -d "$WORKSPACE_DIR" ]; then
  cp "$BUNDLE" "${WORKSPACE_DIR}/incubator.bundle"
  [ -f "$REPO_ROOT/dist/project-ceo.skill" ] && \
    cp "$REPO_ROOT/dist/project-ceo.skill" "${WORKSPACE_DIR}/project-ceo.skill"
  echo "✅ Delivered to $WORKSPACE_DIR"
fi

echo ""
echo "🚀 Released v${VERSION}"
