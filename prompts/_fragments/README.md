# prompts/_fragments/

> Reusable pieces shared across multiple prompts. Lever 6 from [../VISION.md](../VISION.md).

When a prompt needs one of these patterns, **reference the fragment instead of duplicating**. If you find yourself pasting the same 30 lines into two prompts, extract the fragment here and reference it.

## Fragments

| File | Content | Used by |
|------|---------|---------|
| [7-sins.md](7-sins.md) | The 7 noob sins (rainbow, xmas tree, tetris, invisible, frankenstein, roman, claustrophobe) with detection + fix recipe | PROMPT_DESIGN_AUDIT |
| [12-axes.md](12-axes.md) | 12-axis technical audit grid (colors, typo, spacing, buttons, cards, inputs, nav, icons, elevation, media, states, a11y) + bible refs | PROMPT_DESIGN_AUDIT |
| [states-coverage.md](states-coverage.md) | States checklist every screen must cover (default, loading, empty, no-results, error, offline, success, disabled) | SPEC_FROM_SCRATCH, DESIGN_AUDIT, CODE_REVIEW |
| [report-p0-p1.md](report-p0-p1.md) | P0/P1/P2/P3 bug report template with before/after code pair convention | DESIGN_AUDIT, CODE_REVIEW, A11Y_AUDIT |
| [chain-footer.md](chain-footer.md) | Standardized `## Chain` block format for routing between prompts | All prompts |

## How fragments work

The AI session doesn't auto-resolve includes (no runtime templating). The convention is:

- Inside a prompt, write a pointer: `See [_fragments/12-axes.md](_fragments/12-axes.md) for the audit grid.`
- When the user asks Claude to run that prompt, Claude reads the fragment file itself and applies it.
- This way a fragment change propagates to every consumer without manually updating each prompt.

## Rules for contributors

1. A fragment is extracted **only when ≥ 2 prompts need the same block**. Don't pre-extract on speculation.
2. Fragments are **standalone**: reading one out of context should make sense.
3. Fragments are **short** (< 100 lines). If a fragment grows past 100 lines, it's probably its own prompt.
4. Fragments have **no WHEN / WHEN NOT block** — they're not user-facing, they're building blocks.
5. Fragments are **MIT** (like the rest of `prompts/`).
