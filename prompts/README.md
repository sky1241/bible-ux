# prompts/ — routing guide

> Which prompt do I use, when? Start here.
> Each prompt has a single job. Don't invoke more than one at a time.

---

## The decision tree

```
                     Qu'est-ce que tu veux faire ?
                                │
      ┌─────────────────────────┼─────────────────────────┬────────────────────┐
      │                         │                         │                    │
  Je démarre               J'ai un            Je lance / intègre       Je veux sortir
  une session                problème              une Deep              des règles
   Claude                      UI                   Research            (mode créatif)
      │                         │                         │                    │
      │                         │                         │                    │
      ▼                         ▼                         ▼                    ▼
 PROMPT_MASTER          ┌───────┴────────┐      ┌─────────┴──────────┐    PROMPT_TEST_
 (coller au début)      │                │      │                    │      CREATIF
                     Bug  CSS        Audit pro    Export tokens     Lancer              Intégrer
                   aligné/         depuis         (CSS/Flutter/     une DR             résultats
                   overflow        screenshot      SwiftUI...)      ChatGPT             ChatGPT
                       │                │              │                │                 │
                       ▼                ▼              ▼                ▼                 ▼
                   PROMPT_         PROMPT_       PROMPT_          PROMPT_DEEP_        PROMPT_
                   CSSFIX         DESIGN_       TOKENS_           RESEARCH_*         INTEGRATION_
                                  AUDIT         EXPORT           (MASSIVE,           DEEP_RESEARCH
                                                                  WEARABLE, XR)
```

---

## Routing table — "situation → prompt → mot-clé"

| Ta situation | Prompt | Trigger verbal | Lignes |
|--------------|--------|----------------|-------:|
| Nouvelle session Claude/GPT, je veux qu'il connaisse la bible | [PROMPT_MASTER.md](PROMPT_MASTER.md) | "charge la bible", "mode bible" | ~200 |
| Screenshot → "c'est moche, rend ça pro" | [PROMPT_DESIGN_AUDIT.md](PROMPT_DESIGN_AUDIT.md) | "audit", "c'est moche", "fix le design" | 921 |
| Bug visuel précis : alignement, spacing, overflow | [PROMPT_CSSFIX.md](PROMPT_CSSFIX.md) | "css fix", "pas droit", "aligne ça" | 96 |
| Exporter VALUES.md en tokens CSS / Tailwind / Flutter / SwiftUI / Compose / Android XML / Figma | [PROMPT_TOKENS_EXPORT.md](PROMPT_TOKENS_EXPORT.md) | "export tokens", "génère les tokens [format]", "seed design system" | ~480 |
| Je reprends après pause, je suis crevé, Claude propose, je valide | [PROMPT_REPRISE.md](PROMPT_REPRISE.md) | "mode reprise", "mode autonome" | 426 |
| Je veux du créatif pur, sans citation de règles | [PROMPT_TEST_CREATIF.md](PROMPT_TEST_CREATIF.md) | "surprends-moi", "sors des règles" | 30 |
| J'ai les résultats d'une Deep Research ChatGPT à intégrer | [PROMPT_INTEGRATION_DEEP_RESEARCH.md](PROMPT_INTEGRATION_DEEP_RESEARCH.md) | "integre la deep research" | 154 |
| Je veux lancer une Deep Research universelle (~100 pages) | [PROMPT_DEEP_RESEARCH_MASSIVE.md](PROMPT_DEEP_RESEARCH_MASSIVE.md) | (copier dans ChatGPT) | 645 |
| Je veux lancer une DR spécifique smartwatch (~170 pages) | [PROMPT_DEEP_RESEARCH_WEARABLE.md](PROMPT_DEEP_RESEARCH_WEARABLE.md) | (copier dans ChatGPT) | 1059 |
| Je veux lancer une DR spécifique XR / spatial computing (~150 pages) | [PROMPT_DEEP_RESEARCH_XR.md](PROMPT_DEEP_RESEARCH_XR.md) | (copier dans ChatGPT) | 997 |

---

## Quick rules

1. **Un seul prompt actif à la fois.** Si tu passes de "audit" à "fix", clos mentalement l'audit d'abord.
2. **Commence par PROMPT_MASTER** si c'est une nouvelle conversation longue. Sinon pour un one-shot direct, appelle le prompt spécifique.
3. **Les DR prompts** ne s'utilisent pas dans Claude/bible-ux directement — ils se **collent dans ChatGPT Deep Research**, puis les résultats reviennent ici via INTEGRATION.
4. **Les triggers verbaux** sont des alias : dis "audit" → Claude sait quoi charger. Dis "c'est pas droit" → CSSFIX s'active.
5. **Doute ?** → [PROMPT_MASTER.md](PROMPT_MASTER.md) sait router pour toi. C'est le seul qu'il faut connaître par cœur.

---

## Quand PAS utiliser ces prompts

- Pour coder sans design — les prompts ne remplacent pas ton éditeur ou GitHub Copilot.
- Pour du contenu / copywriting — les bibles couvrent microcopy mais pas le marketing.
- Pour des tâches non-UX (tests, build, deploy) — utilise les outils standard.

---

## Overlap résolu

Deux prompts se chevauchent partiellement. Règle :

- **DESIGN_AUDIT vs REPRISE** — DESIGN_AUDIT c'est une tâche ponctuelle (une critique de screenshot). REPRISE c'est un mode permanent (toute la session tu proposes/je valide). Si tu travailles sur le projet, REPRISE. Si tu balances juste un screenshot, AUDIT.
- **CSSFIX vs DESIGN_AUDIT** — CSSFIX = bug précis localisé (padding asymétrique). AUDIT = critique globale (toute la page est moche). Si c'est 1-2 problèmes, CSSFIX. Si c'est > 3, AUDIT.

---

## Si tu crées un nouveau prompt

1. Ajouter une ligne dans la routing table ci-dessus.
2. Ajouter une branche dans le flowchart ASCII.
3. Mettre en tête du prompt un bloc `## WHEN / WHEN NOT` (format standardisé, voir prompts existants).
4. Ajouter un trigger verbal unique et mémorable.
