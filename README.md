# Bible UX

> **45,000+ lines of sourced UX rules across Web, Mobile, Wearable — ready to drop into any project so your AI assistant designs like a senior.**
> Built from 2024–2026 research (Apple HIG, Material 3, WCAG 2.2, NN/g, Baymard, AppTweak, SplitMetrics). Every rule has concrete values. Every value has a source.

<!-- BADGES_START -->
[![Content](https://img.shields.io/badge/lines-47021-blue)]()
[![Sections](https://img.shields.io/badge/sections-331-green)]()
[![Version](https://img.shields.io/badge/version-1.9.0-unreleased-orange)]()
[![Freshness](https://img.shields.io/badge/fresh-2024--2026-orange)]()
[![License](https://img.shields.io/badge/license-dual%20MIT%20%2B%20EULA-lightgrey)](LICENSE.md)
<!-- BADGES_END -->

---

## 🟢 First time here?

- **30 seconds** → [START_HERE.md](START_HERE.md) — the one phrase to remember
- **5 minutes** → [USER_GUIDE.md](USER_GUIDE.md) — full walkthrough with 15 shortcuts, 3 example scenarios, troubleshooting, FAQ

**TL;DR :** in your Claude / ChatGPT / Gemini session, say **"use bible-ux for the design"** or paste a screenshot with **"c'est moche"**. The AI consults the rules automatically.

---

## Why this exists

When you ask an AI assistant to design a button, it gives you a button. When you ask it to design a button **with the bible-ux dropped in**, it gives you:

- The exact touch target for iOS / Android / Web / Wear OS / watchOS
- The correct WCAG contrast ratio and focus ring specs
- The animation timing (enter / exit / reduced motion)
- The correct hierarchy (primary vs. secondary vs. ghost vs. destructive)
- Platform-appropriate loading / empty / error states
- A checklist of anti-patterns to avoid
- A source link for every decision

That's the difference between "AI-generated" and "senior-reviewed".

## Quick start

```bash
# 1. Clone into your project as ux_resources/
git clone https://github.com/sky1241/bible-ux.git ux_resources

# 2. Tell your AI assistant (Claude, ChatGPT, Gemini, Cursor, Copilot...)
"Use the UX bibles in ux_resources/ for all design decisions.
 Start with DESIGN_TREE.md to identify the pattern, then drill into the relevant bible."

# 3. Done. Ask for a login screen, a checkout flow, a smartwatch tile — it will cite chapter and verse.
```

The prompts in `prompts/` give you ready-made workflows: design audit from a screenshot, CSS fix, integration of new Deep Research results, creative mode.

## What's inside

| File | Platform | Lines | Sections | What's inside |
|------|----------|------:|----------|---------------|
| [WEB.md](bibles/WEB.md) | Web | 15,669 | 107 (A → CW) | CSS 2025, WCAG 2.2, PWA, Core Web Vitals, Popover API, View Transitions, WebNN, Privacy Sandbox |
| [MOBILE.md](bibles/MOBILE.md) | iOS + Android | 15,508 | 105 (A → CZ) | HIG + Material 3, iOS 19 Liquid Glass, Apple Intelligence, Android 16 edge-to-edge, Material You Expressive, Passkeys, Baymard checkout |
| [WEARABLE.md](bibles/WEARABLE.md) | Smartwatch | 13,132 | 76 (A → BX) | Wear OS 5, watchOS 12, OLED + round screens, complications, Sleep Apnea, Ultra 2 features, Gemini + Apple Intelligence on watch |
| [XR.md](bibles/XR.md) | Headsets + Smart Glasses | ~870 | 14 (A → N) | Vision Pro, Meta Quest, Samsung Galaxy XR, Pico, Vive, Varjo, PSVR2, smart glasses (Ray-Ban Meta, XREAL, VITURE, Rokid, RayNeo, Halliday, Snap). Spatial UI, gaze+pinch, hand tracking, passthrough, motion sickness, OpenXR, WebXR, a11y XR |
| [ICONS.md](bibles/ICONS.md) | All | 306 | 6 major (29 subsections) | Android adaptive, Apple templates, Play Store, A/B data (up to +25% conversion), CVD accessibility, 2026 trends |
| [DESIGN_TREE.md](DESIGN_TREE.md) | All | 1,216 | index | Decision tree + ~510-entry cross-reference index across all bibles |
| [VALUES.md](VALUES.md) | All | — | — | **Single source of truth** for every canonical number (touch, spacing, contrast, timing, breakpoints) |

## Architecture

```
bible-ux/
  bibles/                         # The 5 platform bibles (commercial EULA)
    WEB.md                        #   Web UX bible (sections A → CW, 15669 lines)
    MOBILE.md                     #   Mobile UX bible (sections A → CZ, 15510 lines)
    WEARABLE.md                   #   Wearable UX bible (sections A → BX, 13132 lines)
    XR.md                         #   XR / spatial computing (sections A → N, 842 lines)
    ICONS.md                      #   App icon design (sections A → F, 306 lines)

  DESIGN_TREE.md                  # Cross-platform decision tree + index
  VALUES.md                       # Canonical numeric source of truth

  prompts/                        # AI workflow prompts (all MIT)
    README.md                     #   Router — start here if you're lost
    VISION.md                     #   Prompt system v2.0 roadmap
    PROMPT_MASTER.md              #   Context primer (paste once at session start)
    PROMPT_DESIGN_AUDIT.md        #   Screenshot → pro design critique
    PROMPT_CSSFIX.md              #   Labelled-zones CSS fix workflow
    PROMPT_TOKENS_EXPORT.md       #   VALUES.md → CSS / Tailwind / Flutter / ...
    PROMPT_PICK_PATTERN.md        #   "I have X → which pattern?"
    PROMPT_SPEC_FROM_SCRATCH.md   #   Describe app → full spec
    PROMPT_CODE_REVIEW.md         #   Review diff / PR with P0/P1/P2/P3
    PROMPT_REPRISE.md             #   Autonomous / fatigue-mode resume
    PROMPT_INTEGRATION_DEEP_RESEARCH.md  # Integrate DR results
    PROMPT_DEEP_RESEARCH_MASSIVE.md      # Universal UX DR (~100 pages)
    PROMPT_DEEP_RESEARCH_WEARABLE.md     # Smartwatch DR (~170 pages)
    PROMPT_DEEP_RESEARCH_XR.md           # Spatial computing DR (~150 pages)
    PROMPT_TEST_CREATIF.md        #   Creative mode (bypass rule-citation)

  _sources/                       # Raw research PDFs (copyright audit pending)
    SOURCES.md                    #   Inventory + copyright status
    01_spacing.pdf  02_colors.pdf  03_wcag_rules.pdf
    04_patterns_2024.pdf  05_patterns_2026.pdf
    06_mobile_values.pdf  07_premium_feel.pdf

  README.md                       # This file
  CHANGELOG.md                    # Version history (Keep a Changelog)
  LICENSE.md                      # Dual license (MIT + commercial EULA)
  ROADMAP.md                      # Planned work, priority-ordered
  COMMANDES.md                   # French command cheat-sheet
  stats.json                      # Repo metadata snapshot
  .gitignore
```

## Topic → section shortcut

Find what you need fast. Numbers are section codes; open the bible and jump.

| Topic | Web | Mobile | Wearable |
|-------|:---:|:------:|:--------:|
| Colors & palettes | CP | CR | 29 / AS |
| Buttons & CTAs | CR | CS | B |
| Shadows & elevation | CS | CT | E |
| Border radius | CO | CU | 8 |
| Spacing system | CQ | CW | 8 |
| Touch targets | F (WCAG) | CS | B |
| Typography | AP | A / B | D |
| Dark mode / OLED | S / AO | H | E / 29 |
| Animation & motion | U / BC | J / Z | I-bis / AR |
| Loading & skeleton | R / A | AZ | V |
| Empty states | A2 / O | Q | F |
| Forms & inputs | CN | L / CV | 7c |
| Navigation | B / AH | D | 9 |
| Icons (cross-platform) | ICONS | ICONS | ICONS |
| Gamification | N | W | F |
| Accessibility | F / AQ | AQ / BY | I / 22 |
| AI / chatbot | AO / CW | BZ / CY | BW / BX |
| Checkout (Baymard) | AA / AR-bis | BM / CQ | AL |

For the canonical list of numeric values — touch targets, WCAG contrast, animation timings, breakpoints, gamification thresholds — see [VALUES.md](VALUES.md). That file wins over any bible if a conflict is ever introduced.

## Sources

| Source | Type | Year |
|--------|------|------|
| Google Material Design 3 | Guidelines | 2024–2026 |
| Apple Human Interface Guidelines | Guidelines | 2024–2026 |
| Samsung One UI (phone + watch) | Guidelines | 2024–2026 |
| W3C WCAG 2.2 | Standard | 2024 |
| Nielsen Norman Group | Research | 2024–2025 |
| Baymard Institute | Checkout UX research | 2024–2025 |
| AppTweak | ASO data | 2024–2025 |
| SplitMetrics | A/B testing data | 2024–2025 |
| StoreMaven | Store optimization | 2024 |
| Android Developers | Documentation | 2024–2026 |
| Apple Developer | Documentation | 2024–2026 |
| Google Wear OS / Android XR | Documentation | 2024–2026 |

## Stats

```
Content lines:  47,021    (WEB + MOBILE + WEARABLE + XR + DESIGN_TREE + ICONS + VALUES)
Repo lines:    ~52,000    (+ prompts, meta files)
Total sections: 331       (107 web + 105 mobile + 76 wearable + 14 XR + 29 icon)
Total sources:   55+
Platforms:       Web + iOS + Android + Wear OS + watchOS + Garmin Connect IQ + Vision Pro + Meta Quest + Android XR + smart glasses
Freshness:       2024–2026 (CSS 2025, iOS 19 Liquid Glass, Android 16, watchOS 12, visionOS 26, Horizon OS v77/v78, Android XR 2025, OpenXR 1.1)
```

## Versioning & roadmap

See [CHANGELOG.md](CHANGELOG.md) for the full history. Current version: **1.0.0**.

**Planned:** see [ROADMAP.md](ROADMAP.md).

## License

**Dual license** — see [LICENSE.md](LICENSE.md) for the full terms.

| Part | License | Summary |
|------|---------|---------|
| `prompts/**`, `DESIGN_TREE.md`, `VALUES.md`, `COMMANDES.md`, `README*.md`, `CHANGELOG.md`, `stats.json` | **MIT** | Free to use, fork, modify, redistribute. |
| `bibles/WEB.md`, `bibles/MOBILE.md`, `bibles/WEARABLE.md`, `bibles/ICONS.md`, `_sources/**` | **Commercial EULA** | Personal use only. No redistribution. Paid licenses available. |

Commercial licenses available on request (open a GitHub issue or email the author).

---

Built by [sky1241](https://github.com/sky1241) — a solo indie dev who got tired of AI-generated UIs that ignore 20 years of research.
