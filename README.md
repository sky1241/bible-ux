# Bible UX

> 45,000+ lines of UX rules across Web, Mobile, and Wearable.
> Built from 2024-2026 research. Ready to plug into any project.

## Quick start

```bash
# Clone into your project
git clone https://github.com/sky1241/bible-ux.git ux_resources

# Tell your AI assistant
"Use the UX bibles in ux_resources/ for all design decisions."
```

## Bibles

| File | Platform | Lines | Sections | What's inside |
|------|----------|------:|----------|---------------|
| [WEB.md](WEB.md) | Web | 15,669 | 107 | CSS, WCAG 2.2, accessibility, patterns, responsive |
| [MOBILE.md](MOBILE.md) | iOS + Android | 15,508 | 105 | Material 3, HIG, touch targets, navigation, gestures |
| [WEARABLE.md](WEARABLE.md) | Smartwatch | 13,132 | 76 | Wear OS, watchOS, OLED, round screens, complications |
| [ICONS.md](ICONS.md) | All | 307 | 29 | Adaptive icons, color psychology, A/B testing, Play Store |
| [DESIGN_TREE.md](DESIGN_TREE.md) | All | 1,216 | — | Decision tree + cross-reference index across all bibles |

## Architecture

```
bible-ux/
  WEB.md                    # Web UX bible (sections A → CW)
  MOBILE.md                 # Mobile UX bible (sections A → CZ)
  WEARABLE.md               # Wearable UX bible (sections A → BX)
  ICONS.md                  # App icon design bible (sections A → F)
  DESIGN_TREE.md            # Cross-platform decision tree

  prompts/                  # AI design audit prompts
    PROMPT_DESIGN_AUDIT.md  # Screenshot → pro design critique
    PROMPT_CSSFIX.md        # CSS fix workflow
    PROMPT_DEEP_RESEARCH_*  # Deep research templates
    PROMPT_INTEGRATION_*    # Integration workflows
    PROMPT_REPRISE.md       # Session resume prompt
    PROMPT_TEST_CREATIF.md  # Creative testing

  _sources/                 # Raw PDF research (2024-2026)
    01_spacing.pdf          # Spacing system (4px base)
    02_colors.pdf           # Color theory + HSB
    03_wcag_rules.pdf       # WCAG 2.2 complete
    04_patterns_2024.pdf    # UX behavioral patterns
    05_patterns_2026.pdf    # Updated patterns
    06_mobile_values.pdf    # Mobile-specific values
    07_premium_feel.pdf     # Premium design patterns
```

## Quick reference

Find what you need fast:

| Topic | Web | Mobile | Wearable |
|-------|:---:|:------:|:--------:|
| Colors & palettes | CP | CR | 29 |
| Buttons & CTAs | CR | CS | B |
| Shadows & elevation | CS | CT | E |
| Spacing system | CQ | CW | 8 |
| Touch targets | — | CS | B |
| Typography | — | — | 14 |
| Dark mode / OLED | — | — | E, 29 |
| Accessibility | WCAG | WCAG | — |
| Navigation | — | CU | AW |
| Forms & inputs | — | CV | — |
| Icons | ICONS A-F | ICONS A-F | ICONS A-F |

## Sources

| Source | Type | Year |
|--------|------|------|
| Google Material Design 3 | Guidelines | 2024-2026 |
| Apple Human Interface Guidelines | Guidelines | 2024-2026 |
| Samsung One UI | Guidelines | 2024-2026 |
| W3C WCAG 2.2 | Standard | 2024 |
| Nielsen Norman Group | Research | 2024-2025 |
| AppTweak | ASO data | 2024-2025 |
| SplitMetrics | A/B testing | 2024-2025 |
| StoreMaven | Store optimization | 2024 |
| Android Developers | Documentation | 2024-2026 |
| Apple Developer | Documentation | 2024-2026 |

## Stats

```
Total lines:    45,888
Total sections: 317
Total sources:  55+
Platforms:      Web + iOS + Android + Wear OS + watchOS + Garmin
Freshness:      2024-2026 (CSS 2025, Android 16, watchOS 12)
```

## License

Personal use. Do not redistribute.
