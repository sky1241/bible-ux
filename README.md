# Bible UX

> **45,000+ lines of sourced UX rules across Web, Mobile, Wearable — ready to drop into any project so your AI assistant designs like a senior.**
> Built from 2024–2026 research (Apple HIG, Material 3, WCAG 2.2, NN/g, Baymard, AppTweak, SplitMetrics). Every rule has concrete values. Every value has a source.

[![Content](https://img.shields.io/badge/lines-45%2C831-blue)]()
[![Sections](https://img.shields.io/badge/sections-317-green)]()
[![Freshness](https://img.shields.io/badge/fresh-2024--2026-orange)]()
[![License](https://img.shields.io/badge/license-dual%20MIT%20%2B%20EULA-lightgrey)](LICENSE.md)

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
| [WEB.md](WEB.md) | Web | 15,669 | 107 (A → CW) | CSS 2025, WCAG 2.2, PWA, Core Web Vitals, Popover API, View Transitions, WebNN, Privacy Sandbox |
| [MOBILE.md](MOBILE.md) | iOS + Android | 15,508 | 105 (A → CZ) | HIG + Material 3, iOS 19 Liquid Glass, Apple Intelligence, Android 16 edge-to-edge, Material You Expressive, Passkeys, Baymard checkout |
| [WEARABLE.md](WEARABLE.md) | Smartwatch | 13,132 | 76 (A → BX) | Wear OS 5, watchOS 12, OLED + round screens, complications, Sleep Apnea, Ultra 2 features, Gemini + Apple Intelligence on watch |
| [ICONS.md](ICONS.md) | All | 306 | 6 major (29 subsections) | Android adaptive, Apple templates, Play Store, A/B data (up to +25% conversion), CVD accessibility, 2026 trends |
| [DESIGN_TREE.md](DESIGN_TREE.md) | All | 1,216 | index | Decision tree + ~510-entry cross-reference index across all bibles |
| [VALUES.md](VALUES.md) | All | — | — | **Single source of truth** for every canonical number (touch, spacing, contrast, timing, breakpoints) |

## Architecture

```
bible-ux/
  WEB.md                          # Web UX bible (sections A → CW)
  MOBILE.md                       # Mobile UX bible (sections A → CZ)
  WEARABLE.md                     # Wearable UX bible (sections A → BX)
  ICONS.md                        # App icon design bible (sections A → F)
  DESIGN_TREE.md                  # Cross-platform decision tree
  VALUES.md                       # Canonical numeric source of truth
  CHANGELOG.md                    # Version history
  LICENSE.md                      # Dual license (MIT + commercial EULA)

  prompts/                        # AI workflow prompts (all MIT)
    PROMPT_DESIGN_AUDIT.md        #   Screenshot → pro design critique (7 sins + 12 axes)
    PROMPT_CSSFIX.md              #   Labelled-zones CSS fix workflow
    PROMPT_REPRISE.md             #   Autonomous / fatigue-mode resume
    PROMPT_INTEGRATION_DEEP_RESEARCH.md  # Integrate DR results without duplicates
    PROMPT_DEEP_RESEARCH_MASSIVE.md      # Universal UX DR (~100 pages)
    PROMPT_DEEP_RESEARCH_WEARABLE.md     # Smartwatch DR (~170 pages)
    PROMPT_DEEP_RESEARCH_XR.md           # Spatial computing + smart glasses DR (~150 pages)
    PROMPT_TEST_CREATIF.md        #   Creative mode (bypass rule-citation)

  _sources/                       # Raw research PDFs (2024–2026)
    01_spacing.pdf  02_colors.pdf  03_wcag_rules.pdf
    04_patterns_2024.pdf  05_patterns_2026.pdf
    06_mobile_values.pdf  07_premium_feel.pdf

  COMMANDES.txt                   # French command cheat-sheet
  TODO_MONETISATION.txt           # Author's monetization plan
  .winter-tree-stats.json         # Repo metadata snapshot
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
Content lines:  45,831    (WEB + MOBILE + WEARABLE + DESIGN_TREE + ICONS)
Repo lines:    ~49,500    (+ prompts, VALUES, meta files)
Total sections: 317       (107 web + 105 mobile + 76 wearable + 29 icon)
Total sources:   55+
Platforms:       Web + iOS + Android + Wear OS + watchOS + Garmin Connect IQ
Freshness:       2024–2026 (CSS 2025, iOS 19 Liquid Glass, Android 16, watchOS 12)
```

## Versioning & roadmap

See [CHANGELOG.md](CHANGELOG.md) for the full history. Current version: **1.0.0**.

**Planned:**
- `XR.md` — spatial computing + smart glasses bible (Vision Pro, Meta Quest, Android XR, Ray-Ban Meta, Xreal). Deep Research prompt already in [prompts/PROMPT_DEEP_RESEARCH_XR.md](prompts/PROMPT_DEEP_RESEARCH_XR.md).
- Visual before/after examples (see [TODO_MONETISATION.txt](TODO_MONETISATION.txt)).

## License

**Dual license** — see [LICENSE.md](LICENSE.md) for the full terms.

| Part | License | Summary |
|------|---------|---------|
| `prompts/**`, `DESIGN_TREE.md`, `VALUES.md`, `COMMANDES.txt`, `README*.md`, `CHANGELOG.md`, `.winter-tree-stats.json` | **MIT** | Free to use, fork, modify, redistribute. |
| `WEB.md`, `MOBILE.md`, `WEARABLE.md`, `ICONS.md`, `_sources/**` | **Commercial EULA** | Personal use only. No redistribution. Paid licenses available. |

Commercial licenses available on request (open a GitHub issue or email the author).

---

Built by [sky1241](https://github.com/sky1241) — a solo indie dev who got tired of AI-generated UIs that ignore 20 years of research.
