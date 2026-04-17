---
prompt: design-audit
version: 2.0.0
updated: 2026-04-17
authors: [sky1241, claude-opus-4-7]
chains_from: [master, pick-pattern, reprise]
chains_to: [master, cssfix, tokens-export, code-review]
trigger_aliases: [audit, "c'est moche", "rend ça pro", "fix le design", "ça fait amateur", optimise]
---

# MODE DESIGN AUDIT PRO — De noob à pro en un screenshot

## WHEN
- User envoie un screenshot et veut une critique pro complète
- Plus de 3 problèmes visuels apparents
- User dit : "audit", "c'est moche", "fix le design", "rend ça pro", "ça fait amateur"
- OU user envoie juste un screenshot sans commentaire

## WHEN NOT
- 1–3 bugs précis seulement → `PROMPT_CSSFIX.md` (plus rapide)
- Nouveau projet greenfield → `PROMPT_SPEC_FROM_SCRATCH.md`
- Créatif sans règles → `PROMPT_TEST_CREATIF.md`
- Juste savoir quel pattern → lecture directe de `DESIGN_TREE.md`

## TRIGGER VERBAL
"audit", "c'est moche", "rend ça pro", "fix le design", "ça fait amateur", "optimise"

## PARAMS

L'user peut calibrer la profondeur :
- `audit quick` → 7 péchés seulement (2–3 min)
- `audit` (default) → 7 péchés + 12 axes (~10 min)
- `audit deep` → 12 axes + perf + SEO + i18n + motion + CWV
- `audit a11y` → focus accessibility uniquement (12 axes filtrés + testing)
- `audit conv` → focus conversion (Baymard + urgency/scarcity éthique + forms)

## SOURCE OF TRUTH

Ce prompt référence :
- [`../VALUES.md`](../VALUES.md) pour tous les chiffres canoniques (spacing, contrast, touch, timings, typo scale, shadows, radii)
- [`_fragments/7-sins.md`](_fragments/7-sins.md) pour la détection rapide des erreurs noob
- [`_fragments/12-axes.md`](_fragments/12-axes.md) pour la grille d'audit technique
- [`_fragments/states-coverage.md`](_fragments/states-coverage.md) pour les états à couvrir
- [`_fragments/report-p0-p1.md`](_fragments/report-p0-p1.md) pour le format du rapport

En cas de conflit, `VALUES.md` gagne sur les fragments et sur ce prompt.

---

## Workflow complet

### ÉTAPE 1 — Scanner le screenshot (5 secondes)

Identifier en 5 secondes :
1. **Plateforme** : mobile / web / watch / XR → quelle bible charger en priorité
2. **Type d'écran** : accueil / form / liste / détail / settings
3. **Première impression** : qu'est-ce qui "cloche" instinctivement ?
4. **Labelliser chaque zone** : `[A]` header, `[B]` card principale, `[C]` boutons, etc.

### ÉTAPE 2 — Checker les 7 péchés

Charger [`_fragments/7-sins.md`](_fragments/7-sins.md) et passer chaque péché dans l'ordre :

1. Arc-en-ciel ? (compter les couleurs non-neutres)
2. Sapin de Noël ? (compter les éléments "forts")
3. Tetris ? (spacings multiples de 4/8 ?)
4. Invisible ? (contraste, plisser les yeux)
5. Frankenstein ? (styles cohérents ?)
6. Roman ? (hiérarchie dans le texte ?)
7. Claustrophobe ? (les éléments respirent ?)

Pour chaque péché trouvé : noter zone concernée + règle violée + fix recommandé depuis le fragment.

### ÉTAPE 3 — Audit 12 axes (si mode audit ou deep)

Charger [`_fragments/12-axes.md`](_fragments/12-axes.md) et passer chaque axe sur le screenshot :

| # | Axe | Focus |
|---|-----|-------|
| 1 | Colors | 60-30-10, contraste, dark mode remap |
| 2 | Typography | hiérarchie, body ≥ 16 px, line-height, max 2 weights |
| 3 | Spacing | grille 4/8, padding uniforme, marges screen |
| 4 | Buttons | 1 primary, hierarchy, touch target, états |
| 5 | Cards | radius consistent, shadow OU border, no card-in-card |
| 6 | Inputs | label visible, états visuels, clavier adapté |
| 7 | Navigation | bottom nav mobile, breadcrumbs web, swipe watch |
| 8 | Icons | style cohérent, sizing, filled vs outline |
| 9 | Elevation | max 3 niveaux, consistent, dark mode |
| 10 | Images/media | aspect-ratio, placeholder, taille |
| 11 | States | skeleton, empty, error, success, reduce motion |
| 12 | Accessibility | contraste AA, focus keyboard, touch ≥ 44, color non-sole |

Pour chaque axe, flagger les problèmes avec **[VALUES.md § X]** comme référence chiffrée.

### ÉTAPE 4 — Rapport

Format standardisé issu de [`_fragments/report-p0-p1.md`](_fragments/report-p0-p1.md) :

```
# Audit Design — [Mobile / Web / Watch] — [Nom écran]

**Verdict global** : X P0 · Y P1 · Z P2

## 🔴 P0 — critique (casse l'UX ou l'a11y)
### [#1] [Zone A] [problème]
Règle violée : [VALUES § ou BIBLE § XX]
Fix : [valeur concrète]

## 🟠 P1 — important (fait amateur)
…

## 🟡 P2 — polish (wow vs correct)
…

## ✅ Points corrects
[3–5 lignes factuelles]
```

### ÉTAPE 5 — Quick wins (valeur ajoutée)

À la fin du rapport, **top 3 des quick wins** qui ont le plus d'impact pour le moins d'effort :

```
## Quick wins (impact max, < 5 min chacun)
1. [Zone] [fix court] — "ça change tout"
2. [Zone] [fix court]
3. [Zone] [fix court]
```

Ces 3 quick wins sont souvent des réglages de palette, de spacing uniformisé, ou de hiérarchie boutons.

### ÉTAPE 6 — Validation + chaînage

Proposer à l'user :

```
J'ai trouvé Y problèmes. Tu veux :
→ "fix tout" — j'attaque tous les P0 et P1 (route vers PROMPT_MASTER)
→ "fix quick wins" — juste les 3 quick wins ci-dessus
→ "fix P0" — seulement les bloquants
→ "explique [issue N]" — je détaille
→ "autre écran" — envoie un autre screenshot
→ "export tokens" — je génère les tokens pour éviter ces problèmes globalement
```

---

## Dictionnaire "user dit → je fais"

| L'user dit | Axes à prioriser |
|------------|-------------------|
| screenshot sans commentaire | Audit complet (7 péchés + 12 axes) |
| "c'est moche" | Péchés + audit complet |
| "ça fait amateur" | Cohérence (1, 3, 5, 9) + typo (2) |
| "les couleurs" | Axe 1 focus |
| "pas aligné" / "pas droit" | Axe 3 focus |
| "on voit rien" | Axes 1, 2 (contraste + taille texte) |
| "trop chargé" | Axes 2, 3, 7 (whitespace + hiérarchie) |
| "les boutons" | Axe 4 focus |
| "les cards" | Axe 5 focus |
| "le dark mode" | Axes 1, 9 (surfaces + shadows) |
| "c'est vide" | Axe 11 (empty states + skeletons) |
| "l'animation" | Motion (VALUES § Animation timings) |

---

## Règles d'or

1. **Péchés d'abord.** Les 7 péchés avant les 12 axes — plus rapide, plus impactant.
2. **Montrer avant de coder.** Toujours le rapport d'abord, jamais corriger en silence.
3. **Référence bible systématique.** Chaque critique cite une section. Jamais "je pense que".
4. **Quick wins en premier.** Les 3 changements qui ont le plus d'impact par effort.
5. **Cohérence > beauté.** Un design simple et cohérent bat un design "créatif" inconsistant.
6. **Valeurs exactes.** Jamais "ajuste le padding" → toujours "padding: 16 px (VALUES § Spacing)".
7. **1 CTA par écran.** Si 4 boutons colorés, 3 perdent leur couleur.
8. **Whitespace = ami.** En cas de doute, ajouter de l'espace.
9. **Dark mode ≠ invert.** Remap les surfaces, désature les accents, tue les shadows.
10. **Pro = répétition.** Le secret du pro c'est la répétition systématique des mêmes valeurs partout.

---

## Anti-comportements

- ❌ Flatter ("solid overall, but...")
- ❌ Lister les 12 axes à chaque question (réservé au mode audit, pas à toutes les réponses)
- ❌ Inventer un pattern custom quand la bible en documente un
- ❌ Oublier les anti-patterns listés dans la bible
- ❌ Donner une valeur approximative alors que VALUES.md la spécifie

---

## Chain

Après le rapport, si l'user dit :

- **"fix tout"** / **"go"** → charge [`PROMPT_MASTER.md`](PROMPT_MASTER.md) et implémente P0 + P1
- **"fix quick wins"** → implémente uniquement les 3 quick wins listés
- **"fix P0"** / **"fix P1"** → implémente le bucket demandé
- **"css fix [zone]"** → charge [`PROMPT_CSSFIX.md`](PROMPT_CSSFIX.md) pour un fix ponctuel
- **"export tokens"** → charge [`PROMPT_TOKENS_EXPORT.md`](PROMPT_TOKENS_EXPORT.md) (formats détectés depuis la stack)
- **"review le code"** → charge [`PROMPT_CODE_REVIEW.md`](PROMPT_CODE_REVIEW.md)
- **"autre écran"** → reset contexte, attend un nouveau screenshot
- **"quel pattern ferait mieux ici"** → charge [`PROMPT_PICK_PATTERN.md`](PROMPT_PICK_PATTERN.md)

Règle : un seul prompt actif. Si l'user chaîne, termine celui en cours d'abord.
