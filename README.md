# Bible UX

Comprehensive UX reference bibles for building apps across web, mobile, and wearable platforms.

**Usage:** Clone this repo into any project and tell Claude/AI to use it as UX reference.

```
git clone https://github.com/sky1241/bible-ux.git ux_resources
```

Then in your prompt: *"Use the UX bibles in ux_resources/ for all design decisions."*

## Contents

| File | Platform | Lines | Sections | Description |
|------|----------|-------|----------|-------------|
| [WEB.md](WEB.md) | Web | 15,669 | 107 (A-CW) | Web UX patterns, CSS, accessibility, WCAG |
| [MOBILE.md](MOBILE.md) | Mobile | 15,508 | 105 (A-CZ) | iOS + Android, Material Design, HIG |
| [WEARABLE.md](WEARABLE.md) | Wearable | 13,132 | 76 (A-BX) | Wear OS, watchOS, Samsung, Garmin |
| [ICONS.md](ICONS.md) | All | 307 | 29 (A-F) | App icon design, adaptive icons, A/B testing |
| [DESIGN_TREE.md](DESIGN_TREE.md) | All | ~510 | Index | Decision tree + cross-reference index |

**Total: ~45,000 lines, 317 sections, 55+ sources**

## Key sections for quick reference

| Topic | Web | Mobile | Wearable |
|-------|-----|--------|----------|
| Colors | CP | CR | 29 |
| Buttons | CR | CS | B |
| Shadows | CS | CT | E |
| Spacing | CQ | CW | 8 |
| Touch targets | — | CS | B |
| Typography | — | — | 14 |
| OLED/Dark mode | — | — | E, 29 |

## Supporting files

- `prompts/` — Design audit prompts (screenshot-to-pro workflow)
- `_sources/` — Raw research sources
- `COMMANDES.txt` — Quick command reference
- `TODO_MONETISATION.txt` — Monetization notes

## Sources

Compiled from 2024-2026 research including:
- Google Material Design 3
- Apple Human Interface Guidelines
- Samsung One UI
- W3C WCAG 2.2
- Nielsen Norman Group
- AppTweak, SplitMetrics, StoreMaven (ASO data)
- Android Developers, Apple Developer docs

## License

Personal use. Do not redistribute.
