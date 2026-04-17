# Changelog

All notable changes to `bible-ux` are documented here.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to semantic-ish versioning (major = content restructure, minor = new sections, patch = fixes).

---

## [Unreleased] — Infra tooling + folder restructure + prompt system v1.4 + tokens export + XR bible + routing + cleanup

### Added — Sprint 4 VISION (v1.8): 6 coverage prompts

Six new prompts shipped in one batch, each following the v1.4 standard (WHEN / WHEN NOT / TRIGGER / PARAMS / frontmatter YAML / CHAIN footer):

- **`prompts/PROMPT_A11Y_AUDIT.md`** (~200 lines) — dedicated WCAG 2.2 audit. Automated grid (13 axe-core rules) + manual checks (keyboard, screen reader VoiceOver/NVDA/TalkBack, cognitive, platform specific). Bug severity matrix P0/P1/P2/P3 with compliance score. Params: `quick`, `aaa`, `cognitive`, `mobile`, `xr`. Referenced bibles § F/AQ/BK/BR + VALUES contrast/focus/touch.
- **`prompts/PROMPT_UX_WRITING.md`** (~240 lines) — microcopy audit/fix. 8 rules (buttons as action verbs, error formula "quoi+pourquoi+comment", empty states encouraging, success short, tooltips ≤1 line, push notif titles ≤50 chars, onboarding 1-idea-per-screen, placeholder ≠ label) + tone matrix by audience + i18n prep (text expansion 30%, RTL, plurals, variables). Params: `quick`, `tone`, `i18n`.
- **`prompts/PROMPT_MIGRATE_TO_BIBLE.md`** (~190 lines) — migration plan from existing project to bible-ux alignment. 5-dimension gap analysis (tokens, components, states coverage, a11y, wording). 4-phase roadmap (Foundation, Core Components, States Coverage, A11y + Polish) with effort estimates per phase. Params: `quick`, `aggressive`, `minimum`.
- **`prompts/PROMPT_DEVILS_ADVOCATE.md`** (~180 lines) — attacks a design decision BEFORE ship. 3-axis attack (research contre from NN/g/Baymard/CHI, anti-patterns bible-ux, 5+ edge cases). Proposes 1 credible alternative. Verdict clear (risked/defendable/tenable). Concedes if user argues back with evidence. Real examples included.
- **`prompts/PROMPT_GROWTH_UX.md`** (~230 lines) — ethical growth patterns. 4 pillars (activation "time-to-value <60s", retention "streaks +3.6x retention guardrails", referral "K-factor timing", monetization "paywall timing"). Cross-links to DARK_PATTERN_DETECTOR for the ethical line. Params: `onboarding`, `retention`, `referral`, `monetization`, `ethics`.
- **`prompts/PROMPT_DARK_PATTERN_DETECTOR.md`** (~260 lines) — scans 17 Brignull-taxonomy dark patterns (confirmshaming, misdirection, sneak into basket, hidden costs, forced continuity, roach motel, privacy Zuckering, fake scarcity/urgency/social proof, nagging, obstruction, forced action…). Checks EU Dark Patterns in Subscriptions Act 2024 + FTC 2022 compliance. Params: `quick`, `subscription`, `consent`.

Router + MASTER updated:
- `prompts/README.md` routing table extended with 6 new rows
- `prompts/PROMPT_MASTER.md` routing table + initialization message updated (15 prompts announced total)

Net effect:
- Prompts total: 13 → 19 (+6)
- Prompt lines: 5319 → 6823 (+1504 for 6 new prompts)
- 177 links checked, 0 broken
- stats.json regenerated via update-stats.sh (53 total files)

ROADMAP: Sprint 4 of VISION.md fully shipped. Remaining on roadmap: Sprint 2 (parameters — partially done inline, explicit feedback protocol TBD), Sprint 3 (project memory + self-audit meta-prompt), Long-term DR extensions (pricing, AAA a11y, enterprise, gaming).

---

### Added — Sprint 1 VISION (v1.7): fragments + compression + frontmatter + CHAIN
- **`prompts/_fragments/` created** with 5 reusable fragments + README. Lever 6 of VISION.md. Each fragment is standalone, short (< 120 lines), and referenced by multiple prompts:
  - `7-sins.md` (92 lines) — the 7 noob sins detection + fix recipe (used by DESIGN_AUDIT)
  - `12-axes.md` (105 lines) — 12-axis technical audit grid with bible refs (used by DESIGN_AUDIT)
  - `states-coverage.md` (65 lines) — 8 states every screen must cover with framework snippets (used by SPEC, AUDIT, CODE_REVIEW)
  - `report-p0-p1.md` (118 lines) — P0/P1/P2/P3 bug report template (used by DESIGN_AUDIT, CODE_REVIEW)
  - `chain-footer.md` (53 lines) — standardized CHAIN block format + global chain graph
- **PROMPT_DESIGN_AUDIT.md compressed 935 → 205 lines (−78 %)** via fragment references. Lever 1 of VISION.md. Ready-to-copy palette/typo/spacing tables removed from the prompt since they live canonically in VALUES.md. Params documented (`audit quick`, `audit`, `audit deep`, `audit a11y`, `audit conv`). Quick Wins section added at the end of the report format.
- **YAML frontmatter added to all 13 prompts.** Lever 2 of VISION.md. Each prompt declares `prompt`, `version`, `updated`, `authors`, `chains_from`, `chains_to`, `trigger_aliases`. Enables per-prompt CHANGELOG via git log on frontmatter.
- **CHAIN footer standardized on all routing-capable prompts.** Lever 4 of VISION.md. 4 prompts received the footer (CSSFIX, REPRISE, TOKENS_EXPORT, INTEGRATION_DR); the others already had explicit chain documentation.
- Net effect on prompt total: 6251 → 5319 lines (−932, −15 %) across 13 prompts + 433 lines of fragments shared across prompts.

### Added — Infra tooling (v1.6)
- **`scripts/check-links.sh`** — walks every `.md` and verifies every `](path)` link resolves. Skips external URLs, fenced code blocks, inline backticks, and angle-bracketed placeholders. Exits 1 on broken. Runs clean now (76 links / 0 broken).
- **`scripts/update-stats.sh`** — regenerates `stats.json` from `wc -l` on actual files. Keeps metadata stable (version, platforms, formats). Runnable locally and in CI.
- **`.github/workflows/ci.yml`** — GitHub Actions workflow with 3 jobs: `check-links` (fails on broken link), `check-stats-fresh` (fails if stats.json drifts from reality), `markdown-lint` (soft for now, to be tightened once bibles curated).
- **Fixed** two legitimate broken links in `bibles/XR.md` (`](VALUES.md)` → `](../VALUES.md)`, same for DESIGN_TREE.md) discovered by the new link checker.

### Changed — `COMMANDES.txt` → `COMMANDES.md`
- Converted to proper markdown (headings, tables, links). Renders on GitHub now, consistent with the other meta files. Content refreshed to reflect all 13 current prompts + the MASTER primer workflow.
- References updated in README.md, LICENSE.md, stats.json, ROADMAP.md, prompts/README.md, prompts/PROMPT_MASTER.md.

### Changed — Folder restructure (structure_version 2)

### Changed — Folder restructure (structure_version 2)
- **Moved the 5 platform bibles into `bibles/` subfolder.** Was flat at root (`WEB.md`, `MOBILE.md`, `WEARABLE.md`, `XR.md`, `ICONS.md`); now nested (`bibles/WEB.md`, `bibles/MOBILE.md`, `bibles/WEARABLE.md`, `bibles/XR.md`, `bibles/ICONS.md`). Cleaner tree at root: 11 `.md` files → 7.
- **Meta + navigation files stay at root**: `README.md`, `CHANGELOG.md`, `LICENSE.md`, `ROADMAP.md`, `COMMANDES.txt`, `stats.json`, `.gitignore`, `DESIGN_TREE.md`, `VALUES.md`.
- **116 cross-references updated across 18 files** (markdown links `](WEB.md)` → `](bibles/WEB.md)`, backtick quoted paths `` `WEB.md` `` → `` `bibles/WEB.md` ``, from-prompts paths `](WEB.md)` → `](../bibles/WEB.md)`).
- **Inter-bible refs stay short** (`[MOBILE.md § CJ](MOBILE.md)` inside `bibles/XR.md`) since all bibles are in the same folder.
- **stats.json bumped `structure_version: 2`** and all `content_files` / `sections_by_bible` keys updated to the new paths.
- **README.md architecture tree** rewritten to show the new structure with the extra prompts (MASTER, PICK_PATTERN, SPEC_FROM_SCRATCH, CODE_REVIEW, TOKENS_EXPORT, VISION) listed.
- **LICENSE.md scope** updated: the EULA scope list now reads `bibles/WEB.md`, `bibles/MOBILE.md`, etc.
- Zero broken links after the move (verified by grep: no naked bible refs remaining outside the `bibles/` prefix).



### Added — 3 new workflow prompts + vision document
- **`prompts/PROMPT_PICK_PATTERN.md`** (179 lines) — "I have X → which pattern?". 8 decision tables (navigation, overlay, list/table, form, feedback, onboarding, loading/empty/error, XR-specific). Max 2 recommendations + 1 anti-pattern per case. Claude routes to MASTER for implementation on "go". Trigger verbs: "quel pattern", "quelle nav", "tab ou drawer".
- **`prompts/PROMPT_SPEC_FROM_SCRATCH.md`** (246 lines) — describe-app-in-2-sentences → complete design spec (tokens + nav + components v0 + user flows + priority-ordered screens + states coverage + a11y baseline + risks / open questions). 8-question discovery phase capped, with documented safe defaults. Chain-aware (routes to TOKENS_EXPORT / MASTER / DESIGN_AUDIT). Trigger verbs: "spec mon app", "from scratch", "nouveau projet".
- **`prompts/PROMPT_CODE_REVIEW.md`** (208 lines) — diff / PR / snippet review with P0/P1/P2/P3 priority buckets. 8-category grid (touch, contrast, focus, spacing, states, semantic, motion, platform-specific). Before/after code pairs for every P0/P1. Framework-specific red-flag examples (CSS, React/Tailwind, SwiftUI, Compose, XR/visionOS). No flattering, direct on problems. Trigger verbs: "review code", "review ce diff", "audit mon code".
- **`prompts/VISION.md`** (285 lines) — prompt system v2.0 roadmap. Honest self-assessment of what works and what doesn't. Documents 10 improvement levers (compression, versioning, parameterization, chain formalization, project memory, shared fragments, self-audit meta-prompt, feedback loop, adversarial mode, missing prompts) with a 4-sprint execution plan. Not a prompt itself — a design doc for where the system goes next.

### Added — Tokens export (monetization killer feature)
- **`prompts/PROMPT_TOKENS_EXPORT.md`** (835 lines) — generates importable design tokens from VALUES.md in **8 formats**: CSS custom properties, Tailwind config, Flutter ThemeData + Material 3 theme, SwiftUI theme (incl. visionOS), iOS UIKit, Kotlin Compose theme, Android XML resources (dimens / integers / styles), Figma Tokens JSON (Tokens Studio format). Transforms the bible from "doc to read" into "config to import". Trigger verbs: "export tokens", "seed design system", "génère les tokens [format]". Added to PROMPT_MASTER routing table.
- `prompts/README.md` — router updated with all 4 new branches (tokens, pick-pattern, spec-from-scratch, code-review) + VISION link.
- `prompts/PROMPT_MASTER.md` — routing table + initialization message updated to include the 4 new prompts.


### Added — XR / Spatial Computing
- **`bibles/XR.md`** — new 4th platform bible (842 lines, 14 sections A → N, 54 subsections). Covers **Vision Pro**, **Meta Quest 3 / 3S**, **Samsung Galaxy XR**, **Pico 4**, **HTC Vive Focus Vision**, **Varjo XR-4**, **PlayStation VR2**, **Bigscreen Beyond 2**, **Shiftall MeganeX**, and smart glasses (**Ray-Ban Meta**, **XREAL Air/One/Beam**, **VITURE Luma Pro**, **Rokid Max 2**, **RayNeo X3 Pro**, **Halliday**, **Snap Spectacles 5**). Sections cover hardware baselines, spatial UI metrics (angular sizing, FOV safe zones, reading geometry), input (gaze+pinch / hand tracking / ray / voice / controllers / text entry), locomotion and motion sickness, passthrough + anchors + persistence, spatial audio APIs, performance (frame rate floors, GPU budgets), privacy (eye data, biometrics, spatial data permissions, child safety), accessibility XR, frameworks (visionOS, Meta Presence Platform, Android XR, WebXR, OpenXR 1.1), prototyping without hardware, smart glasses specifics, strategic answers (best indie platform 2026, emerging cross-platform conventions, FOV for immersion, visionOS vs Horizon OS divergences, glasses-vs-headset horizon 2028), valeurs clés memo. Sourced from ChatGPT Deep Research baseline 2026-04-17 with **76 primary citations** (Apple HIG, Meta dev docs, Android XR docs, Samsung, Sony, Khronos, CHI/arXiv papers, vendor product pages).
- Cross-reference added in [MOBILE.md § CJ](bibles/MOBILE.md) pointing to XR.md as the full cross-platform source.
- [ROADMAP.md](ROADMAP.md) — new file documenting planned work, priority-ordered.

### Added — Prompts routing + infra
- `prompts/README.md` — **routing guide** (ASCII flowchart + situation→prompt table). Solves "which prompt do I use when?" problem.
- `prompts/PROMPT_MASTER.md` — **context primer** to paste at the start of a new Claude/GPT session. Auto-routes to other prompts via verbal triggers. Establishes strict reference hierarchy (VALUES > bibles > DESIGN_TREE > prompts).
- `.gitignore` — standard ignore (OS files, editors, env, local-only drafts, large binaries).
- `_sources/SOURCES.md` — inventory of the 7 research PDFs with copyright-status field (author action required before commercial distribution).
- `VALUES.md` — centralized source of truth for all canonical numbers (touch, spacing, contrast, timings, breakpoints, gamification, tables, checkout, icons).
- `LICENSE.md` — dual license (MIT for prompts/index/VALUES/README, commercial EULA for the bibles + sources).
- `CHANGELOG.md` — Keep-a-Changelog format.
- `prompts/PROMPT_DEEP_RESEARCH_XR.md` — 1,011-line DR prompt covering Vision Pro, Meta Quest, Android XR, WebXR, smart glasses (Ray-Ban Meta, Xreal, Samsung Galaxy Glasses, Halliday). 15 parts: hardware, spatial design, input, UI patterns, passthrough, spatial audio, motion sickness, performance, privacy, accessibility, dev frameworks, multi-user, smart glasses, emerging, anti-patterns.

### Changed
- `prompts/PROMPT_REPRISE.md` — **426 → 268 lines.** Removed all `infernal_wheel`-specific content (Dashboard.Page.ps1, port 8011, protected JS IDs). Now fully generic and reusable on any project. Project-specific variants should live in the project, not here.
- Every existing prompt received a **`## WHEN / ## WHEN NOT / ## TRIGGER VERBAL`** block at the top, standardized across the 8 prompts. This makes discovery possible without reading the whole file.
- `.winter-tree-stats.json` → **`stats.json`**. Renamed for clarity (the old name referenced a private tool). Content regenerated with v1.1.0 structure (explicit prompts inventory, sources status, meta files, license reference).
- `README.md` — polished monetization-ready version (hook, badges, roadmap, dual license surfaced, VALUES.md + XR prompt referenced).
- `COMMANDES.txt` — removed broken ref to `PROMPT_CALENDRIER_CREATIF.md`, added missing prompts, fixed stale path (`.infernal_wheel/ux_resources` → `bible-ux`), date bumped.

### Removed
- `TODO_MONETISATION.txt` **removed from public repo** (was leaking the author's business plan to potential buyers). File is preserved locally on the author's machine and now listed in `.gitignore`.

### Fixed
- README.md stats reconciled: `ICONS 307 → 306 lines`, sections clarified (`29 → 6 major / 29 subsections`), total content lines `45,888 → 47,021` (new totals after VALUES.md + XR.md additions).

---

## [1.0.0] — 2026-04-06

### Added
- Public release. Repository extracted from the private `infernal_wheel` project into a standalone, plug-and-play UX knowledge base.
- Polished `README.md` with architecture tree, quick reference table, sources table, and stats.
- `.winter-tree-stats.json` metadata (phase: STABLE, 22 files, 52,967 lines).

### Content baseline at 1.0.0
| File | Lines | Sections |
|------|------:|---------:|
| WEB.md | 15,669 | 107 (A → CW) |
| MOBILE.md | 15,508 | 105 (A → CZ) |
| WEARABLE.md | 13,132 | 76 (A → BX) |
| DESIGN_TREE.md | 1,216 | — (index) |
| ICONS.md | 306 | 6 (A → F) |

### Coverage
- **Web** — CSS/WCAG 2.2 fundamentals through CSS 2025 (@scope, :has, anchor positioning, @starting-style, cascade layers, View Transitions, Popover API, Speculation Rules), PWA, Core Web Vitals, AI/WebNN, Privacy Sandbox.
- **Mobile** — iOS HIG + Material 3 fundamentals through iOS 19 Liquid Glass, Apple Intelligence, Android 16, Material You Expressive, Passkeys, Baymard checkout research.
- **Wearable** — Wear OS 5 + watchOS 11 fundamentals through watchOS 12 / Apple Intelligence on watch, Wear OS 5 power efficiency, Garmin Connect IQ, Sleep Apnea detection, Ultra 2 features, AI assistants 2025.
- **Icons** — Android adaptive, Apple templates + Icon Composer, Play Store + App Store + Samsung + Huawei specs, A/B testing data (up to +25% conversion), CVD accessibility, 2024-2026 trends.

### Prompts bundled
- `PROMPT_REPRISE.md` — autonomous / fatigue-mode workflow.
- `PROMPT_CSSFIX.md` — labelled-zones CSS fix flow.
- `PROMPT_DESIGN_AUDIT.md` — 7 noob sins + 12-axis audit + ready-to-copy design system.
- `PROMPT_DEEP_RESEARCH_MASSIVE.md` — universal UX Deep Research prompt (~100 pages target).
- `PROMPT_DEEP_RESEARCH_WEARABLE.md` — smartwatch Deep Research prompt (~170 pages target).
- `PROMPT_INTEGRATION_DEEP_RESEARCH.md` — workflow for integrating DR results without duplicates.
- `PROMPT_TEST_CREATIF.md` — minimal prompt for bypassing rule-citation mode.

### Sources bundled
Seven original research PDFs under `_sources/` covering spacing, colors, WCAG 2.2, 2024 patterns, 2026 patterns, mobile values, premium feel.

---

## [0.x] — Pre-extraction history (inside `infernal_wheel`)

Before public release, the knowledge base evolved inside the private `infernal_wheel` dashboard project as `ux_resources/`. Major milestones (not individually versioned):

- **Early 2026** — consolidation of the three bibles from the research PDFs.
- **Feb 2026** — first stable cross-reference index (`DESIGN_TREE.md`).
- **Mar 2026** — completion of WEB Section W-CW (CSS 2025, PWA, advanced patterns, AI).
- **Mar 2026** — completion of MOBILE Section AA-CZ (deep linking, widgets, Live Activities, iOS 19, Android 16).
- **Mar 2026** — completion of WEARABLE Section AC-BX (cross-device handoff, health APIs, AI assistants).
- **Apr 2026** — extraction into this standalone repo and 1.0.0 release.
