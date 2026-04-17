# Roadmap

> What's planned, in priority order. Tick items as they ship and move them to [CHANGELOG.md](CHANGELOG.md).

Current version: **1.2.0-unreleased** (see [stats.json](stats.json)).

---

## Recently shipped (unreleased)

- [x] **PROMPT_TOKENS_EXPORT.md** — killer feature shipped. 835-line prompt covering 8 export formats: CSS custom properties, Tailwind config, Flutter ThemeData, SwiftUI theme, iOS UIKit, Kotlin Compose, Android XML (dimens / integers / styles), Figma Tokens JSON (Tokens Studio). Transforms VALUES.md from "doc to read" into "config to import" — the jump that justifies the $49 Gumroad price.
- [x] **XR.md** — 4th platform bible (Vision Pro, Meta Quest, Samsung Galaxy XR, Pico, Vive, Varjo, PSVR2, smart glasses Ray-Ban Meta / XREAL / VITURE / Rokid / RayNeo / Halliday / Snap). 842 lines, 14 sections (A → N), 54 subsections. Sourced from ChatGPT Deep Research baseline 2026-04-17 with 76 primary citations. Cross-referenced from [MOBILE.md § CJ](MOBILE.md).

## Now — in progress

_(nothing in progress — free slot)_

## Next — priority 1 (monetization-critical)

### Remaining prompts to fill the routing gaps
- [ ] **PROMPT_SPEC_FROM_SCRATCH.md** — "describe your app in 2 sentences → full design spec output". Targets greenfield projects, not just "fix the existing ugly thing".
- [ ] **PROMPT_PICK_PATTERN.md** — "I have X destinations, Y users, Z constraints → which pattern from DESIGN_TREE?". Exploits the underused decision tree.
- [ ] **PROMPT_CODE_REVIEW.md** — review a diff / PR against the bibles (code-level, not screenshot-level).

### Copyright & legal (do before any paid distribution)
- [ ] **Review `_sources/*.pdf` copyright status** — see [_sources/SOURCES.md](_sources/SOURCES.md). For each PDF: identify origin, verify license, keep / replace-with-URL-citation / delete. Any third-party copyrighted content must be removed before commercial sale on Gumroad / Product Hunt / HN.

## Short-term — priority 2 (polish)

- [ ] **Monetization phase 2** (per the author's personal notes, not shipped in repo):
  - 10-15 before/after visual examples (~4-6h)
  - Gumroad product page
  - GitHub Sponsors activation
  - First promotional post (Twitter / HN / Reddit)
- [ ] **Slim PROMPT_DESIGN_AUDIT.md** from 935 → ~300 lines by removing tables that duplicate VALUES.md (replace with references).
- [ ] **DESIGN_TREE.md cross-ref full audit** — spot-check pass at 6/6 but 500+ entries haven't been verified exhaustively. Either automate via a script or do a targeted pass.

## Mid-term — priority 3 (structural)

- [ ] **Restructure folders** to `bibles/` + `meta/` + `prompts/` + `scripts/` + `_sources/` — cleaner tree at repo root. Risk: breaks relative links in cross-references. Requires a link-fix pass after the move.
- [ ] **`scripts/build-index.js`** — auto-generate DESIGN_TREE.md indexes from the bibles' `##` headings. Today the index is maintained by hand → drift is guaranteed as bibles evolve.
- [ ] **`scripts/update-stats.js`** — auto-regenerate stats.json from `wc -l` on the content files. Runs in CI.
- [ ] **`.github/workflows/ci.yml`** — link checker, markdown lint, stats regen on push. Signals "actively maintained" to potential buyers.
- [ ] **Visual examples gallery** (`examples/`) — each example = screenshot before + screenshot after + the exact section of the bible that drove the change. 10-15 high-impact pairs.

## Long-term — priority 4 (expansion)

- [ ] **New Deep Research bodies to consider** (run via the relevant `PROMPT_DEEP_RESEARCH_*.md`):
  - Pricing pages & paywall UX (subscription, trial-to-paid, churn reduction) — extends WEB AA / MOBILE AE. Aligned with author's own monetization effort.
  - AAA accessibility + cognitive (dyslexia, autism, ADHD) deep-dive — extends WEB BR / MOBILE AQ.
  - Enterprise / admin-heavy UX (RBAC UI, audit logs, SSO flows, tenant switching) — optional, not core to indie target.
  - Gaming / F2P monetization UX (energy, gacha, level design) — listed in `PROMPT_DEEP_RESEARCH_MASSIVE.md` but not integrated yet.
  - Content moderation / trust & safety UX.

## Known limitations

- **Encoding style is split** — some files (COMMANDES, DESIGN_TREE, mostly WEARABLE) are ASCII-only by author choice. WEB and MOBILE use full accented French. This is intentional, not a bug.
- **The 7 source PDFs have unverified copyright** — blocks paid distribution until reviewed. See [_sources/SOURCES.md](_sources/SOURCES.md).
- **DESIGN_TREE.md index is hand-maintained** — drift from bibles will happen silently until a build script replaces the manual version.
- **No test suite for link validity** — CI action would catch broken cross-references but isn't set up yet.

---

## How to contribute changes

1. Read [prompts/README.md](prompts/README.md) first — understand which prompt applies.
2. For new content, invoke [prompts/PROMPT_MASTER.md](prompts/PROMPT_MASTER.md) in your assistant to apply bible-ux rules to your own project.
3. For DR-based bulk additions, use [prompts/PROMPT_INTEGRATION_DEEP_RESEARCH.md](prompts/PROMPT_INTEGRATION_DEEP_RESEARCH.md).
4. Always update [stats.json](stats.json) and [CHANGELOG.md](CHANGELOG.md) after a meaningful change.
5. Respect the license split — see [LICENSE.md](LICENSE.md).
