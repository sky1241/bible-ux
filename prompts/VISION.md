# Vision — où les prompts de bible-ux peuvent aller

> Ce document n'est pas un prompt utilisateur. C'est la feuille de route **v2.0** du système de prompts. Il cadre où on est aujourd'hui, ce qui cloche, et ce qui serait vraiment pro. À réviser quand on push des améliorations.

État actuel : **v1.4 · 13 prompts · ~6 500 lignes de contenu prompt**.

---

## 1. Où on en est (honnête)

### Ce qui marche
- Un **router** (`prompts/README.md`) + un **primer** (`PROMPT_MASTER.md`) : l'user n'est plus perdu.
- Des **WHEN / WHEN NOT / TRIGGER VERBAL** standardisés en tête de chaque prompt.
- **VALUES.md** comme source canonique unique → les prompts cessent de redéfinir les mêmes chiffres.
- Couverture fonctionnelle réelle : master, audit, css-fix, tokens, pick-pattern, spec-from-scratch, code-review, reprise, intégration DR, test créatif, 3 DR prompts.

### Ce qui cloche encore
1. **`PROMPT_DESIGN_AUDIT.md` fait 935 lignes.** Il duplique palette, typo, spacing, shadow qui vivent déjà dans VALUES.md. Réduire à ~300 lignes en référençant VALUES.
2. **Aucun prompt n'a de version propre.** Le CHANGELOG est global → on ne sait pas si un prompt a changé entre deux commits. Besoin : frontmatter `version:` par prompt.
3. **Aucun prompt n'est paramétrable.** Tout est "one-size". Un user voudrait parfois un audit rapide (3 axes), parfois approfondi (12 axes). Besoin : params en entrée.
4. **Aucun feedback loop.** Claude exécute un prompt, livre le résultat, fin. Pas de "est-ce que ça a marché ?" → pas d'amélioration empirique du prompt.
5. **Pas de chain déclarée.** `pick-pattern → master` / `audit → code-review` / `spec → tokens` sont des enchaînements naturels mais non formalisés. L'user doit les reconstruire à chaque fois.
6. **Pas de mémoire projet.** Claude oublie entre sessions que "ce projet est Tailwind v4, iOS 17+, dark mode obligatoire". Résultat : même brief, répété chaque fois.
7. **Pas de sub-prompts / fragments réutilisables.** "Les 7 péchés du noob", "la grille 12 axes", "le format de rapport P0/P1/P2" sont dupliqués dans plusieurs prompts. Besoin : fragments partagés.
8. **Pas de self-audit du repo.** Aucun prompt ne vérifie que les bibles elles-mêmes sont cohérentes (pas de contradictions, pas de règles obsolètes, pas de cross-refs cassées).
9. **Pas de mode adversarial.** Tous les prompts sont "yes-man" : ils exécutent ce qu'on leur demande. Un devil's advocate mode aurait une vraie valeur (attaquer une décision design avant de la shipper).
10. **Couverture manquante** : a11y automation testing, content strategy / UX writing, dark pattern detection, growth hacking éthique (urgency / scarcity légitimes), user research synthesis.

---

## 2. Les 10 leviers d'amélioration (v2.0)

### Levier 1 — Compression (halve the size)

**Objectif** : aucun prompt > 500 lignes. Moyenne cible : 200 lignes.

**Méthode** :
- Remplacer tables de valeurs par `see VALUES.md § Spacing`.
- Remplacer sections théoriques longues par 2 lignes + bible ref.
- Extraire les fragments partagés dans `prompts/_fragments/` (voir levier 6).

**Impact** :
- Context window user ne mange pas 1 000 lignes par prompt chargé.
- Moins de duplication = moins de drift quand VALUES.md change.
- Plus facile à maintenir à 2 mains (bientôt si GitHub Sponsors active).

**Premier candidat** : `PROMPT_DESIGN_AUDIT.md` 935 → 300 lignes.

### Levier 2 — Versioning par prompt

**Objectif** : savoir quand chaque prompt a bougé.

**Méthode** : frontmatter YAML en tête de chaque `.md` :

```yaml
---
prompt: design-audit
version: 2.1.0
updated: 2026-04-17
authors: [sky1241, claude-opus-4-7]
chains_from: [master, pick-pattern, spec-from-scratch]
chains_to: [code-review, tokens-export, master]
trigger_aliases: [audit, c'est moche, rend ça pro]
---
```

**Impact** :
- CHANGELOG par prompt (via git log sur le frontmatter).
- Router peut afficher "PROMPT_DESIGN_AUDIT v2.1 (updated 2026-04-17)".
- Cross-refs explicites entre prompts → graphe utilisable.

### Levier 3 — Paramètres

**Objectif** : un prompt, plusieurs profondeurs.

**Méthode** : convention de params à la fin du trigger verbal :

```
"audit quick"      → AUDIT avec 3 axes au lieu de 12
"audit deep"       → 12 axes + animation analysis + perf + SEO
"audit a11y"       → focus 100% accessibility
"audit conv"       → focus conversion (Baymard metrics)
"review strict"    → P0–P3 tout détecté
"review p0-only"   → seulement bloquant
"spec rapide"      → version ≤ 500 mots
"spec exhaustive"  → full 8 sections
```

**Impact** :
- L'user peut calibrer le coût / la précision par session.
- Même prompt = multiple use cases sans multiplier les fichiers.

### Levier 4 — Chain formalisée

**Objectif** : enchaîner les prompts sans répéter le contexte.

**Méthode** : chaque prompt termine par un bloc **CHAIN** :

```
## Chain
- Si user dit "go" / "on attaque" → charge PROMPT_MASTER.md avec contexte = cette session
- Si user dit "export ça" → charge PROMPT_TOKENS_EXPORT.md avec format = stack détecté
- Si user dit "review le résultat" → charge PROMPT_CODE_REVIEW.md
```

**Impact** :
- Workflow multi-étapes devient fluide (`spec → tokens → master → code-review`).
- Claude n'a pas à re-poser les mêmes questions entre chaque step.

### Levier 5 — Mémoire projet

**Objectif** : les préférences du projet persistent entre sessions.

**Méthode** : convention `.bible-ux/project.json` dans le projet utilisateur :

```json
{
  "bible_version": "1.4.0",
  "stack": ["react", "tailwind-v4", "typescript"],
  "targets": ["web", "ios"],
  "a11y_level": "AA",
  "brand": {
    "primary": "#3B82F6",
    "font_primary": "Inter",
    "font_display": "Space Grotesk"
  },
  "locked_tokens": "src/styles/tokens.css",
  "project_prompts": [
    "PROMPT_REPRISE_infernal_wheel.md"
  ]
}
```

Le `PROMPT_MASTER.md` lit ce fichier en startup → bascule automatiquement les defaults (pas besoin de redire "c'est Tailwind v4" chaque session).

**Impact** :
- Vrai sentiment de "mon assistant design personnel", pas un outil générique.
- Cohérence cross-session garantie.

### Levier 6 — Fragments partagés

**Objectif** : DRY sur les portions réutilisées.

**Méthode** : `prompts/_fragments/` avec des fichiers nommés :

```
_fragments/
  ├── the-7-sins.md              # utilisé par DESIGN_AUDIT, CODE_REVIEW
  ├── the-12-axes.md             # utilisé par DESIGN_AUDIT, SPEC_FROM_SCRATCH
  ├── report-format-p0-p1.md     # utilisé par DESIGN_AUDIT, CODE_REVIEW
  ├── states-coverage-checklist.md  # utilisé par SPEC, AUDIT, REVIEW
  ├── semantic-html-checklist.md
  └── chain-footer.md            # le bloc CHAIN standardisé
```

Les prompts incluent via `{{ include: _fragments/the-12-axes.md }}` (runtime template ou simple copy-on-render).

**Impact** :
- 1 endroit où mettre à jour un standard (le fragment) → tous les prompts qui l'utilisent bénéficient.
- Moins de risque d'incohérence entre prompts.

### Levier 7 — Self-audit meta-prompt

**Objectif** : un prompt qui **audite les bibles elles-mêmes**.

**Idée** : `PROMPT_META_AUDIT.md`

- Scanne WEB / MOBILE / WEARABLE / XR / ICONS / DESIGN_TREE / VALUES
- Cherche :
  - Contradictions entre fichiers (ex. MOBILE dit touch 44 pt iOS, XR dit 60 pt visionOS → documenter que c'est intentionnel, pas une contradiction)
  - Cross-refs cassées (ex. "see WEB § CR" mais WEB § CR n'existe plus)
  - Valeurs stale (ex. "iOS 17+" quand iOS 19 est sorti)
  - Sources mortes (URLs 404)
  - Sections très courtes (< 20 lignes) qui mériteraient expansion
- Produit un rapport → priorité de curation

**Run cadence** : trimestriel + après chaque intégration DR.

### Levier 8 — Feedback loop

**Objectif** : apprendre ce qui marche.

**Méthode** : à la fin de chaque prompt, option :

```
Ça t'a aidé ?
- "✓" → log juste la trigger + timestamp
- "✗ [raison]" → log la trigger + ce qui a manqué → accumule dans prompts/FEEDBACK.md
```

Tous les 3 mois, review du FEEDBACK.md → patch les prompts qui déçoivent. Très léger, mais ça permet de détecter que "PROMPT_SPEC_FROM_SCRATCH oublie souvent l'offline state" → fix documenté.

### Levier 9 — Mode adversarial (devil's advocate)

**Objectif** : attaquer une décision design avant qu'elle soit shipée.

**Idée** : `PROMPT_DEVILS_ADVOCATE.md`

- L'user présente une décision ("je vais mettre infinite scroll sur ma liste de factures")
- Claude attaque la décision selon 3 axes :
  - **Research contre** : Baymard / NN/g / CHI papers qui contredisent
  - **Anti-patterns** cités dans les bibles qui matchent ce cas
  - **Edge cases** que la décision va casser (offline, a11y, i18n, scale)
- Si l'user résiste aux arguments → Claude valide.
- Si l'user plie → Claude propose l'alternative.

**Pourquoi c'est puissant** : la plupart des erreurs design ne viennent pas d'ignorance, mais de decisions non-challenged.

### Levier 10 — Couverture à étendre

**Prompts manquants, par ordre de valeur :**

| Prompt | Valeur | Complexité |
|--------|:------:|:----------:|
| `PROMPT_A11Y_AUDIT.md` — audit a11y dédié (axe-core rules + manual pass) | ⭐⭐⭐ | Moyenne |
| `PROMPT_UX_WRITING.md` — microcopy / ton / button labels / empty states | ⭐⭐⭐ | Facile |
| `PROMPT_DARK_PATTERN_DETECTOR.md` — flag les dark patterns dans un flow | ⭐⭐ | Moyenne |
| `PROMPT_MIGRATE_TO_BIBLE.md` — audite un projet existant et produit un plan de migration par priorité | ⭐⭐⭐ | Élevée |
| `PROMPT_VISUAL_QA.md` — compare screenshot before/after et flag regressions | ⭐⭐ | Haute (vision model) |
| `PROMPT_I18N_CHECKLIST.md` — prep un projet pour internationalization | ⭐⭐ | Facile |
| `PROMPT_PERF_BUDGET.md` — définit et check un perf budget avec Lighthouse + Web Vitals | ⭐⭐ | Moyenne |
| `PROMPT_GROWTH_UX.md` — patterns growth éthiques (onboarding conversion, referral, retention) | ⭐⭐⭐ | Moyenne |
| `PROMPT_DESIGN_HANDOFF.md` — génère handoff spec depuis un design (Figma ou screenshot) | ⭐⭐ | Moyenne |

---

## 3. Priorités v2.0 (roadmap concrète)

### Sprint 1 — Nettoyage + structure (2–3 jours de work)

1. Compresser `PROMPT_DESIGN_AUDIT.md` 935 → 300 lignes (levier 1).
2. Créer `prompts/_fragments/` avec les 5 fragments réutilisables identifiés (levier 6).
3. Ajouter le frontmatter YAML versioning à tous les prompts (levier 2).
4. Ajouter le bloc CHAIN standardisé à tous les prompts (levier 4).

### Sprint 2 — Paramètres + feedback (2 jours)

5. Ajouter params `quick / deep / focus=X` sur DESIGN_AUDIT, CODE_REVIEW, SPEC (levier 3).
6. Créer `prompts/FEEDBACK.md` + protocole de logging (levier 8).

### Sprint 3 — Mémoire projet + self-audit (3 jours)

7. Convention `.bible-ux/project.json` documentée + PROMPT_MASTER lit le fichier en startup (levier 5).
8. `PROMPT_META_AUDIT.md` écrit et run (levier 7). Rapport initial → curation.

### Sprint 4 — Extensions de couverture (continu)

9. Choisir 3 prompts dans la table "Prompts manquants" par priorité business (levier 10).
10. `PROMPT_DEVILS_ADVOCATE.md` (levier 9).

---

## 4. Grands principes à ne pas trahir

1. **Evidence-based > vibes.** Chaque règle d'un prompt renvoie à une section bible ou source externe.
2. **VALUES > bibles > prompts.** Hiérarchie stricte, jamais de conflit toléré.
3. **Shorter is better.** Un prompt de 300 lignes qui dit les bonnes choses bat un prompt de 1 000 qui dilue.
4. **Router first, content second.** Si l'user ne sait pas quel prompt utiliser, le contenu ne sert à rien.
5. **Chain over clone.** On enchaîne des prompts spécialisés, on ne crée pas un mega-prompt qui fait tout.
6. **User's pain, not our pride.** Chaque prompt répond à une friction réelle du user, pas à l'envie d'avoir un fichier en plus.
7. **Feedback > perfection.** Ship un prompt à 80 %, log les manques, itère. Pas de prompt "définitif".

---

## 5. Métriques de succès du système de prompts

Pour v2.0 on veut mesurer :

- **Taux d'usage par prompt** : combien de fois chaque prompt est déclenché dans une session (proxy : trigger verbal dans transcripts).
- **Ratio dormant** : nombre de prompts jamais triggered vs total. Cible : < 20 %.
- **Temps moyen par session** : si PROMPT_MASTER route bien, une session type devrait tenir < 20 messages.
- **Nombre de bible refs / réponse** : proxy de "evidence-based". Cible ≥ 3 refs par réponse significative.
- **Feedback ✗ rate** : % de fois où le prompt rate. Cible : < 15 %.

---

## 6. Ce que ce document n'est PAS

- Pas une to-do figée. Si l'user trouve un 11e levier, on l'ajoute.
- Pas un roadmap public agressif. On avance à son rythme, pas besoin d'annoncer sur Twitter.
- Pas une doctrine. Si un levier s'avère inutile à l'usage, on le jette sans ego.

---

*Next review de ce document : après Sprint 1 (compression + fragments + frontmatter).*
