# bible-ux — User Guide

> Tu viens d'acheter / cloner bible-ux et tu veux savoir quoi en faire. 5 minutes de lecture, 2 minutes de setup, tu es opérationnel.

---

## Ce que bible-ux fait pour toi

Une librairie de **47 021 lignes de règles UX** (Apple HIG, Material 3, WCAG 2.2, Baymard, NN/g) que ton assistant IA (Claude, ChatGPT, Gemini, Cursor, Copilot) **consulte automatiquement** quand il répond à tes questions de design.

Concrètement : au lieu que Claude **devine** des valeurs, il les **cite** avec source.

**Sans bible-ux :**
> "Fais-moi un bouton login"
> → Claude sort un bouton avec des valeurs au pif

**Avec bible-ux :**
> "Fais-moi un bouton login"
> → Claude sort un bouton `44 × 44 pt` (VALUES § Touch), contraste `4.5:1` (WCAG 1.4.3), padding `16 px` (spacing scale), focus ring visible, avec code Swift/SwiftUI et checklist

---

## 1. Setup — 2 minutes

### Option A — Utiliser bible-ux sur un projet existant

Tu bosses sur `mon-projet/`. Tu veux que Claude l'utilise dans CE projet.

```bash
cd mon-projet/
git clone https://github.com/sky1241/bible-ux.git ux_resources
cp ux_resources/CLAUDE.md .
```

Dans le `CLAUDE.md` copié à la racine de ton projet, ajuste les chemins pour pointer vers `ux_resources/` :

```
VALUES.md              →  ux_resources/VALUES.md
bibles/WEB.md          →  ux_resources/bibles/WEB.md
prompts/PROMPT_...md   →  ux_resources/prompts/PROMPT_...md
```

Ouvre une session Claude Code dans `mon-projet/`. C'est prêt.

### Option B — Travailler direct dans bible-ux

Tu utilises bible-ux comme référence perso, ou tu bosses sur les bibles elles-mêmes.

```bash
git clone https://github.com/sky1241/bible-ux.git
cd bible-ux/
```

Ouvre Claude Code dans ce dossier. `CLAUDE.md` est déjà là, auto-chargé.

---

## 2. Ta première session — 30 secondes

**Ouvre Claude Code** dans le projet. Tu n'as **rien à taper de spécial** pour démarrer. Claude Code lit `CLAUDE.md` tout seul.

**Teste immédiatement** avec le raccourci le plus simple :

1. Fais un screenshot (**Win+Shift+S** sur Windows, **Cmd+Shift+4** sur Mac).
2. Colle dans Claude (**Ctrl+V**).
3. Tape : `c'est moche`
4. Envoie.

Tu reçois un audit structuré P0/P1/P2 en 30 secondes. C'est ça bible-ux en action.

---

## 3. Les 15 raccourcis, un par un, avec exemples

Ne les mémorise pas. Tu les utilises quand tu en as besoin.

### 🖼️ `c'est moche` + screenshot
**Pour :** critique complète d'un écran.
**Exemple :**
> [screenshot] c'est moche

**Réponse type :**
```
Audit Design — Mobile — Login

🔴 P0 (critique)
1. [Zone A] Titre contraste 2.3:1 → besoin ≥ 4.5:1
   Fix : #aaa → #525252
2. [Zone C] 3 boutons primary → pas de hiérarchie
   Fix : garder "Se connecter" filled, "Mot de passe oublié" en text button

🟠 P1 (important)
3. Spacing 13 px → hors scale 4/8 px
...

## Quick wins
1. Contraste titre (2 min)
2. Hiérarchie boutons (2 min)
3. Padding uniforme (5 min)

"fix tout" / "fix quick wins" / "fix P0" ?
```

### 🎨 `sois créatif` + screenshot
**Pour :** sortir du mode règle, avoir des propositions audacieuses.
**Exemple :**
> [screenshot] sois créatif, propose quelque chose qui claque

Claude désactive la citation systématique de règles et propose du design plus expérimental.

### 🔧 `fix`
**Pour :** analyse + proposition + attente de validation.
**Exemple :**
> Le calendrier est pas aligné, fix

Claude lit le code, propose les changements, attend ton **"go"**.

### 📐 `css fix`
**Pour :** bug visuel très localisé.
**Exemple :**
> [screenshot] css fix, le padding en haut est chelou

Claude labellise les zones `[A] [B] [C]`, confirme ce qu'il a compris, puis fixe.

### 🔍 `review`
**Pour :** reviewer du code (diff, PR, snippet) contre les règles UX.
**Exemple :**
> ```jsx
> <div onClick={login}>Se connecter</div>
> ```
> review

**Réponse type :**
```
🔴 P0 #1 — <div onClick> au lieu de <button>
   Pas de keyboard nav, pas de role par défaut.
   Fix : <button type="button" onClick={login}>Se connecter</button>
```

### 🎨 `tokens`
**Pour :** exporter VALUES.md en config importable.
**Exemple :**
> tokens format tailwind

Claude te sort un `tailwind.config.js` prêt à coller avec toutes les valeurs canoniques.

### 🧭 `quel pattern`
**Pour :** choisir entre plusieurs options UX.
**Exemple :**
> J'ai 7 destinations sur mobile, quel pattern de nav ?

Claude recommande 1 pattern principal + 1 alternative avec bible refs.

### ♿ `a11y`
**Pour :** audit accessibilité dédié (WCAG 2.2).
**Exemple :**
> [screenshot / ou paste code] a11y audit

Claude passe les 13 règles automatisables + les checks manuels.

### ✍️ `wording`
**Pour :** fix du microcopy (boutons, erreurs, empty states).
**Exemple :**
> J'ai "OK" / "Annuler" / "Erreur est survenue", wording

Claude te sort des versions bible-conformes.

### 🥊 `attaque ma décision`
**Pour :** faire challenger une décision design avant de shipper.
**Exemple :**
> Je vais mettre infinite scroll sur mes factures. Attaque ma décision.

Claude attaque sur 3 axes (research / anti-patterns / edge cases) avec une alternative crédible.

### 🎯 `spec`
**Pour :** nouveau projet greenfield.
**Exemple :**
> spec mon app : tracker d'habitudes pour watchOS + web, B2C casual

Claude demande 8 questions max, puis te sort une spec complète (tokens, nav, components, flows, screens, states, a11y, risques).

### 🚫 `dark pattern`
**Pour :** auditer un flow sensible (subscription, checkout, cookie banner).
**Exemple :**
> [screenshot du flow cancel] dark pattern

Claude scanne les 17 patterns Brignull + conformité EU/FTC.

### 🤖 `mode reprise`
**Pour :** bosser fatigué. Tu donnes du vague, Claude propose, tu valides.
**Exemple :**
> mode reprise. Le dashboard est bof.

Claude analyse, propose 3 actions, attend ton "go".

### ✅ `go` / `ok` / `oui`
**Pour :** valider et appliquer ce que Claude a proposé.

### ❌ `non` / `stop`
**Pour :** annuler et redemander autre chose.

### 🚀 `push`
**Pour :** commit + push sur Git une fois que tu valides.

---

## 4. Workflow d'une journée type

**Tu bosses sur ton app. Séquence réelle :**

```
10:15  Tu ouvres Claude Code dans ton projet.
10:16  "Le header est moche" + screenshot
       → audit P0/P1/P2
10:18  "fix quick wins"
       → Claude propose les 3 fixes
10:18  "go"
       → Claude applique dans le code
10:21  Tu vérifies dans le browser, ça marche.
10:22  "review le diff"
       → Claude check qu'on a pas cassé d'autres règles
10:23  "push"
       → commit + push

11:00  Tu démarres une nouvelle feature.
11:01  "Ajoute un toggle dark mode sur l'écran Settings"
       → Claude cite VALUES § Dark mode + MOBILE § H + MOBILE § X
              (toggle vs checkbox)
              et écrit le code.
11:04  "go"
11:06  "push"

14:30  Tu reçois un feedback user.
14:31  "L'onboarding est trop long. Attaque ma décision de 5 écrans."
       → Claude attaque avec research + alternative "1 écran + progressive"
14:34  Tu es convaincu, "refais avec progressive disclosure"
14:40  "push"
```

**Zéro PROMPT_XXX.md ouvert. Zéro routeur consulté.** Juste des mots naturels.

---

## 5. Troubleshooting

### ❓ Claude ne cite pas la bible

**Cause :** `CLAUDE.md` pas détecté.

**Fix :**
```bash
ls CLAUDE.md
# Si absent, copie-le depuis bible-ux/
cp ux_resources/CLAUDE.md .
```

Puis recharge la session Claude Code.

### ❓ "c'est moche" ne déclenche rien

**Cause :** Claude comprend la phrase mais n'active pas le workflow PROMPT_DESIGN_AUDIT.

**Fix :** explicite une fois : "audit avec bible-ux, 7 péchés + 12 axes". Dans la même session, Claude gardera le mode.

### ❓ Je ne vois pas de valeurs chiffrées dans la réponse

**Cause :** Claude répond en mode général sans consulter VALUES.md.

**Fix :** dis "avec VALUES.md" explicitement la première fois. Claude va grep et citer.

### ❓ Claude cite une section qui n'existe pas

**Cause :** rare bug hallucination.

**Fix :** demande "vérifie la section". Claude re-grep le fichier et corrige.

### ❓ Je veux désactiver les raccourcis sur une question

**Fix :** dis simplement "mode normal, pas bible-ux pour cette question". Claude répond sans consulter.

### ❓ Le CI GitHub plante

**Cause :** `stats.json` ou `check-links.sh` échoue.

**Fix local :**
```bash
bash scripts/check-links.sh    # doit dire "0 broken"
bash scripts/update-stats.sh   # regen stats.json
git add stats.json && git commit -m "regen stats"
```

---

## 6. Customiser pour ton projet

### Option A — Éditer CLAUDE.md

Ouvre le `CLAUDE.md` à la racine de ton projet. Ajoute/retire des raccourcis selon ton goût. Par exemple :

```markdown
| **"mon bouton magique"** | Crée un bouton avec TA signature brand |
```

Claude l'appliquera.

### Option B — project.json

Pour des préférences durables (stack, brand, a11y level), crée `.bible-ux/project.json` — voir [prompts/PROJECT_MEMORY.md](prompts/PROJECT_MEMORY.md) pour le schéma complet.

Exemple minimal :
```json
{
  "project_name": "mon-app",
  "targets": ["web"],
  "stack": {
    "frontend": "react",
    "styling": "tailwind-v4"
  },
  "brand": {
    "primary_hex": "#3B82F6",
    "tone": "casual"
  },
  "accessibility": { "level": "AA" }
}
```

Claude lit ce fichier en début de session et applique les defaults partout.

---

## 7. FAQ

### Je dois apprendre les 20 prompts ?

**Non.** Tu utilises les 15 raccourcis verbaux (ou juste les 3 principaux : "c'est moche", "fix", "go"). Les fichiers `PROMPT_XXX.md` sont consultés par Claude dans l'ombre, tu ne les ouvres jamais.

### bible-ux marche avec ChatGPT / Gemini / Cursor / Copilot ?

**Oui.** CLAUDE.md est nommé pour Claude Code, mais ChatGPT / Gemini / Cursor peuvent aussi le lire. Dans ChatGPT, colle le contenu de `prompts/PROMPT_MASTER.md` en début de conversation pour activer le même comportement.

### Les prompts DR servent à quoi ?

`prompts/PROMPT_DEEP_RESEARCH_*.md` sont destinés à **ChatGPT Deep Research** (pas à Claude). Tu copies le contenu dans ChatGPT Deep Research, tu attends 20 min, ChatGPT te sort 50–170 pages de recherche sourcée. Tu reviens dans Claude et tu dis "integre cette deep research" pour l'ajouter à une bible.

### Combien de bibles y a-t-il ?

**5** :
- `bibles/WEB.md` (15 669 lignes) — Web / CSS / WCAG / PWA
- `bibles/MOBILE.md` (15 510 lignes) — iOS HIG + Material 3
- `bibles/WEARABLE.md` (13 132 lignes) — Wear OS + watchOS + Garmin
- `bibles/XR.md` (842 lignes) — Vision Pro + Meta Quest + smart glasses
- `bibles/ICONS.md` (306 lignes) — App icons

Plus 2 index : `DESIGN_TREE.md` (arbre de décision) + `VALUES.md` (source canonique des chiffres).

### Je peux contribuer / modifier les bibles ?

**Oui sur les prompts + index (licence MIT).** Les bibles elles-mêmes sont sous licence commerciale EULA — voir [LICENSE.md](LICENSE.md).

### Combien de temps avant d'être à l'aise ?

**1 session Claude.** Fais le test "screenshot + c'est moche" une fois. Tu comprends l'outil en 2 minutes.

---

## 8. Cheatsheet — à imprimer si t'aimes

```
SETUP
  cp ux_resources/CLAUDE.md .

TES 5 RACCOURCIS LES PLUS UTILES
  "c'est moche" + screenshot  →  audit design
  "fix" / "css fix"            →  corrige bug visuel
  "review" + code              →  audit code
  "tokens [format]"            →  exporte design system
  "go" / "push"                →  exécute / commit

TROUBLESHOOTING
  Claude ignore bible-ux       →  vérifie ls CLAUDE.md
  Section inexistante citée    →  dis "vérifie la section"
  CI plante                    →  bash scripts/update-stats.sh

DOCS DÉTAILLÉES
  START_HERE.md                →  30-sec version
  README.md                    →  overview du pack
  prompts/README.md            →  router (tableau situation→prompt)
  VALUES.md                    →  chiffres canoniques
  bibles/                      →  les règles complètes
```

---

**Tu es à jour. Balance un screenshot à Claude et tape "c'est moche" — on y est.**
