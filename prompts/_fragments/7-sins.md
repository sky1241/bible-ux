# The 7 noob sins

> Extracted from PROMPT_DESIGN_AUDIT. Used to quickly detect amateur UI issues from a screenshot.

## 1. "L'arc-en-ciel" — too many colors

**Amateur:** 6–8 random colors, every button a different color, blue bg with green text.
**Pro:** max 3 colors (primary + neutral + 1 accent), everything else grayscale.

**Detection:** count distinct non-neutral colors on the screenshot. More than 4 = problem.

**Fix:** keep 1 accent (brand or most present), grayscale the rest. Apply 60-30-10 (60% neutral bg, 30% secondary surfaces, 10% accent).

## 2. "Le sapin de Noël" — everything is important

**Amateur:** 4 colored buttons, 3 bold titles, text in red + green + blue on same screen.
**Pro:** 1 primary CTA, 1 main title, clear hierarchy from loudest to quietest.

**Detection:** count "loud" elements (colored, bold, big, outlined). More than 2 screaming for attention = no hierarchy.

**Fix:** keep ONE most important thing as primary (filled colored button). Everything else → secondary (outlined) or tertiary (text only). 1 large title, the rest smaller and lighter.

## 3. "Le tétris" — anarchic spacing

**Amateur:** 7 px here, 13 px there, 22 px below, nothing aligns.
**Pro:** every value is a multiple of 4 or 8 (4, 8, 12, 16, 24, 32, 48).

**Detection:** elements look "thrown around", gaps vary without reason. Compare gaps between similar elements — if they differ, problem.

**Fix (see [VALUES.md § Spacing scale](../../VALUES.md#spacing-scale-4px-base)):**
- Card/container padding: 16 px everywhere
- Gap between elements: 8 px (tight) or 16 px (standard)
- Screen margin: 16 dp mobile, 24 px web
- Between sections: 24 or 32 px
- Verify: everything multiple of 4.

## 4. "L'invisible" — insufficient contrast

**Amateur:** light gray text (#ccc) on white, blue text on purple.
**Pro:** ≥ 4.5:1 for text, ≥ 3:1 for UI elements (see [VALUES.md § Contrast ratios](../../VALUES.md#contrast-ratios-wcag-22)).

**Detection:** squint at the screen. If text disappears = problem. Secondary text is usually the worst offender (dates, labels, placeholders).

**Fix:**
- Primary text: #111827 (near-black) on light bg
- Secondary: #6b7280 (medium gray), never lighter
- Text on colored bg: #fff on dark, #111 on light
- Placeholder: #9ca3af (gray), but label ABOVE the field in #374151

## 5. "Le frankenstein" — mixed styles

**Amateur:** rounded + square + pill buttons on the same page, 3 icon sizes.
**Pro:** same border-radius everywhere, same icon size everywhere.

**Detection:** each element looks like it comes from a different template.

**Fix:**
- 1 border-radius for buttons (8 px), 1 for cards (12 px)
- All icons: same style (outline OR filled), same size (24 px)
- Same font, same weights (Regular + Semibold max)
- Same shadow style (or no shadow at all)

## 6. "Le roman" — text wall, no hierarchy

**Amateur:** dense paragraphs, all same size, no titles, wall of text.
**Pro:** clear hierarchy, short text, generous whitespace.

**Detection:** > 3 lines of text blocks without title or separation.

**Fix:**
- Title: 20–24sp bold → Subtitle: 16sp semibold → Body: 14sp regular → Caption: 12sp
- Max 2–3 lines per block
- Whitespace: 24 px padding between sections
- Line-height: 1.5 for body (it breathes)

## 7. "Le claustrophobe" — zero whitespace

**Amateur:** everything edge-to-edge, no air, no breathing.
**Pro:** whitespace guides the eye and is a design element.

**Detection:** elements almost touching, background barely visible.

**Fix:**
- 16 px padding in every card/container
- 16 px gap between cards
- 16 dp margin on screen sides
- 32 px section spacing between logical blocks
- Rule: when in doubt, ADD space.

## How to apply

Run this checklist in order. Fix sin 1 first (palette), then 3 (spacing), then 4 (contrast). Those three alone move most UI from amateur to acceptable. The others are polish.
