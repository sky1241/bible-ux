#!/usr/bin/env bash
# scripts/update-stats.sh
# Regenerates stats.json from actual file wc -l counts.
# Keeps the existing metadata (version, platforms, export_formats, etc.)
# but rewrites content_files / meta_files / prompts lines.

set -euo pipefail

cd "$(dirname "$0")/.."

today=$(date +%Y-%m-%d)

# Count lines for a file (0 if missing)
count_lines() {
  if [ -f "$1" ]; then
    wc -l < "$1" | tr -d ' '
  else
    echo 0
  fi
}

# Bibles
web=$(count_lines bibles/WEB.md)
mobile=$(count_lines bibles/MOBILE.md)
wearable=$(count_lines bibles/WEARABLE.md)
xr=$(count_lines bibles/XR.md)
icons=$(count_lines bibles/ICONS.md)
design_tree=$(count_lines DESIGN_TREE.md)
values=$(count_lines VALUES.md)

# Meta
readme=$(count_lines README.md)
changelog=$(count_lines CHANGELOG.md)
license=$(count_lines LICENSE.md)
roadmap=$(count_lines ROADMAP.md)
commandes=$(count_lines COMMANDES.md)

content_total=$((web + mobile + wearable + xr + icons + design_tree + values))

# Prompts — enumerate all .md in prompts/ excluding README and VISION
declare -A prompt_lines
prompts_total=0
prompts_count=0
for f in prompts/PROMPT_*.md; do
  [ ! -f "$f" ] && continue
  name=$(basename "$f")
  lines=$(count_lines "$f")
  prompt_lines["$name"]=$lines
  prompts_total=$((prompts_total + lines))
  prompts_count=$((prompts_count + 1))
done

# File count (all versioned files except .git)
total_files=$(find . -type f \
  -not -path "./.git/*" \
  -not -path "./node_modules/*" \
  | wc -l | tr -d ' ')

# Build JSON
cat > stats.json <<EOF
{
  "repo": "bible-ux",
  "version": "1.9.0-unreleased",
  "last_updated": "$today",
  "phase": "STABLE",
  "total_files": $total_files,
  "content_lines": $content_total,
  "structure_version": 2,
  "content_files": {
    "bibles/WEB.md": $web,
    "bibles/MOBILE.md": $mobile,
    "bibles/WEARABLE.md": $wearable,
    "bibles/XR.md": $xr,
    "bibles/ICONS.md": $icons,
    "DESIGN_TREE.md": $design_tree,
    "VALUES.md": $values
  },
  "meta_files": {
    "README.md": $readme,
    "CHANGELOG.md": $changelog,
    "LICENSE.md": $license,
    "ROADMAP.md": $roadmap,
    "COMMANDES.md": $commandes,
    "stats.json": "self"
  },
  "prompts": {
    "count": $prompts_count,
    "total_lines": $prompts_total,
    "files": {
EOF

# Append prompt entries
first=true
for name in "${!prompt_lines[@]}"; do
  if $first; then
    first=false
  else
    echo "," >> stats.json
  fi
  printf '      "%s": %s' "$name" "${prompt_lines[$name]}" >> stats.json
done
echo "" >> stats.json

cat >> stats.json <<EOF
    },
    "router": "prompts/README.md",
    "vision": "prompts/VISION.md"
  },
  "sources": {
    "count": 7,
    "size_mb": 1.6,
    "status": "awaiting_copyright_review",
    "index": "_sources/SOURCES.md"
  },
  "sections_total": 331,
  "sections_by_bible": {
    "bibles/WEB.md": 107,
    "bibles/MOBILE.md": 105,
    "bibles/WEARABLE.md": 76,
    "bibles/XR.md": 14,
    "bibles/ICONS.md": 29
  },
  "platforms": [
    "Web",
    "iOS",
    "Android",
    "Wear OS",
    "watchOS",
    "Garmin Connect IQ",
    "visionOS (Vision Pro)",
    "Horizon OS (Meta Quest)",
    "Android XR (Samsung Galaxy XR)",
    "Smart glasses (Ray-Ban Meta, XREAL, VITURE, Rokid, RayNeo, Halliday, Snap Spectacles)"
  ],
  "export_formats": [
    "CSS custom properties",
    "Tailwind config",
    "Flutter ThemeData",
    "SwiftUI theme",
    "iOS UIKit",
    "Kotlin Compose theme",
    "Android XML resources",
    "Figma Tokens JSON"
  ],
  "license": "dual (MIT + commercial EULA)",
  "license_file": "LICENSE.md"
}
EOF

echo "✓ stats.json regenerated — content: $content_total lines · prompts: $prompts_count ($prompts_total lines) · total files: $total_files"
