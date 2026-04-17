#!/usr/bin/env bash
# scripts/check-links.sh
# Walks every .md file and verifies that each [text](path) link resolves.
# Skips external URLs, bare anchors, and content inside fenced code blocks
# or inline backticks. Exits 1 if any broken link is found.

set -euo pipefail

cd "$(dirname "$0")/.."

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

broken=0
checked=0

# strip_code FILE
# Emits FILE's content with:
#   - fenced code blocks (``` ... ```) removed
#   - inline backtick-quoted content removed (replaced by placeholder)
strip_code() {
  awk '
    BEGIN { in_fence = 0 }
    /^```/ { in_fence = !in_fence; next }
    !in_fence { print }
  ' "$1" | sed 's/`[^`]*`/␣/g'
}

while IFS= read -r file; do
  # Extract [text](target) pairs from content with code stripped
  while IFS= read -r link; do
    # Strip anchor fragment
    target="${link%%#*}"
    [ -z "$target" ] && continue

    # Skip external URLs and common schemes
    case "$target" in
      http://*|https://*|mailto:*|tel:*|ftp://*|ws://*|wss://*|data:*|javascript:*)
        continue
        ;;
    esac

    # Skip obvious placeholders (angle-bracketed, all-caps <PATH>, {{foo}}, ${foo})
    case "$target" in
      '<'*'>'|'{{'*'}}'|'$'{*}|'${'*'}')
        continue
        ;;
    esac

    # Resolve relative to the file's directory
    dir=$(dirname "$file")
    resolved="$dir/$target"

    checked=$((checked + 1))

    if [ ! -e "$resolved" ]; then
      echo -e "${RED}BROKEN${NC}  $file → $target"
      broken=$((broken + 1))
    fi
  done < <(strip_code "$file" | grep -oE '\]\([^)]+\)' | sed -E 's/^\]\(//; s/\)$//')
done < <(find . -type f -name "*.md" \
  -not -path "./node_modules/*" \
  -not -path "./.git/*")

echo ""
echo "──────────────────────────────────────"
if [ "$broken" -eq 0 ]; then
  echo -e "${GREEN}✓${NC} $checked links checked · 0 broken"
  exit 0
else
  echo -e "${RED}✗${NC} $checked links checked · $broken broken"
  exit 1
fi
