# VALUES.md — Source of Truth

> Canonical UX values cited across the repo. Every bible, prompt, and decision tree that references a concrete number **must point here** instead of duplicating.
> If you find a conflict between this file and another file in the repo, this file wins — and the other file is stale and should be fixed.

Last updated: **2026-04-17**

---

## Touch targets

| Platform | Minimum | Recommended | Source |
|----------|--------:|------------:|--------|
| iOS | 44×44 pt | 44×44 pt | Apple HIG |
| Android | 48×48 dp | 48×48 dp | Material 3 |
| Web (WCAG 2.2) | 24×24 px (SC 2.5.8 Target Size Minimum) | 44×44 px | W3C WCAG 2.2 |
| Wear OS | 48×48 dp | 52×52 dp | Google Wear OS |
| watchOS | 44×44 pt | 44×44 pt | Apple HIG |
| Watch with gloves | — | 56×56 dp | empirical community |
| Spacing between adjacent targets | — | ≥ 8 pt/dp | Apple HIG + Material |

---

## Spacing scale (4px base)

```
4 · 8 · 12 · 16 · 24 · 32 · 48 · 64 · 80 · 96
```

| Token | Value | Typical use |
|-------|------:|-------------|
| xxs | 4 | Icon ↔ text gap, avatar ↔ name |
| xs | 8 | Gap inside a button group, chip gap |
| sm | 12 | Row gap in a dense list |
| md | 16 | Card padding, screen margin (mobile), grid gap |
| lg | 24 | Section separation, screen margin (web) |
| xl | 32 | Block separation |
| 2xl | 48 | Hero → content, section vertical padding |
| 3xl | 64 | Generous section padding (web marketing) |
| 4xl | 80 | Last item → bottom nav clearance |
| 5xl | 96 | Major visual break |

**Rule:** every margin, padding, gap, and offset is a multiple of 4. No 7 px, no 13 px, no 22 px.

---

## Contrast ratios (WCAG 2.2)

| Element | Ratio | WCAG SC |
|---------|------:|---------|
| Normal text | 4.5:1 | 1.4.3 AA |
| Large text (≥18pt or ≥14pt bold) | 3:1 | 1.4.3 AA |
| UI components and graphical objects | 3:1 | 1.4.11 AA |
| Non-text content in icons (silhouette) | 3:1 | 1.4.11 AA |
| AAA text | 7:1 | 1.4.6 AAA |
| Focus indicator contrast | 3:1 | 2.4.13 (2.2) |

---

## Focus indicator (WCAG 2.4.11 + 2.4.13)

- `outline: 2px solid var(--focus-color);`
- `outline-offset: 2px;`
- Never `outline: none` without a replacement.
- Focus ring must be visible at 200% browser zoom.

---

## Animation timings

| Kind | Duration | Easing | Use |
|------|---------:|--------|-----|
| Micro-interaction | 100–150 ms | ease-out | Ripple, toggle flip, checkbox tick |
| State change | 150–200 ms | ease-out | Button pressed, chip selection |
| Expand / collapse | 200–250 ms | ease-in-out | Accordion, dropdown |
| Page transition | 250–350 ms | ease-in-out | Route change, navigation |
| Modal enter | 300–400 ms | ease-out | Bottom sheet slide-up, dialog |
| Modal exit | 200–250 ms | ease-in | Dismiss, swipe-away (exits faster than enters) |
| Intro (onboarding) | 500–800 ms | ease-out | First load, welcome animation |
| Spinner rotation | 1,400 ms | linear (infinite) | Indeterminate loading |
| Skeleton shimmer | 1,500–2,000 ms | ease-in-out (infinite) | Content placeholder |

**Watch:** divide the above by 1.5× (battery-sensitive). Max animation duration on Wear OS 300 ms.

**Reduced motion:** always respect `prefers-reduced-motion: reduce`. Target duration 0.01 ms for animations/transitions.

### Easing cheatsheet

| Direction | Curve (CSS) | Curve (iOS) | Feel |
|-----------|-------------|-------------|------|
| Entering element | `cubic-bezier(0, 0, 0.2, 1)` | `easeOut` | Arrives fast, settles |
| Exiting element | `cubic-bezier(0.4, 0, 1, 1)` | `easeIn` | Accelerates away |
| State change | `cubic-bezier(0.4, 0, 0.2, 1)` | `easeInOut` | Smooth both ends |
| Spring subtle | `cubic-bezier(0.34, 1.56, 0.64, 1)` | `spring(damping: 0.85)` | Tiny overshoot |
| Spring visible | — | `spring(damping: 0.7)` | Playful bounce |

---

## Loading thresholds (Jakob Nielsen)

| Delay | Feedback |
|------:|----------|
| < 100 ms | Instant — no indicator |
| 100 ms – 1 s | Inline spinner (subtle, non-blocking) |
| 1 s – 3 s | Skeleton matching final layout |
| > 3 s | Progress bar with % when possible; add a `Cancel` option |
| > 10 s | Communicate expected end-time or let user navigate away |

**Debounce** for search-as-you-type: 200–300 ms.
**Async validation** (e.g., username taken): 500 ms.

---

## Typography scales

### Web
| Role | Size | Weight | Line-height |
|------|-----:|-------:|------------:|
| Display / h0 | 48 px | 700 | 1.1 |
| h1 | 32 px | 700 | 1.2 |
| h2 | 24 px | 600 | 1.25 |
| h3 | 20 px | 600 | 1.3 |
| h4 | 18 px | 600 | 1.4 |
| Body | 16 px | 400 | 1.5 |
| Small | 14 px | 400 | 1.43 |
| Caption | 12 px | 400 | 1.5 |

Line length: 45–75 characters for body.

### Mobile (Flutter / SwiftUI / Compose)
| Role | Size | Weight | Line-height |
|------|------:|-------:|------------:|
| Display | 34 sp | 400 | 1.12 |
| Headline | 24 sp | 400 | 1.17 |
| Title | 16 sp | 600 | 1.25 |
| Body | 14 sp | 400 | 1.43 |
| Label | 12 sp | 500 | 1.33 |
| Caption | 11 sp | 400 | 1.45 |

### Wear OS / watchOS
| Role | Size | Weight |
|------|-----:|-------:|
| Title | 18 sp | 500 |
| Body | 15 sp | 400 |
| Caption | 13 sp | 400 |

Watch rule: max 3 visible lines of text, always short.

---

## Border radius scale

| Value | Use |
|------:|-----|
| 0 px | Tables, code, horizontal rules |
| 4 px | Badges, tags, chips, small elements |
| 8 px | Buttons, inputs, tooltips, toasts |
| 12 px | Cards, dropdowns, popovers, search bar |
| 16 px | Large cards, modals, panels |
| 9999 px (pill) | Pill buttons, avatars, status dots, toggles |

**Rule:** max 3 distinct radii in a single app.

---

## Shadow / elevation

### Web (CSS)
| Level | CSS |
|-------|-----|
| sm | `0 1px 2px rgba(0,0,0,0.05)` — resting cards |
| md | `0 1px 3px rgba(0,0,0,0.1), 0 1px 2px rgba(0,0,0,0.06)` — hover cards, dropdown |
| lg | `0 10px 15px rgba(0,0,0,0.1), 0 4px 6px rgba(0,0,0,0.05)` — modal, drawer |
| xl | `0 20px 25px rgba(0,0,0,0.1), 0 8px 10px rgba(0,0,0,0.04)` — floating toast |

### Mobile (Flutter)
- Card: `blurRadius: 4, offset: (0, 1), opacity: 0.08`
- Elevated: `blurRadius: 8, offset: (0, 2), opacity: 0.12`
- Modal: `blurRadius: 24, offset: (0, 8), opacity: 0.16`

### Watch
- No shadows. Use tonal surface elevation (Material 3).

### Dark mode
- Shadows barely visible. Prefer `border: 1px solid rgba(255,255,255,0.05)` for separation.

---

## Dark mode surfaces (Material 3 reference)

| Elevation | Color |
|-----------|-------|
| 0 dp | `#121212` |
| 1 dp | `#1E1E1E` |
| 4 dp | `#272727` |
| 8 dp | `#2E2E2E` |
| 16 dp | `#363636` |

Dark mode is a **remap**, not an invert: desaturate accents by ~10%, never use pure `#000` for text, never use pure `#fff` for backgrounds.

---

## Modals and sheets

| Kind | Max width | Max height | Notes |
|------|----------:|-----------:|-------|
| Small modal | 400 px | 90 vh | Confirmation, quick choice |
| Medium modal | 600 px | 90 vh | Standard form |
| Large modal | 800 px | 90 vh | Complex form, data view |
| Full-screen (mobile) | 100 vw | 100 vh | Complex flows |

| Bottom sheet detent | Height | Use |
|---------------------|-------:|-----|
| Small | 25 % | 2–5 quick actions |
| Medium | 50 % | Preview + detail |
| Large | 90 % | Form, wizard |

---

## Gamification (Section N / W)

| Pattern | Value | Source |
|---------|------:|--------|
| Streak threshold | 7 days → +3.6× retention | Industry data |
| Streak grace period | 24–48 h | NN/g |
| Leaderboard default scope | Weekly | NN/g |
| Max suggestions in autocomplete | 5–10 (desktop) / 8 (mobile) | Baymard |
| First-meaningful reward | ≤ 3 sessions | Hook Model |

---

## Tables

| Density | Row height | Use |
|---------|-----------:|-----|
| Compact | 32–36 px | Admin, dashboards, data grids |
| Default | 40–52 px | Standard lists |
| Comfortable | 52–64 px | Touch-heavy, mobile-first |

Client-side sort/filter limit: < 1,000 rows. Beyond that, server-side pagination.

Page sizes: 10 · 25 · 50 · 100.

---

## Checkout (Baymard)

| Metric | Value |
|--------|------:|
| Average cart abandonment | ~70 % |
| Mandatory-account abandonment lift | ~34 % abandoned |
| Guest checkout hidden by sites | 62 % |
| Form field reduction | remove ≥ 20 % of fields on first pass |
| Address autocomplete | +20 % completion |
| Express checkout (Apple Pay / Google Pay) | +30 % on supported browsers |

---

## Icons

### Android adaptive icon
- Canvas per layer: 108 × 108 dp
- Safe zone (fully visible): 66 × 66 dp circle
- Logo minimum: ≥ 48 × 48 dp
- Reserve per side: 18 dp
- No shadows or masks in your layers (OS applies them)

### iOS
- App Store: 1024 × 1024 PNG (no transparency)
- iPhone: 60 pt → 120 px @2x, 180 px @3x
- iPad: 76 pt → 152 px @2x, 167 px @2x Pro
- No manually rounded corners (platform applies the squircle)

### Play Store asset
- 512 × 512 PNG 32-bit sRGB ≤ 1024 KB
- Square, no shadows, no rounded corners

### Icon contrast (silhouette)
- ≥ 3:1 against adjacent color (WCAG 1.4.11)
- Readable at 48 px in monochrome with 1–2 px gaussian blur

---

## Responsive breakpoints

### Web
| Name | Range | Columns |
|------|-------|--------:|
| Mobile | < 768 px | 1 |
| Tablet | 768–1024 px | 2 |
| Desktop | 1024–1440 px | 3 |
| Wide | > 1440 px | 3 (content max-width 1280 px) |

### Mobile (Material 3 Window Size Classes)
| Name | Width |
|------|-------|
| Compact | < 600 dp (phone portrait) |
| Medium | 600–840 dp (phone landscape, small tablet) |
| Expanded | > 840 dp (tablet, desktop) |

### Wear OS
| Tier | Range |
|------|-------|
| Small | < 192 dp |
| Standard | 192–224 dp |
| Large | ≥ 225 dp |

---

## Z-index scale (web)

```
0      Base
10     Sticky (header, sidebar)
20     Dropdown
30     Fixed (FAB, floating action)
40     Modal backdrop
50     Modal
60     Popover
70     Tooltip
80     Toast / snackbar
90     Loading overlay
100    Debug / dev-tool
```

Rule: never pick arbitrary numbers like `z-index: 999`. Use the scale.

---

## How to reference this file

From a bible section, link instead of duplicating:

```markdown
See [VALUES.md § Touch targets](../VALUES.md#touch-targets) for the canonical table.
```

If a bible section needs a platform-specific refinement, quote the canonical value and extend it — don't re-declare it.

---

## Contributor rule

**If you are adding a numeric UX value anywhere in the repo, check whether it already lives here.** If yes, link. If no, add it here first, then reference it everywhere else.

This is the file that prevents the repo from drifting into contradictions as it grows.
