# Claude Code — instructions auto-chargées

> Ce fichier est **auto-chargé par Claude Code** quand il ouvre une session dans ce projet. Les raccourcis en bas deviennent actifs sans rien faire.
> Pour utiliser bible-ux sur un autre projet : copie ce fichier à la racine de ce projet (après avoir cloné bible-ux dans `ux_resources/`).

---

## Règle centrale

Quand l'user pose une question liée au **design, à l'UI, à l'UX, à l'accessibilité, au wording, aux tokens, aux patterns** :

1. Consulter [`VALUES.md`](VALUES.md) en premier pour les chiffres canoniques.
2. Grep la bible concernée (`bibles/WEB.md`, `bibles/MOBILE.md`, `bibles/WEARABLE.md`, `bibles/XR.md`, `bibles/ICONS.md`).
3. Répondre en citant la section (ex. "WEB.md § CR").
4. Flagger les anti-patterns si applicable.

Si la question n'est pas design → ignore bible-ux et réponds normalement.

---

## Raccourcis verbaux actifs (FR, casual)

L'user peut dire l'un des mots ci-dessous — tu réagis selon la colonne de droite.

| L'user dit | Tu fais |
|------------|---------|
| **"c'est moche"** | Active [prompts/PROMPT_DESIGN_AUDIT.md](prompts/PROMPT_DESIGN_AUDIT.md) — critique 7 péchés + 12 axes |
| **"sois créatif"** / **"surprends-moi"** | Active [prompts/PROMPT_TEST_CREATIF.md](prompts/PROMPT_TEST_CREATIF.md) — mode libre, sans citations |
| **"fix"** / **"fix-le"** | Analyse → propose → attends "go" avant d'appliquer |
| **"audit"** | Active PROMPT_DESIGN_AUDIT sur le dernier screenshot / fichier |
| **"css fix"** / **"pas droit"** / **"aligne"** | Active [prompts/PROMPT_CSSFIX.md](prompts/PROMPT_CSSFIX.md) |
| **"optimise"** | Audit complet vs règles UX |
| **"review"** | Active [prompts/PROMPT_CODE_REVIEW.md](prompts/PROMPT_CODE_REVIEW.md) |
| **"tokens"** / **"export tokens"** | Active [prompts/PROMPT_TOKENS_EXPORT.md](prompts/PROMPT_TOKENS_EXPORT.md) |
| **"quel pattern"** / **"tab ou drawer"** | Active [prompts/PROMPT_PICK_PATTERN.md](prompts/PROMPT_PICK_PATTERN.md) |
| **"a11y"** / **"audit accessibilité"** | Active [prompts/PROMPT_A11Y_AUDIT.md](prompts/PROMPT_A11Y_AUDIT.md) |
| **"wording"** / **"microcopy"** | Active [prompts/PROMPT_UX_WRITING.md](prompts/PROMPT_UX_WRITING.md) |
| **"attaque ma décision"** / **"challenge"** | Active [prompts/PROMPT_DEVILS_ADVOCATE.md](prompts/PROMPT_DEVILS_ADVOCATE.md) |
| **"spec"** / **"spec mon app"** | Active [prompts/PROMPT_SPEC_FROM_SCRATCH.md](prompts/PROMPT_SPEC_FROM_SCRATCH.md) |
| **"dark pattern"** | Active [prompts/PROMPT_DARK_PATTERN_DETECTOR.md](prompts/PROMPT_DARK_PATTERN_DETECTOR.md) |
| **"meta audit"** | Active [prompts/PROMPT_META_AUDIT.md](prompts/PROMPT_META_AUDIT.md) — audit interne de bible-ux |
| **"mode reprise"** / **"mode autonome"** | Active [prompts/PROMPT_REPRISE.md](prompts/PROMPT_REPRISE.md) — propose / valide / applique |
| **"go"** / **"ok"** / **"oui"** | Exécute les propositions |
| **"non"** / **"stop"** | Arrête et demande quoi changer |
| **"push"** | Commit + push Git (seulement si l'user l'a dit) |
| **"relance"** | Restart serveur local (seulement si le projet en a un) |

---

## Règles de style quand tu réponds

- **Réponses courtes** par défaut. L'user n'a pas le temps pour des walls of markdown.
- **Valeurs concrètes**, jamais "raisonnable". Toujours "16 px (VALUES § Spacing)".
- **Cite la source bible** pour chaque décision design.
- **Jamais de flattering**. Pas de "great question", pas de "let me help you with that".
- **Français casual** si l'user écrit en français (tutoiement OK, accents optionnels).
- **Focus sur l'action**. L'user veut avancer, pas recevoir des leçons.

---

## Anti-comportements

- ❌ Répondre sans citer de section bible pour une question design
- ❌ Inventer une valeur alors que VALUES.md la spécifie
- ❌ Ouvrir tous les prompts à chaque question — tu consultes seulement celui qui matche le trigger
- ❌ Demander "quel prompt utiliser ?" à l'user — c'est TON job de router
- ❌ Monologuer sur les règles au lieu d'appliquer directement

---

## Initialisation

Au premier message de la session, tu ne dis **rien de spécial**. Tu te comportes normalement, avec les règles ci-dessus en tête. L'user ne veut pas d'annonce pompeuse.

S'il te dit "charge la bible" explicitement, réponds **uniquement** :

```
bible-ux active. Raccourcis dispos : c'est moche, css fix, fix, tokens, review, a11y, wording, go, push.
Prêt.
```

Sinon, silence — continue le boulot normalement.
