# Changelog

All notable changes to `bible-ux` are documented here.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to semantic-ish versioning (major = content restructure, minor = new sections, patch = fixes).

---

## [Unreleased] — Prompt system v1.4 (pick-pattern, spec, code-review, vision) + tokens export + XR bible + routing + cleanup

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
- **`XR.md`** — new 4th platform bible (842 lines, 14 sections A → N, 54 subsections). Covers **Vision Pro**, **Meta Quest 3 / 3S**, **Samsung Galaxy XR**, **Pico 4**, **HTC Vive Focus Vision**, **Varjo XR-4**, **PlayStation VR2**, **Bigscreen Beyond 2**, **Shiftall MeganeX**, and smart glasses (**Ray-Ban Meta**, **XREAL Air/One/Beam**, **VITURE Luma Pro**, **Rokid Max 2**, **RayNeo X3 Pro**, **Halliday**, **Snap Spectacles 5**). Sections cover hardware baselines, spatial UI metrics (angular sizing, FOV safe zones, reading geometry), input (gaze+pinch / hand tracking / ray / voice / controllers / text entry), locomotion and motion sickness, passthrough + anchors + persistence, spatial audio APIs, performance (frame rate floors, GPU budgets), privacy (eye data, biometrics, spatial data permissions, child safety), accessibility XR, frameworks (visionOS, Meta Presence Platform, Android XR, WebXR, OpenXR 1.1), prototyping without hardware, smart glasses specifics, strategic answers (best indie platform 2026, emerging cross-platform conventions, FOV for immersion, visionOS vs Horizon OS divergences, glasses-vs-headset horizon 2028), valeurs clés memo. Sourced from ChatGPT Deep Research baseline 2026-04-17 with **76 primary citations** (Apple HIG, Meta dev docs, Android XR docs, Samsung, Sony, Khronos, CHI/arXiv papers, vendor product pages).
- Cross-reference added in [MOBILE.md § CJ](MOBILE.md) pointing to XR.md as the full cross-platform source.
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
