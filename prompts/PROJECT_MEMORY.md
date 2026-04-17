---
file: project-memory
version: 1.0.0
updated: 2026-04-17
kind: convention
---

# Project memory — `.bible-ux/project.json`

> Lever 5 of [VISION.md](VISION.md). Let bible-ux remember a project's stack, targets, brand, a11y level across sessions, so your assistant stops re-asking the same questions every time.
> Not a user prompt — a convention document.

## The problem

Every new Claude/GPT session, the assistant forgets that your project:
- Uses Tailwind v4 (not v3)
- Targets iOS 17+ minimum
- Has a brand primary `#3B82F6`
- Aims at WCAG AA, not AAA
- Is a B2B SaaS (not B2C)
- Requires FR + EN i18n from day 1

Result: same 8 discovery questions every time. Wasted tokens, wasted user patience.

## The solution

Drop a `.bible-ux/project.json` in the root of **your project** (not in bible-ux itself). [`PROMPT_MASTER.md`](PROMPT_MASTER.md) reads it on startup and applies the defaults automatically.

## File location

```
your-project/
├── .bible-ux/
│   └── project.json              ← project-scoped memory
├── ux_resources/                 ← cloned bible-ux
│   ├── bibles/
│   ├── prompts/
│   └── ...
├── src/
└── ...
```

The `.bible-ux/` folder should be **committed** in the project repo (like `.vscode/settings.json`), so it's the same for all contributors.

## Schema

Minimum viable `.bible-ux/project.json`:

```json
{
  "$schema": "https://raw.githubusercontent.com/sky1241/bible-ux/main/schemas/project.schema.json",
  "bible_version": "1.8.0",
  "project_name": "infernal-wheel",
  "targets": ["web"],
  "stack": {
    "frontend": "vanilla-js",
    "styling": "custom-css",
    "build": "powershell-html-generator"
  }
}
```

Full schema (all optional keys):

```json
{
  "$schema": "https://raw.githubusercontent.com/sky1241/bible-ux/main/schemas/project.schema.json",

  "bible_version": "1.8.0",
  "project_name": "my-project",
  "project_type": "b2c | b2b | internal | personal",

  "targets": ["web", "ios", "android", "watchos", "wearos", "xr"],
  "min_versions": {
    "ios": "17",
    "android": "14",
    "browser": "chrome-120, safari-17"
  },

  "stack": {
    "frontend": "react | vue | svelte | solid | vanilla-js | flutter | swiftui | compose | uikit | xml-android",
    "styling": "tailwind-v4 | tailwind-v3 | css-modules | styled-components | custom-css | dart | swiftui | compose",
    "build": "vite | webpack | nextjs | nuxt | gradle | xcode | powershell",
    "typescript": true,
    "monorepo": false
  },

  "brand": {
    "primary_hex": "#3B82F6",
    "font_primary": "Inter",
    "font_display": "Space Grotesk",
    "tone": "professional | casual | playful | premium | technical",
    "locked_tokens_path": "src/styles/tokens.css"
  },

  "accessibility": {
    "level": "AA | AAA",
    "required_support": ["keyboard", "screen-reader", "reduced-motion", "forced-colors"]
  },

  "i18n": {
    "enabled": true,
    "locales": ["en", "fr"],
    "default": "en",
    "rtl_support": false
  },

  "compliance": {
    "gdpr": true,
    "ccpa": false,
    "coppa": false,
    "hipaa": false,
    "eu_dark_patterns_act": true
  },

  "monetization": {
    "model": "free | freemium | paid | subscription | ads",
    "paywall_timing": "after-value | feature-gate | usage-limit",
    "trial_days": 14,
    "cancel_policy": "3-clicks-max"
  },

  "project_specific_prompts": [
    "PROMPT_REPRISE_infernal_wheel.md"
  ],

  "server_local": {
    "url": "http://127.0.0.1:8011/",
    "start_command": "powershell.exe -NoProfile -ExecutionPolicy Bypass -File hellwell/start_dashboard.ps1",
    "protected_js_ids": ["statGoal", "statDone", "kSeg", "agendaTimeline"]
  }
}
```

## How PROMPT_MASTER reads it

When the user invokes `PROMPT_MASTER.md` with "charge la bible", Claude:

1. Checks if `.bible-ux/project.json` exists in the current project root (relative to the working directory).
2. If yes: parses it, silently applies the defaults:
   - Stack inference → tokens export format
   - Target platforms → which bibles to prioritize
   - A11y level → what rules to enforce
   - Brand tone → default voice for microcopy
   - Protected JS IDs → never modify those
   - Server local → use the `start_command` on "relance"
3. Mentions in the init message: "Project: <project_name>, stack: <stack.frontend>+<stack.styling>, a11y: <level>, brand primary: <hex>"
4. Skips the discovery questions it already has answers to.

## Versioning

`bible_version` field tracks which bible-ux version the project was last synced to. If the user runs a prompt with an older bible, Claude warns: "Project synced to 1.5.0, but bible-ux is 1.8.0. Consider updating .bible-ux/project.json."

## Migration from no-project.json

First time using bible-ux on a project? Run `PROMPT_SPEC_FROM_SCRATCH.md` or `PROMPT_MIGRATE_TO_BIBLE.md` — both end by offering to generate the initial `.bible-ux/project.json` based on the discovery answers.

## Privacy

`.bible-ux/project.json` is **committed with the project** so all contributors benefit. If you have sensitive data (API keys, credentials), do NOT put them here — use `.env` as usual. The file is for design-system metadata only.

## Anti-patterns

- ❌ Copying `.bible-ux/project.json` between unrelated projects — each project has its own
- ❌ Overriding everything in the JSON even if defaults work — keep it minimal
- ❌ Committing secrets in this file — wrong tool
- ❌ Forgetting to bump `bible_version` after migrating to a newer bible-ux

---

## Example: what infernal_wheel's `.bible-ux/project.json` could look like

```json
{
  "bible_version": "1.8.0",
  "project_name": "infernal-wheel",
  "project_type": "personal",
  "targets": ["web"],
  "stack": {
    "frontend": "vanilla-js",
    "styling": "custom-css",
    "build": "powershell-html-generator",
    "typescript": false
  },
  "brand": {
    "primary_hex": "#35d99a",
    "tone": "casual",
    "locked_tokens_path": "hellwell/dashboard/Dashboard.Page.ps1"
  },
  "accessibility": { "level": "AA" },
  "i18n": { "enabled": false, "default": "fr" },
  "server_local": {
    "url": "http://127.0.0.1:8011/",
    "start_command": "powershell.exe -NoProfile -ExecutionPolicy Bypass -File hellwell/start_dashboard.ps1",
    "protected_js_ids": [
      "statGoal", "statDone", "statBreak", "kRemain", "progressPct", "bar",
      "kSeg", "kSeg2", "kTimerElapsed", "kTimerRemain", "currentBox",
      "liveCard", "firstsToday", "actionsToday", "drinkToday", "smokeToday",
      "agendaTimeline", "agendaClock", "agendaToggle", "agendaDetails"
    ]
  }
}
```

With this file in place, Claude would:
- Never ask "which framework?" — knows it's vanilla-js + custom CSS in PowerShell
- Know to use `#35d99a` as accent everywhere without asking
- Auto-run the PowerShell restart on "relance"
- Refuse to rename or delete those 20 protected JS IDs
- Apply FR casual tone by default on all microcopy

That's what project memory buys you.
