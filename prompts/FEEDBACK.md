---
file: feedback
version: 1.0.0
updated: 2026-04-17
kind: protocol
---

# Feedback protocol (Sprint 2 of VISION.md)

> Tracks what works and what doesn't across the prompt system. Accumulates signal for quarterly patches.
> Not a user prompt — a log file updated manually after each prompt invocation.

## How it works

At the end of each prompt run, the user can log a 1-line entry in the next section.

**✓ entries** mean "this worked well, keep it as-is". Silence is OK — you don't have to log every success.
**✗ entries** mean "this fell short". Always write these — they're the signal for improvement.

## Entry format

```
- YYYY-MM-DD · <prompt-name> · ✓ or ✗ · one-line context · optional pain point
```

Examples:
```
- 2026-04-17 · design-audit · ✓ · audit complet on infernal_wheel dashboard
- 2026-04-17 · spec-from-scratch · ✗ · oubliait l'offline state sur mobile · need to add offline to spec sections
- 2026-04-18 · code-review · ✗ · too many P2 noise, user wanted P0 only · add `review p0-only` param default for big diffs
- 2026-04-20 · tokens-export · ✓ · Tailwind v4 output ready to paste
- 2026-04-21 · pick-pattern · ✗ · n'a pas couvert command palette vs cmd+k distinction · enrich DESIGN_TREE § AH
- 2026-04-22 · devils-advocate · ✓ · attaqué onboarding 5 écrans, convaincu user de réduire à 2
```

## Review cadence

- **Weekly glance**: skim new entries, acknowledge.
- **Monthly**: batch the ✗ entries by prompt, identify clusters.
- **Quarterly**: ship patches. Bump prompt `version:` in its YAML frontmatter. Document in CHANGELOG.md.

## Rules

1. **Date first, prompt name second.** Sortable.
2. **One line.** If it needs a paragraph, open a GitHub issue instead and link it here.
3. **✗ without a pain point is useless.** Always note "what specifically fell short" so a future patch can target it.
4. **Never delete old entries.** Accumulate. Patched entries get a ref to the commit that fixed them: `→ fixed in abc123`.

## Anti-patterns

- ❌ Logging every ✓ success (too noisy — silence is OK for wins)
- ❌ Vague ✗ ("didn't work") — always name the specific failure
- ❌ Self-promotional ("this prompt is great 10/10") — we only log friction and wins with signal

---

## Log

<!-- Newest entries at the top. -->

- 2026-04-17 · meta · bootstrap · FEEDBACK.md shipped as part of Sprint 2 VISION. No user data yet — this file starts accumulating from next real prompt invocation.
