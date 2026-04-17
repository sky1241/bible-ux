# Commandes — cheatsheet FR

> Raccourcis verbaux pour déclencher les prompts de bible-ux dans une session Claude / ChatGPT / Gemini.
> Pour la version structurée en flowchart voir [prompts/README.md](prompts/README.md).

---

## Comment utiliser

- Dans ta session AI, colle [`prompts/PROMPT_MASTER.md`](prompts/PROMPT_MASTER.md) une fois au début.
- Ensuite dis juste le trigger verbal dans ta demande.
- L'IA route automatiquement vers le bon prompt.

---

## Les modes disponibles

### 1. Mode Master / Charge la bible

- **Fichier** : [prompts/PROMPT_MASTER.md](prompts/PROMPT_MASTER.md)
- **Quand** : début de nouvelle session
- **Trigger** : "charge la bible", "mode bible", "active bible-ux"

### 2. Mode Reprise (ou Mode Autonome)

- **Fichier** : [prompts/PROMPT_REPRISE.md](prompts/PROMPT_REPRISE.md)
- **Quand** : tu reprends après pause, tu es fatigué, tu veux valider des propositions plutôt que formuler
- **Trigger** : "mode reprise", "mode autonome", "reprend"

| Tu dis | Claude fait |
|--------|-------------|
| "ok" / "go" / "oui" | Exécute les propositions |
| "non" / "stop" | Arrête et demande quoi changer |
| "push" | Commit + push GitHub |
| "relance" | Restart serveur (si applicable) |
| "c'est moche" | Route vers PROMPT_DESIGN_AUDIT |

### 3. Mode Design Audit

- **Fichier** : [prompts/PROMPT_DESIGN_AUDIT.md](prompts/PROMPT_DESIGN_AUDIT.md)
- **Quand** : screenshot à critiquer, > 3 problèmes visuels
- **Trigger** : "audit", "c'est moche", "rend ça pro", "fix le design"

### 4. Mode CSS Fix

- **Fichier** : [prompts/PROMPT_CSSFIX.md](prompts/PROMPT_CSSFIX.md)
- **Quand** : bug CSS précis (1–3 problèmes localisés)
- **Trigger** : "css fix", "pas droit", "aligne ça", "ça déborde"

### 5. Mode Tokens Export

- **Fichier** : [prompts/PROMPT_TOKENS_EXPORT.md](prompts/PROMPT_TOKENS_EXPORT.md)
- **Quand** : tu veux exporter VALUES.md en config importable
- **Trigger** : "export tokens", "seed design system", "génère les tokens [format]"
- **Formats** : CSS, Tailwind, Flutter, SwiftUI, iOS UIKit, Compose, Android XML, Figma JSON

### 6. Mode Pick Pattern

- **Fichier** : [prompts/PROMPT_PICK_PATTERN.md](prompts/PROMPT_PICK_PATTERN.md)
- **Quand** : tu hésites entre plusieurs patterns (tab vs drawer, modal vs sheet)
- **Trigger** : "quel pattern", "quelle nav", "tab ou drawer", "help me choose"

### 7. Mode Spec From Scratch

- **Fichier** : [prompts/PROMPT_SPEC_FROM_SCRATCH.md](prompts/PROMPT_SPEC_FROM_SCRATCH.md)
- **Quand** : nouveau projet greenfield, tu décris l'app → tu veux une spec design complète
- **Trigger** : "spec mon app", "from scratch", "nouveau projet"

### 8. Mode Code Review

- **Fichier** : [prompts/PROMPT_CODE_REVIEW.md](prompts/PROMPT_CODE_REVIEW.md)
- **Quand** : tu veux reviewer un diff, un PR, un snippet contre les bibles
- **Trigger** : "review code", "review ce diff", "audit mon code"

### 9. Mode Test Créatif

- **Fichier** : [prompts/PROMPT_TEST_CREATIF.md](prompts/PROMPT_TEST_CREATIF.md)
- **Quand** : tu veux du créatif pur sans citation de règles
- **Trigger** : "surprends-moi", "sors des règles"

### 10. Mode Intégration Deep Research

- **Fichier** : [prompts/PROMPT_INTEGRATION_DEEP_RESEARCH.md](prompts/PROMPT_INTEGRATION_DEEP_RESEARCH.md)
- **Quand** : tu as lancé une DR ChatGPT, tu veux intégrer les résultats
- **Trigger** : "integre la deep research", "integre tout", "verifie doublons"

### 11. Deep Research prompts (à coller dans ChatGPT, pas dans Claude)

- [prompts/PROMPT_DEEP_RESEARCH_MASSIVE.md](prompts/PROMPT_DEEP_RESEARCH_MASSIVE.md) — UX universel (~100 pages cible)
- [prompts/PROMPT_DEEP_RESEARCH_WEARABLE.md](prompts/PROMPT_DEEP_RESEARCH_WEARABLE.md) — Smartwatch (~170 pages cible)
- [prompts/PROMPT_DEEP_RESEARCH_XR.md](prompts/PROMPT_DEEP_RESEARCH_XR.md) — XR / spatial / smart glasses (~150 pages cible)

---

## Raccourcis rapides (utilisables à tout moment)

| Tu dis | Effet |
|--------|-------|
| "go" / "ok" / "oui" | Exécute ce qui a été proposé |
| "non" / "stop" | Annule, demande quoi changer |
| "push" | Commit + push sur GitHub |
| "relance" | Restart serveur local |
| "c'est moche" | Mode holistique (redesign créatif) |
| "optimise" | Audit complet vs règles UX |
| "intègre les règles UX" | Grep intelligent dans WEB / MOBILE / WEARABLE |

---

## Fichiers de référence

- [bibles/](bibles/) — les 5 bibles (WEB, MOBILE, WEARABLE, XR, ICONS)
- [DESIGN_TREE.md](DESIGN_TREE.md) — arbre de décision + index cross-réf (lire en premier si tu hésites)
- [VALUES.md](VALUES.md) — source canonique pour tous les chiffres (touch, spacing, contraste, timings)
- [prompts/README.md](prompts/README.md) — routeur avec flowchart
- [prompts/VISION.md](prompts/VISION.md) — roadmap v2.0 du système de prompts
- [ROADMAP.md](ROADMAP.md) — ce qui est prévu
- [CHANGELOG.md](CHANGELOG.md) — historique des changements

---

*Dernière mise à jour : 2026-04-17*
