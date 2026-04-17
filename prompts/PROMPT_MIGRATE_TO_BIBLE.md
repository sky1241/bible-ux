---
prompt: migrate-to-bible
version: 1.0.0
updated: 2026-04-17
authors: [sky1241, claude-opus-4-7]
chains_from: [master]
chains_to: [master, tokens-export, design-audit, code-review, a11y-audit]
trigger_aliases: ["migrate to bible", "migration plan", "aligne mon projet", "mon projet vers bible-ux", "migrate"]
---

# MODE MIGRATE TO BIBLE — Plan de migration d'un projet existant

## WHEN
- Tu as un **projet existant** avec du design system bricolé / incohérent, et tu veux l'aligner sur bible-ux
- Tu veux une **roadmap priorisée** (pas tout refondre d'un coup)
- Tu veux chiffrer le coût (en jours-dev) de la migration
- Tu veux identifier les **quick wins** qui débloquent 80 % de la valeur

## WHEN NOT
- Greenfield → `PROMPT_SPEC_FROM_SCRATCH.md` (pas besoin de migrer, on démarre aligné)
- Audit ponctuel d'un écran → `PROMPT_DESIGN_AUDIT.md`
- Review du code → `PROMPT_CODE_REVIEW.md`
- Juste extraire des tokens CSS sans audit → `PROMPT_TOKENS_EXPORT.md`

## TRIGGER VERBAL
"migrate to bible", "migration plan", "aligne mon projet"

## PARAMS
- `migrate quick` → 2-heures audit → top 3 quick wins seulement
- `migrate` (default) → full audit → roadmap 4 phases avec chiffrage
- `migrate aggressive` → plan de refonte complète (3–6 mois)
- `migrate minimum` → juste compliance a11y + VALUES.md alignment (plancher pro)

## SOURCE OF TRUTH

- [`../VALUES.md`](../VALUES.md) — cible des valeurs canoniques
- [`../bibles/`](../bibles/) — règles par plateforme
- [`_fragments/12-axes.md`](_fragments/12-axes.md) — grille d'audit
- [`_fragments/states-coverage.md`](_fragments/states-coverage.md) — states requis

---

## Workflow

### Phase 0 — Discovery (5 questions max)

1. **Plateforme(s)** : web / iOS / Android / multi ?
2. **Stack** : React+Tailwind, SwiftUI, Compose, Flutter, autre ?
3. **Taille** : nombre d'écrans estimé, nombre de composants unique ?
4. **Équipe** : solo / 2–5 devs / plus ?
5. **Deadline / budget** : migration big-bang (sprint dédié) ou progressive (fil de l'eau) ?

Si l'user colle du code / un repo — scanner directement pour inférer stack et taille.

### Phase 1 — Gap analysis

Auditer le projet sur **5 dimensions** :

| Dimension | Mesure | Cible bible-ux |
|-----------|--------|----------------|
| **Design tokens** | Valeurs hard-codées vs dans un fichier tokens central | Tokens extraits dans `tokens.css` / `ThemeData` / `BibleSpacing` etc. + référencés partout |
| **Composants** | Duplication (X buttons différents, Y modals différents) | 1 composant primary, 1 secondary, 1 outline, 1 destructive — pas de duplicates |
| **States coverage** | Screens avec loading/empty/error implémentés | 100 % des écrans critiques couvrent les 8 states ([states-coverage.md](_fragments/states-coverage.md)) |
| **A11y** | Contraste AA, focus, touch targets, keyboard nav | 0 P0 bloquant, ≤ 5 P1 ([PROMPT_A11Y_AUDIT.md](PROMPT_A11Y_AUDIT.md)) |
| **Wording** | Cohérence ton, formule erreurs, empty states encourageants | Conforme [PROMPT_UX_WRITING.md](PROMPT_UX_WRITING.md) |

Pour chaque dimension, scorer **0 %** (tout cassé) à **100 %** (aligné bible).

### Phase 2 — Roadmap en 4 phases

**Phase A — Foundation (semaine 1)**

Objectif : poser les fondations sans casser la prod.

- Extraire les **design tokens** via [`PROMPT_TOKENS_EXPORT.md`](PROMPT_TOKENS_EXPORT.md), stack détectée
- Créer un **design-tokens.{css,dart,swift,kt}** au chemin standard du projet
- Remplacer les **valeurs hard-codées** (padding, colors, radii) par les tokens — **fichier par fichier**, PR par PR
- Pas de refonte visuelle à ce stade, juste tokenisation

**Chiffrage typique :** 1–2 jours solo dev / taille projet 20–50 écrans.

**Phase B — Core components (semaine 2)**

Objectif : unifier les composants essentiels.

Dans cet ordre (impact décroissant) :

1. **Button** — 1 set canonique (primary / secondary / ghost / destructive)
2. **Input** — 1 set (text / select / checkbox / radio) avec états complets
3. **Card** — 1 composant, border/shadow/radius depuis tokens
4. **Modal / Sheet / Drawer** — 1 par type, pas de custom per-screen
5. **Toast / Snackbar** — 1 système global

Pour chaque composant : refacto + test sur 3 screens + replace partout.

**Chiffrage typique :** 3–5 jours.

**Phase C — States coverage (semaine 3)**

Objectif : passer les états manquants sur tous les écrans critiques.

- Lister les **top 10 screens** par traffic / importance
- Pour chaque : auditer présence des 8 states via [`_fragments/states-coverage.md`](_fragments/states-coverage.md)
- Ajouter loading (skeleton) → empty → error → offline manquants
- Pas besoin de design fancy : empty state minimal = illustration + titre + CTA

**Chiffrage typique :** 2–4 jours.

**Phase D — Accessibility + polish (semaine 4+)**

Objectif : atteindre AA + polish.

- Run [`PROMPT_A11Y_AUDIT.md`](PROMPT_A11Y_AUDIT.md) full
- Fix P0 obligatoire pour AA compliance
- Fix P1 au fil de l'eau (pas bloquant)
- Ajouter animations (respecter `prefers-reduced-motion`)
- Ajouter dark mode si pas fait (remap surfaces, pas invert)
- Run [`PROMPT_UX_WRITING.md`](PROMPT_UX_WRITING.md) sur microcopy

**Chiffrage typique :** 5+ jours (dépend de la dette initiale).

### Phase 3 — Format du plan de sortie

```
# Migration Plan — [Projet]

## Gap analysis

| Dimension | Score actuel | Cible | Gap |
|-----------|-------------:|------:|-----|
| Design tokens | 20 % | 100 % | [N] valeurs hard-codées à remplacer |
| Composants | 40 % | 100 % | [N] composants dupliqués à fusionner |
| States coverage | 35 % | 100 % | [N] screens sans loading/empty/error |
| A11y | 60 % | 95 % | [N] P0 + [N] P1 à fixer |
| Wording | 70 % | 90 % | [N] strings à réécrire |

Score global : **X / 100**

## Top 3 quick wins (impact max, < 1 jour chacun)

1. [zone] [action] — "ça rend le projet cohérent en 2h"
2. …
3. …

## Phase A — Foundation
Durée : X jours · Livrables : tokens extraits + PR tokenisation

Tâches :
- [ ] Tâche 1
- [ ] Tâche 2

## Phase B — Core components
Durée : X jours · Livrables : 5 composants unifiés

Tâches :
- [ ] …

## Phase C — States coverage
Durée : X jours · Livrables : top 10 screens complètement couverts

## Phase D — A11y + polish
Durée : X jours · Livrables : AA compliant + dark mode

---

## Total estimé : X jours dev

## Risques

- [risque 1 + mitigation]
- …

## Ce qui ne change PAS

- [ce qu'on garde tel quel, volontairement]
- [pour éviter scope creep]

---

## Next steps

1. Validation du plan ("go plan")
2. Démarrer Phase A : run PROMPT_TOKENS_EXPORT → obtenir tokens.{stack}
3. PR tokenisation (commit par commit pour review facile)
```

---

## Règles d'or

1. **Migration progressive > big bang.** Chaque PR déployable. Pas de branche qui vit 3 mois.
2. **Tokens d'abord.** 80 % des problèmes de cohérence viennent de l'absence de tokens.
3. **Pareto : 20 % du travail = 80 % du résultat.** Les quick wins en Phase A + top 5 composants en Phase B livrent l'essentiel.
4. **Pas de refonte visuelle cachée.** Si tu changes le look d'un bouton, c'est un visible change qui doit être validé, pas un "refactor" silencieux.
5. **États manquants = dette invisible.** L'user rencontre un empty state une fois par semaine. Un loading state 10 fois par jour. Priorité inversée vs intuition.
6. **A11y baseline ≠ a11y perfect.** Vise AA, documentez les AAA futurs, ne laissez pas l'audit paralyser la livraison.

---

## Anti-comportements

- ❌ "On refait tout depuis zéro" — 6 mois de boulot, 0 shippé entre-temps
- ❌ Déclarer "design system fait" après 2 jours sans composants refactos
- ❌ Tokeniser SANS remplacer les valeurs hard-codées (juste ajouter un fichier = inutile)
- ❌ Ajouter des règles bible sans archiver les ancestors (créer des duplicates invisibles)
- ❌ Ignorer a11y "on y viendra après" (c'est toujours reporté, jamais fait)

---

## Chain

Après le plan, si l'user dit :

- **"go plan"** / **"démarre phase A"** → charge [`PROMPT_TOKENS_EXPORT.md`](PROMPT_TOKENS_EXPORT.md) pour seed les tokens (stack détectée)
- **"audit a11y d'abord"** → charge [`PROMPT_A11Y_AUDIT.md`](PROMPT_A11Y_AUDIT.md) pour évaluer la dette avant de commit
- **"review mon code existant"** → charge [`PROMPT_CODE_REVIEW.md`](PROMPT_CODE_REVIEW.md) sur le fichier le plus lourd
- **"implémente un écran"** → charge [`PROMPT_MASTER.md`](PROMPT_MASTER.md) pour attaquer
- **"ajuste le plan"** → reste dans ce prompt, on itère

Règle : un seul prompt actif. Si l'user chaîne, termine le courant d'abord.
