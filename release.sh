#!/usr/bin/env bash
# release.sh — bump version, package, verify integrity, commit, bundle
#
# Usage:
#   ./release.sh 1.9.4 "brief description"
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
echo "✅ CHANGELOG entry found for v${VERSION}"

# ── 2. Bump plugin.json ───────────────────────────────────────────────────────
REPO_ROOT="$REPO_ROOT" python3 -c "
import json, os
repo = os.environ['REPO_ROOT']
version = '${VERSION}'
path = f'{repo}/.claude-plugin/plugin.json'
p = json.load(open(path))
p['version'] = version
json.dump(p, open(path, 'w'), indent=2)
open(path, 'a').write('\n')
print(f'plugin.json → {version}')
"

# ── 3. Package the skill ──────────────────────────────────────────────────────
DIST_TMP="/tmp/dist-release-${VERSION}"
rm -rf "$DIST_TMP"

# Locate skill-creator: env var → Claude Cowork default → skip
if [ -z "$SKILL_CREATOR_DIR" ]; then
  COWORK_SEARCH=$(find "$HOME" -name "skill-creator" -type d \
    -path "*/.claude/skills/*" 2>/dev/null | head -1)
  SKILL_CREATOR_DIR="${COWORK_SEARCH:-}"
fi

if [ -n "$SKILL_CREATOR_DIR" ] && [ -d "$SKILL_CREATOR_DIR" ]; then
  (cd "$SKILL_CREATOR_DIR" && python3 -m scripts.package_skill "$SKILL_DIR" "$DIST_TMP")
  echo "✅ Skill packaged → $DIST_TMP/project-ceo.skill"
else
  echo "⚠️  skill-creator not found. Skipping package step."
  echo "   Set SKILL_CREATOR_DIR=/path/to/skill-creator or package manually."
fi

# ── 4. Integrity check — verify packaged artifact matches source ───────────────
if [ -f "$DIST_TMP/project-ceo.skill" ]; then
  UNPACK_DIR="/tmp/dist-verify-${VERSION}"
  rm -rf "$UNPACK_DIR" && mkdir -p "$UNPACK_DIR"
  unzip -q "$DIST_TMP/project-ceo.skill" -d "$UNPACK_DIR"

  MISMATCH=0
  for src_file in "$SKILL_DIR/SKILL.md" "$SKILL_DIR/references/"*.md; do
    rel="${src_file#$SKILL_DIR/}"
    pkg_file="$UNPACK_DIR/project-ceo/$rel"
    if [ ! -f "$pkg_file" ]; then
      echo "ERROR: $rel missing from packaged artifact"
      MISMATCH=1
    elif ! diff -q "$src_file" "$pkg_file" > /dev/null 2>&1; then
      echo "ERROR: $rel differs between source and packaged artifact"
      diff "$src_file" "$pkg_file" | head -10
      MISMATCH=1
    fi
  done

  if [ "$MISMATCH" -ne 0 ]; then
    echo "ERROR: Integrity check failed — source and dist are out of sync. Aborting."
    exit 1
  fi
  echo "✅ Integrity check passed — all source files match packaged artifact"

  mkdir -p "$REPO_ROOT/dist"
  cp "$DIST_TMP/project-ceo.skill" "$REPO_ROOT/dist/project-ceo.skill"
  echo "✅ dist/project-ceo.skill updated"
fi

# ── 5. Assert version consistency before committing ───────────────────────────
PLUGIN_VER=$(REPO_ROOT="$REPO_ROOT" python3 -c "
import json, os
print(json.load(open(os.environ['REPO_ROOT']+'/.claude-plugin/plugin.json'))['version'])
")
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

# ── 6. Commit ─────────────────────────────────────────────────────────────────
cd "$REPO_ROOT"
git add -A
git commit -m "v${VERSION} — ${DESC}"
echo "✅ Committed: v${VERSION} — ${DESC}"

# ── 7. Bundle ─────────────────────────────────────────────────────────────────
BUNDLE="/tmp/incubator-v${VERSION}.bundle"
git bundle create "$BUNDLE" --all
echo "✅ Bundle: $BUNDLE"

WORKSPACE_DIR="${WORKSPACE_DIR:-}"
if [ -n "$WORKSPACE_DIR" ] && [ -d "$WORKSPACE_DIR" ]; then
  cp "$BUNDLE" "${WORKSPACE_DIR}/incubator.bundle"
  [ -f "$REPO_ROOT/dist/project-ceo.skill" ] && \
    cp "$REPO_ROOT/dist/project-ceo.skill" "${WORKSPACE_DIR}/project-ceo.skill"
  echo "✅ Delivered to $WORKSPACE_DIR"
fi

echo ""
echo "🚀 Released v${VERSION}"
