# 🟢 START HERE — comment utiliser bible-ux en vrai

> Si tu lis UN seul fichier de ce repo, c'est celui-là.

---

## La version 30 secondes

Dans ta session Claude (Code, Desktop, web, peu importe), dis :

> **"utilise bible-ux pour le design"**

C'est tout. Claude va automatiquement consulter les règles quand il fait du design.

Tu peux aussi dire :

> **"charge bible-ux"**

ou

> **"use bible-ux as reference"**

Toutes ces variantes déclenchent le même comportement : Claude ouvre les bibles et les utilise.

---

## 3 exemples concrets sur infernal_wheel

### Exemple 1 — fix CSS

Tu tapes :
```
Le calendrier est pas aligné, fix-le. Utilise bible-ux.
```

Claude va :
1. Lire ton `Dashboard.Page.ps1`
2. Grep `bibles/WEB.md` pour "spacing" et "alignment"
3. Proposer un fix avec les valeurs exactes (16 px, 4 px, etc.)
4. Attendre ton "go" pour appliquer

### Exemple 2 — audit screenshot

Tu colles un screenshot et tu tapes :
```
C'est moche, audit avec bible-ux.
```

Claude va :
1. Scanner les 7 péchés du noob (couleurs, spacing, contraste, etc.)
2. Sortir un rapport P0 / P1 / P2
3. Proposer les quick wins

### Exemple 3 — nouvelle feature

Tu tapes :
```
Fais-moi un bouton "Nouvelle session" pour l'accueil, respecte bible-ux.
```

Claude va :
1. Consulter `VALUES.md` (touch 44 px, spacing 16 px, border-radius 8 px)
2. Consulter `bibles/WEB.md § CR` (button hierarchy)
3. Sortir du code CSS/HTML conforme

---

## Pour le reste : oublie

Tu peux **totalement oublier** :

- ❌ Les 20 prompts individuels (PROMPT_DESIGN_AUDIT, PROMPT_CSSFIX, etc.)
- ❌ Le router `prompts/README.md`
- ❌ `PROMPT_MASTER.md` (Claude le lit tout seul si tu dis "utilise bible-ux")
- ❌ Les fragments, VISION.md, les scripts

**Ces trucs servent à deux choses :**

1. **Si un jour tu veux un workflow spécifique** (ex. "attaque ma décision design"), tu pourras le trouver dans [prompts/README.md](prompts/README.md) qui a un tableau situation → prompt.
2. **Si tu vends sur Gumroad**, les 20 prompts = vitrine impressionnante qui justifie les $49.

Mais **pour ton usage perso quotidien**, une seule phrase suffit : **"utilise bible-ux"**.

---

## Workflow type d'une journée infernal_wheel

```
1. Tu ouvres Claude Code dans infernal_wheel/
2. Tu tapes : "utilise bible-ux pour ce projet"
3. Claude répond : "bible-ux chargée, prêt"
4. Tu bosses normalement :
   - "fix l'alignement du calendrier"
   - "ajoute un toggle dark mode propre"
   - "le modal de confirmation est pas droit"
   - "review le code que je viens de push"
5. Claude consulte bible-ux à chaque décision, cite les sources
6. Tu valides ou tu corriges
```

**C'est ça le workflow. Pas plus.**

---

## Si tu veux le mode power-user (plus tard, pas obligatoire)

Tu peux utiliser des **triggers verbaux** précis quand tu veux un workflow cadré :

| Tu tapes... | Claude fait... |
|-------------|---------------|
| "audit ce screenshot" | Rapport P0/P1/P2 complet (`PROMPT_DESIGN_AUDIT`) |
| "css fix" + ce qui cloche | Workflow labelle-zones + confirm + fix (`PROMPT_CSSFIX`) |
| "export tokens" | Génère ton CSS/Tailwind/Flutter (`PROMPT_TOKENS_EXPORT`) |
| "quel pattern" | Recommande avec bible refs (`PROMPT_PICK_PATTERN`) |
| "review ce diff" | Review P0/P1/P2 (`PROMPT_CODE_REVIEW`) |
| "spec mon app" | Spec design complète (`PROMPT_SPEC_FROM_SCRATCH`) |

**Mais même ça, c'est pas obligatoire.** Tu peux juste dire ce que tu veux en français normal, Claude comprend.

---

## Résumé final

1. **1 phrase à retenir** : *"utilise bible-ux"*
2. **1 fichier à consulter quand tu veux plus** : [prompts/README.md](prompts/README.md) (le tableau trigger → prompt)
3. **Le reste = nice to have**, pas nécessaire pour l'usage quotidien

Fin du manuel utilisateur.
