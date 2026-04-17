# Chain footer — standardized routing block

> Every prompt ends with a `## Chain` block that declares what prompts to route to based on user signals.

## Standard format

```markdown
## Chain

Après avoir exécuté ce prompt, si l'user dit :

- **"go"** / **"on attaque"** / **"fix"** → charge `PROMPT_MASTER.md` et implémente les fixes validés
- **"export tokens"** / **"seed design"** → charge `PROMPT_TOKENS_EXPORT.md` avec le stack détecté
- **"review le code"** / **"check mon diff"** → charge `PROMPT_CODE_REVIEW.md`
- **"audit autre écran"** → reset le contexte et route vers `PROMPT_DESIGN_AUDIT.md`
- **"quel pattern pour X"** → charge `PROMPT_PICK_PATTERN.md`
- **"spec from scratch"** → charge `PROMPT_SPEC_FROM_SCRATCH.md`

Règle : ne charge **qu'un seul** prompt à la fois. Si l'user veut enchaîner plusieurs, termine le premier avant de passer au suivant.
```

## Règles

1. **Maximum 6 chains** par prompt. Au-delà, l'user se perd.
2. **Mots-clés courts** (2–4 mots) pour les triggers. L'user doit pouvoir les taper sans réfléchir.
3. **Toujours "go" / "on attaque" → MASTER.** C'est le default universel pour "on passe à l'implémentation".
4. **Pas de chaîne circulaire.** Si A → B et B → A, l'user peut boucler. Vérifier mentalement le graphe.

## Chain graph (pour référence)

```
PROMPT_MASTER (entry point)
  ├── PROMPT_PICK_PATTERN ──► PROMPT_MASTER (retour implémentation)
  ├── PROMPT_DESIGN_AUDIT ──► PROMPT_MASTER (retour fix)
  │                       └──► PROMPT_CSSFIX (si 1–3 bugs précis)
  ├── PROMPT_CSSFIX ──► PROMPT_MASTER (retour fix)
  ├── PROMPT_SPEC_FROM_SCRATCH ──┬──► PROMPT_TOKENS_EXPORT
  │                               ├──► PROMPT_MASTER (implémentation screen par screen)
  │                               └──► PROMPT_DESIGN_AUDIT (par écran)
  ├── PROMPT_TOKENS_EXPORT ──► PROMPT_MASTER (utiliser tokens dans l'implémentation)
  ├── PROMPT_CODE_REVIEW ──┬──► PROMPT_MASTER (fix des issues)
  │                         └──► PROMPT_TOKENS_EXPORT (si hors scale spacing/color)
  ├── PROMPT_REPRISE ──► PROMPT_DESIGN_AUDIT / PROMPT_CSSFIX selon contexte
  └── PROMPT_INTEGRATION_DEEP_RESEARCH (standalone — pas de chain)

PROMPT_TEST_CREATIF : mode isolé, PAS de chain (volontaire — on sort des règles).

PROMPT_DEEP_RESEARCH_* : destinés à ChatGPT, pas à Claude — pas de chain.
```

## Pourquoi c'est important

Sans ce bloc, l'user doit se souvenir à chaque fin de prompt "qu'est-ce qui suit logiquement ?". Avec ce bloc, Claude propose les 3–5 next steps sensés. C'est ce qui fait la différence entre "outil" et "compagnon".
