# 12-axis technical audit grid

> Extracted from PROMPT_DESIGN_AUDIT. Apply each axis sequentially. Every issue cites a bible section.

## Axis 1 — Colors
**Bible:** WEB § CP · MOBILE § CR · WEARABLE § AS

- [ ] 60-30-10 respected (60% neutral bg, 30% secondary surface, 10% accent)
- [ ] AA contrast: ≥ 4.5:1 body text, ≥ 3:1 large text + UI elements (see [VALUES.md § Contrast](../../VALUES.md#contrast-ratios-wcag-22))
- [ ] Semantic: success = green, error = red, warning = orange
- [ ] Max 1 primary brand color + neutrals (no rainbow)
- [ ] Dark mode: #121212 bg, #1E1E1E surfaces, never pure #000 for text

## Axis 2 — Typography
**Bible:** WEB § AP · MOBILE § A/B · WEARABLE § D · see [VALUES.md § Typography](../../VALUES.md#typography-scales)

- [ ] Visible hierarchy: title >> subtitle >> body >> caption (size AND weight)
- [ ] Body: 16 px web, 14 sp mobile, 15 sp watch (MINIMUM)
- [ ] Line-height: 1.5 body, 1.2–1.3 titles
- [ ] Max 2 font-weights (400 regular + 600 semibold)
- [ ] Text truncates cleanly: ellipsis, maxLines, no mid-word cuts

## Axis 3 — Spacing
**Bible:** WEB § CQ · MOBILE § CW · WEARABLE § 8 · see [VALUES.md § Spacing](../../VALUES.md#spacing-scale-4px-base)

- [ ] 4/8 px grid: every margin, padding, gap is multiple of 4
- [ ] Card padding: 16 px uniform (not 12 left 20 right)
- [ ] Screen margin: 16 dp mobile, 24 px web
- [ ] Uniform gap between similar elements
- [ ] Sufficient whitespace: breathes, not cramped

## Axis 4 — Buttons
**Bible:** WEB § CR · MOBILE § CS · WEARABLE § B · see [VALUES.md § Touch targets](../../VALUES.md#touch-targets)

- [ ] 1 primary CTA per screen (filled, colored)
- [ ] Hierarchy: primary > outlined > text > ghost
- [ ] Touch target: 48 dp mobile, 44 px web, 48 dp watch
- [ ] Distinct states: no "dead" button (same look tapped vs untapped)
- [ ] Destructive: red + confirmation, never as primary

## Axis 5 — Cards & Containers
**Bible:** WEB § CT · MOBILE § BL · WEARABLE § 8

- [ ] Consistent border-radius: same value for all containers
- [ ] Shadow OR border (not both, except glassmorphism)
- [ ] No card-in-card (card inception = forbidden)
- [ ] Clickable? → visible hover state
- [ ] Structured content: no text wall in a card

## Axis 6 — Inputs & Forms
**Bible:** WEB § CN · MOBILE § CV · WEARABLE § 7

- [ ] Label VISIBLE above the field (not just placeholder)
- [ ] Visual states: default (gray), focus (blue ring), error (red + message), disabled (pale)
- [ ] Size: 48 dp mobile, 40 px web
- [ ] Error: message BELOW field, "what + how to fix"
- [ ] Adapted keyboard: email → @, phone → numeric, password → masked

## Axis 7 — Navigation
**Bible:** WEB § B/AH · MOBILE § D · WEARABLE § 9 · XR § B

- [ ] Mobile: bottom nav (3–5 items), active item distinguished (filled icon + label + pill)
- [ ] Web: top nav bar, clear items, breadcrumbs if depth > 2
- [ ] Watch: horizontal swipe between pages, back = swipe right, no nav bar
- [ ] Back accessible everywhere (button or swipe)

## Axis 8 — Icons
**Bible:** WEB § AU · MOBILE § AT · WEARABLE § A · see ICONS.md

- [ ] Consistent style: ALL outline OR ALL filled (no mix)
- [ ] Size: 24 dp standard, 20 dp compact, 16 dp inline
- [ ] Icon active vs inactive: filled (active) vs outline (inactive) OR tint
- [ ] No decorative icon without meaning (icon pollution)

## Axis 9 — Elevation
**Bible:** WEB § CS · MOBILE § CT · WEARABLE § E · see [VALUES.md § Shadow](../../VALUES.md#shadow--elevation)

- [ ] Max 3 levels: flat (lists), raised (cards), floating (modals/FAB)
- [ ] Consistent: all cards same shadow, all modals same shadow
- [ ] Dark mode: almost no shadow, differentiate via surface color

## Axis 10 — Images & Media
**Bible:** WEB § AD · MOBILE § AH

- [ ] Aspect-ratio: not deformed (object-fit: cover/contain)
- [ ] Placeholder during load (skeleton shimmer, no empty box)
- [ ] Reasonable size (no 4000 px image for 40 px avatar)
- [ ] Corners: same border-radius as parent container

## Axis 11 — States & Feedback
**Bible:** WEB § A · MOBILE § C · WEARABLE § F · see [_fragments/states-coverage.md](states-coverage.md)

- [ ] Loading: skeleton OR spinner, NEVER blank white screen
- [ ] Empty state: illustration + title + subtitle + CTA
- [ ] Error: clear message + recovery action ("Retry")
- [ ] Success: immediate feedback (< 100 ms), green color, haptic on mobile

## Axis 12 — Accessibility
**Bible:** WEB § F · MOBILE § AQ · WEARABLE § I · see [VALUES.md § Focus](../../VALUES.md#focus-indicator)

- [ ] AA contrast on ALL text (no forgotten light gray)
- [ ] Keyboard focus visible (web): outline/ring, never outline:none without replacement
- [ ] Touch targets never < 44 px
- [ ] Color NEVER sole indicator (always + icon or text)
- [ ] Text: resize 200% without overflow (web)
