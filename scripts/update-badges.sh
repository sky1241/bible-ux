#!/usr/bin/env bash
# scripts/update-badges.sh
# Regenerates the shields.io badges in README.md from stats.json.
# Pattern matched: [![Content](...lines-X-...)](...) → rewritten with live value.

set -euo pipefail

cd "$(dirname "$0")/.."

if [ ! -f stats.json ]; then
  echo "❌ stats.json not found. Run scripts/update-stats.sh first."
  exit 1
fi

# Extract values from stats.json
content_lines=$(grep -oE '"content_lines":[[:space:]]*[0-9]+' stats.json | grep -oE '[0-9]+')
sections_total=$(grep -oE '"sections_total":[[:space:]]*[0-9]+' stats.json | grep -oE '[0-9]+')
version=$(grep -oE '"version":[[:space:]]*"[^"]+"' stats.json | sed -E 's/.*"([^"]+)"/\1/')

# Format content_lines with comma separator (45831 → 45,831)
content_formatted=$(printf "%'d" "$content_lines" | tr ',' 'Z' | sed 's/Z/%2C/g')

# shields.io badge URLs
content_url="https://img.shields.io/badge/lines-${content_formatted}-blue"
sections_url="https://img.shields.io/badge/sections-${sections_total}-green"
version_url="https://img.shields.io/badge/version-${version}-orange"

# Rewrite badges in README.md (between BADGES_START and BADGES_END markers)
tmpfile=$(mktemp)

if ! grep -q "<!-- BADGES_START -->" README.md; then
  echo "ℹ  README.md has no badge markers. Wrapping existing badges."
  # Find the 4 badge lines and wrap them
  awk '
    /^\[\!\[Content\]/ && !inserted {
      print "<!-- BADGES_START -->"
      print "[![Content](https://img.shields.io/badge/lines-'"$content_formatted"'-blue)]()"
      print "[![Sections](https://img.shields.io/badge/sections-'"$sections_total"'-green)]()"
      print "[![Version](https://img.shields.io/badge/version-'"$version"'-orange)]()"
      print "[![Freshness](https://img.shields.io/badge/fresh-2024--2026-orange)]()"
      print "[![License](https://img.shields.io/badge/license-dual%20MIT%20%2B%20EULA-lightgrey)](LICENSE.md)"
      print "<!-- BADGES_END -->"
      inserted = 1
      next
    }
    /^\[\!\[Sections\]/ || /^\[\!\[Freshness\]/ || /^\[\!\[License\]/ { if (inserted) next }
    { print }
  ' README.md > "$tmpfile"
  mv "$tmpfile" README.md
  echo "✓ Badges wrapped with markers. Re-run to verify."
  exit 0
fi

# Replace content between BADGES_START and BADGES_END
awk -v content_url="$content_url" \
    -v sections="$sections_total" \
    -v version="$version" \
    -v content_fmt="$content_formatted" \
    '
    /<!-- BADGES_START -->/ {
      print
      print "[![Content](https://img.shields.io/badge/lines-" content_fmt "-blue)]()"
      print "[![Sections](https://img.shields.io/badge/sections-" sections "-green)]()"
      print "[![Version](https://img.shields.io/badge/version-" version "-orange)]()"
      print "[![Freshness](https://img.shields.io/badge/fresh-2024--2026-orange)]()"
      print "[![License](https://img.shields.io/badge/license-dual%20MIT%20%2B%20EULA-lightgrey)](LICENSE.md)"
      skip = 1
      next
    }
    /<!-- BADGES_END -->/ { print; skip = 0; next }
    skip != 1 { print }
    ' README.md > "$tmpfile"

mv "$tmpfile" README.md
echo "✓ README.md badges updated — lines: ${content_lines} · sections: ${sections_total} · version: ${version}"
