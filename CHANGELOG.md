# Changelog

All notable changes to `bible-ux` are documented here.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to semantic-ish versioning (major = content restructure, minor = new sections, patch = fixes).

---

## [Unreleased]

### Added
- `prompts/PROMPT_DEEP_RESEARCH_XR.md` — 640-line Deep Research prompt covering Vision Pro, Meta Quest, Android XR, WebXR, and smart glasses (Ray-Ban Meta, Xreal, Samsung Galaxy Glasses, Halliday). 15 parts covering hardware, spatial design, input, UI patterns, passthrough, spatial audio, motion sickness, performance, privacy, accessibility, development frameworks, multi-user, smart glasses specifics, emerging tech, and anti-patterns.
- `LICENSE.md` — dual license (MIT for prompts/index, commercial EULA for the bibles).
- `CHANGELOG.md` — this file.

### Fixed
- README.md: ICONS line count `307 → 306`, sections clarified `29 → 6 major (29 subsections)`, total content lines `45,888 → 45,831`, repo total added (`~49,500`).
- COMMANDES.txt: removed broken reference to `PROMPT_CALENDRIER_CREATIF.md` (file never existed in the extracted repo). Added missing entries for WEARABLE.md, ICONS.md, PROMPT_DESIGN_AUDIT.md, PROMPT_DEEP_RESEARCH_WEARABLE.md, PROMPT_TEST_CREATIF.md. Fixed repository path (was still pointing to the original `.infernal_wheel/ux_resources/`). Date bumped to 2026-04-17.

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
