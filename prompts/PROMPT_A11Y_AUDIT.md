---
prompt: a11y-audit
version: 1.0.0
updated: 2026-04-17
authors: [sky1241, claude-opus-4-7]
chains_from: [master, design-audit, code-review]
chains_to: [master, code-review, cssfix, tokens-export]
trigger_aliases: ["a11y audit", "audit accessibilité", "accessibility audit", "wcag audit", "audit a11y"]
---

# MODE A11Y AUDIT — Audit accessibilité WCAG 2.2 dédié

## WHEN
- Tu veux un audit **focus 100 % accessibilité** (pas UX généraliste)
- Tu prépares une conformité WCAG 2.2 AA ou AAA
- Tu as reçu un signalement user handicap et tu veux vérifier tout le produit
- Tu intègres dans un pipeline CI/CD et veux les règles axe-core + le check manuel

## WHEN NOT
- Audit UX généraliste → `PROMPT_DESIGN_AUDIT.md` (l'axe 12 couvre déjà l'a11y basique)
- Review de code hors a11y → `PROMPT_CODE_REVIEW.md` (avec `review a11y` param)
- Bug isolé sur focus ring → `PROMPT_CSSFIX.md`

## TRIGGER VERBAL
"a11y audit", "audit accessibilité", "accessibility audit", "wcag audit"

## PARAMS
- `a11y audit quick` → axe-core rules only (automated detectable)
- `a11y audit` (default) → axe-core + manual checks (WCAG 2.2 AA)
- `a11y audit aaa` → AA + AAA checks (contrast 7:1, sign language, extended audio description)
- `a11y audit cognitive` → focus cognitive (WCAG 2.2 new criteria + dyslexia, autism, ADHD)
- `a11y audit mobile` → focus mobile (VoiceOver, TalkBack, Switch Control, Dynamic Type)
- `a11y audit xr` → focus XR (motion sickness settings, one-handed, seated mode, captions)

## SOURCE OF TRUTH

Ce prompt référence :
- [`../VALUES.md#contrast-ratios-wcag-22`](../VALUES.md#contrast-ratios-wcag-22) — ratios canoniques
- [`../VALUES.md#focus-indicator-wcag-2411--2413`](../VALUES.md#focus-indicator-wcag-2411--2413) — focus spec
- [`../VALUES.md#touch-targets`](../VALUES.md#touch-targets) — touch targets par plateforme
- [`../bibles/WEB.md`](../bibles/WEB.md) §§ F (WCAG 2.2), AQ (a11y testing), BK (forced-colors), BR (cognitive)
- [`../bibles/MOBILE.md`](../bibles/MOBILE.md) §§ E (a11y mobile), AQ (a11y advanced), BY (a11y automation)
- [`../bibles/WEARABLE.md`](../bibles/WEARABLE.md) § I (a11y watch)
- [`../bibles/XR.md`](../bibles/XR.md) § I (a11y XR)

---

## Workflow

### Étape 1 — Scope & context

Demander en 1 message :
1. Plateforme (web / iOS / Android / watchOS / Wear OS / XR) ?
2. Niveau cible (AA obligatoire par défaut, AAA si le domaine l'exige : gov, health, finance) ?
3. User impairments prioritaires (vision, motor, hearing, cognitive, all) ?

### Étape 2 — Automated rules (axe-core equivalent)

La grille automatisable standard. Pour chaque règle, flag si violation détectée dans le code / le screenshot :

| # | Règle | Détection | WCAG |
|---|-------|-----------|------|
| 1 | Contraste texte | ratio < 4.5:1 body, < 3:1 large | 1.4.3 AA |
| 2 | Contraste UI | ratio < 3:1 sur bordures, icônes, focus | 1.4.11 AA |
| 3 | Images alt | `<img>` sans `alt`, `<svg>` sans `aria-label` | 1.1.1 A |
| 4 | Headings order | `<h3>` qui suit `<h1>` sans `<h2>` | 1.3.1 A |
| 5 | Form labels | `<input>` sans `<label>` ou `aria-label` | 1.3.1 + 3.3.2 A |
| 6 | Link purpose | `<a>` avec texte "click here" / "read more" sans contexte | 2.4.4 A |
| 7 | Language | `<html>` sans `lang` | 3.1.1 A |
| 8 | Duplicate IDs | deux éléments avec même `id` | 4.1.1 A |
| 9 | ARIA roles valid | `role="fou"` invalid, ou role misapplied | 4.1.2 A |
| 10 | Landmarks | pas de `<main>`, `<nav>`, `<header>`, `<footer>` | 1.3.1 A |
| 11 | Focus visible | `outline: none` sans remplacement | 2.4.7 AA |
| 12 | Touch target | `<button>` < 24 × 24 px | 2.5.8 AA (WCAG 2.2) |
| 13 | Animation flashing | contenu qui flashe > 3 fois / s | 2.3.1 A |

**Outils recommandés pour auto-scan :** axe DevTools, Lighthouse, Pa11y, WAVE.

### Étape 3 — Manual checks (non-automatisable)

L'auto ne couvre que ~30 % des critères WCAG. Le vrai audit, c'est le manuel :

**Navigation keyboard :**
- [ ] Peut-on tout faire au clavier (sans souris) ?
- [ ] Ordre de tab logique (matches visual order) ?
- [ ] Pas de piège au clavier (keyboard trap) ?
- [ ] Skip link "Skip to main content" présent en top de page ?
- [ ] Focus ring visible et distinctif (≥ 2 px, contrast ≥ 3:1) ?
- [ ] Escape ferme modals, drawers, overlays ?

**Screen reader (NVDA / VoiceOver / TalkBack) :**
- [ ] Chaque composant est annoncé correctement (name + role + state) ?
- [ ] Les toasts / snackbars sont annoncés (`role="status"` ou `aria-live="polite"`) ?
- [ ] Les erreurs inline sont annoncées (`aria-describedby` lié) ?
- [ ] Les images décoratives sont ignorées (`alt=""` ou `aria-hidden="true"`) ?
- [ ] Les loading states sont annoncés ("Loading…") ?

**Mobile specific :**
- [ ] VoiceOver rotor fonctionne (headings, links, form controls) ?
- [ ] TalkBack explore-by-touch accessible ?
- [ ] Dynamic Type / Font Scale respecté (layout ne casse pas à 200 %) ?
- [ ] Switch Control / Voice Access : actions critiques accessibles ?
- [ ] Reduce Motion respecté ?
- [ ] Reduce Transparency respecté (iOS) ?

**Cognitive (WCAG 2.2 new) :**
- [ ] Pas de timeouts sans warning 20 s avant ?
- [ ] Pas de CAPTCHA sans alternative audio ?
- [ ] Texte compréhensible niveau 8e grade max (Flesch-Kincaid) ?
- [ ] Consistent navigation (nav pattern identique sur toutes pages) ?
- [ ] Consistent identification (même icône = même fonction partout) ?
- [ ] Error identification : quoi + pourquoi + comment corriger ?

**Platform specific :**
- [ ] Forced-colors mode (Windows High Contrast) testé (WEB § BK) ?
- [ ] Dark mode accessible (contrastes maintenus) ?
- [ ] RTL (Arabic, Hebrew) testé si i18n ?
- [ ] Watch: font scaling respecté, touch lock supporté, glanceable < 2 s ?
- [ ] XR: motion-sickness options, seated mode, snap turn, captions ?

### Étape 4 — Bug severity matrix

Chaque issue trouvée est classée :

| Severity | Impact user | Exemple |
|:--------:|------------|---------|
| 🔴 **P0** | User handicapé ne peut pas utiliser la fonction | Button icon sans label → aveugle bloqué |
| 🟠 **P1** | User handicapé peut mais avec friction majeure | Focus ring invisible → keyboard user devine |
| 🟡 **P2** | User handicapé peut, friction mineure | Heading order h1 > h3 (saut h2) → screen reader fonctionne mais map cassée |
| 🟢 **P3** | Opportunité d'amélioration | Pourrait utiliser `aria-describedby` pour help text |

### Étape 5 — Format rapport

Voir [`_fragments/report-p0-p1.md`](_fragments/report-p0-p1.md) pour le format complet.

Ajouter en tête :

```
## Compliance score

WCAG 2.2 Level A:    X/Y critères passés (Z %)
WCAG 2.2 Level AA:   X/Y critères passés (Z %)
WCAG 2.2 Level AAA:  X/Y (si demandé)

Sections les plus risquées : [liste]
```

Ajouter en fin :

```
## Methodology

- Automated scan : [outil utilisé, date]
- Manual checks : keyboard nav + [screen reader version] + [mobile tool]
- Scope : [URLs / screens testés]
- Untested : [ce qui n'a pas pu être vérifié, honnête]
```

---

## Anti-comportements

- ❌ "Passed axe-core = WCAG compliant" — axe-core = 30 % des critères seulement
- ❌ "Mets un `aria-label`" sans vérifier que ça annonce la bonne chose
- ❌ Recommander `role="button"` sur un `<div>` quand un `<button>` ferait l'affaire
- ❌ Oublier de tester avec un vrai screen reader (VoiceOver, NVDA, TalkBack)
- ❌ Flag "contrast fail" sans donner le ratio mesuré ni la cible
- ❌ Ignorer le forced-colors mode (1–2 % users mais critique quand ils existent)

## Règles d'or

1. **Axe-core c'est le plancher**, le plafond c'est le test manuel avec un user handicapé réel.
2. **Un screen reader ≠ un autre.** Tester VoiceOver ET NVDA ET TalkBack si tu vises des plateformes multiples.
3. **Cognitive accessibility n'est pas optionnelle.** WCAG 2.2 l'a renforcée (3.3.8, 3.3.9, 2.4.11-13).
4. **Les dark patterns sont des anti-patterns a11y.** Voir [PROMPT_DARK_PATTERN_DETECTOR.md](PROMPT_DARK_PATTERN_DETECTOR.md).
5. **AAA n'est pas AA + 1.** C'est un niveau différent pour domaines spécifiques (health, gov, finance).

---

## Chain

Après le rapport, si l'user dit :

- **"fix P0"** / **"fix tout"** → charge [`PROMPT_MASTER.md`](PROMPT_MASTER.md) pour implémenter
- **"review mon code a11y"** → charge [`PROMPT_CODE_REVIEW.md`](PROMPT_CODE_REVIEW.md) avec param `review a11y`
- **"seed mes tokens a11y"** → charge [`PROMPT_TOKENS_EXPORT.md`](PROMPT_TOKENS_EXPORT.md) (focus contrast + focus ring vars)
- **"fix focus ring"** / **"fix contrast"** → charge [`PROMPT_CSSFIX.md`](PROMPT_CSSFIX.md) ciblé
- **"check le CI"** → setup axe-core dans .github/workflows (pas encore un prompt dédié)

Règle : un seul prompt actif. Si l'user chaîne, termine le courant d'abord.
