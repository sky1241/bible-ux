# Roadmap

> What's planned, in priority order. Tick items as they ship and move them to [CHANGELOG.md](CHANGELOG.md).

Current version: **1.2.0-unreleased** (see [stats.json](stats.json)).

---

## Recently shipped (unreleased)

- [x] **Folder restructure — `bibles/` subfolder for the 5 platform bibles.** Moved WEB.md, MOBILE.md, WEARABLE.md, XR.md, ICONS.md into `bibles/`. Updated 116 cross-references in 18 files (markdown links + backtick quoted paths). DESIGN_TREE.md, VALUES.md, and all meta files (README, LICENSE, CHANGELOG, ROADMAP, stats.json, COMMANDES.md, .gitignore) remain at root as navigation entry points. Inter-bible refs stay short (`](XR.md)`) since all bibles are in the same folder now. stats.json bumped to `structure_version: 2`.
- [x] **PROMPT_PICK_PATTERN.md** (179 lines) — "I have X → which pattern?" with 8 decision tables (navigation, overlay, list/table, form, feedback, onboarding, loading/empty/error, XR-specific). Max 2 recommendations + 1 anti-pattern per case. Chain-aware (routes to MASTER for implementation).
- [x] **PROMPT_SPEC_FROM_SCRATCH.md** (246 lines) — describe-app-in-2-sentences → full spec (tokens + nav + components v0 + user flows + screens ordered by priority + states coverage + a11y baseline + risks). 8-question discovery phase capped, with documented safe defaults. Chain-aware.
- [x] **PROMPT_CODE_REVIEW.md** (208 lines) — diff / PR / snippet review with P0/P1/P2/P3 priority buckets. 8-category grid (touch, contrast, focus, spacing, states, semantic, motion, platform-specific). Before/after code pair for every P0/P1. Framework-specific red flags (CSS, React/Tailwind, SwiftUI, Compose, XR). Chain-aware.
- [x] **prompts/VISION.md** — v2.0 roadmap for the prompt system itself. Documents 10 improvement levers (compression, versioning, parameterization, chain formalization, project memory, shared fragments, self-audit, feedback loop, adversarial mode, missing prompts) and 4-sprint execution plan.
- [x] **PROMPT_TOKENS_EXPORT.md** (835 lines) — killer feature. 8 export formats: CSS, Tailwind, Flutter ThemeData, SwiftUI, iOS UIKit, Compose, Android XML, Figma Tokens JSON.
- [x] **XR.md** (842 lines) — 4th platform bible covering headsets + smart glasses, sourced from ChatGPT Deep Research with 76 citations.

## Now — in progress

_(nothing in progress — free slot)_

## Next — prompt system v2.0 (from VISION.md)

Priority-ordered sprints documented in [prompts/VISION.md](prompts/VISION.md):

### Sprint 1 — cleanup + structure ✅ SHIPPED
- [x] ~~Compress PROMPT_DESIGN_AUDIT.md from 935 → 300 lines~~ — done (935 → 205 lines, −78 %).
- [x] ~~Create `prompts/_fragments/` with 5 reusable fragments~~ — done (7-sins, 12-axes, states-coverage, report-p0-p1, chain-footer + README).
- [x] ~~Add YAML frontmatter versioning to every prompt~~ — done (13 prompts with version, updated, authors, chains_from, chains_to, trigger_aliases).
- [x] ~~Standardize a `## Chain` block at the end of every prompt~~ — done (4 missing prompts got the footer; others already had explicit chain docs).

### Sprint 2 — parameters + feedback
- [ ] Add params on DESIGN_AUDIT / CODE_REVIEW / SPEC (`audit quick`, `audit deep`, `audit a11y`, `review strict`, `review p0-only`, `spec rapide`, `spec exhaustive`)
- [ ] `prompts/FEEDBACK.md` + protocol for ✓/✗ logging after each prompt run

### Sprint 3 — project memory + self-audit
- [ ] Convention `.bible-ux/project.json` loaded by PROMPT_MASTER on startup (stack, targets, brand, a11y level)
- [ ] `PROMPT_META_AUDIT.md` scans bibles for contradictions, stale values, broken cross-refs, dead URLs. Quarterly run.

### Sprint 4 — coverage extensions
- [ ] `PROMPT_A11Y_AUDIT.md` — dedicated a11y audit (axe-core rules + manual pass)
- [ ] `PROMPT_UX_WRITING.md` — microcopy / ton / button labels
- [ ] `PROMPT_MIGRATE_TO_BIBLE.md` — audit existing project and produce migration plan
- [ ] `PROMPT_DEVILS_ADVOCATE.md` — attack a design decision before it ships
- [ ] `PROMPT_GROWTH_UX.md` — ethical growth patterns (onboarding, referral, retention)
- [ ] `PROMPT_DARK_PATTERN_DETECTOR.md` — flag dark patterns in a flow

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

- [x] ~~Restructure folders to `bibles/`~~ — **done** (the 5 bibles moved into `bibles/`). Further nesting (`meta/` for DESIGN_TREE + VALUES + stats, `_sources/` deeper, etc.) is **not needed** — current structure is clean enough.
- [ ] **`scripts/build-index.js`** — auto-generate DESIGN_TREE.md indexes from the bibles' `##` headings. Today the index is maintained by hand → drift is guaranteed as bibles evolve.
- [ ] **`scripts/update-stats.js`** — auto-regenerate stats.json from `wc -l` on the content files. Runs in CI.
- [ ] **`scripts/check-links.sh`** — walks all `.md` files and verifies every `](path)` resolves. Run locally + in CI.
- [ ] **`.github/workflows/ci.yml`** — link checker, markdown lint, stats regen on push. Signals "actively maintained" to potential buyers.
- [ ] **`prompts/_fragments/`** — extract the reusable chunks (the 7 sins, 12 axes, P0/P1 format, states checklist, chain footer) so prompts can reference fragments instead of duplicating (VISION.md lever 6).
- [ ] **Visual examples gallery** (`examples/`) — each example = screenshot before + screenshot after + the exact section of the bible that drove the change. 10-15 high-impact pairs.
- [ ] **Badge SVG auto-generated** — current README badges are static. Script to regen from stats.json so they stay accurate.

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
