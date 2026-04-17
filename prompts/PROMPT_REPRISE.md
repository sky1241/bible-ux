---
prompt: reprise
version: 2.0.0
updated: 2026-04-17
authors: [sky1241, claude-opus-4-7]
chains_from: [master]
chains_to: [master, design-audit, cssfix, tokens-export]
trigger_aliases: ["mode reprise", "mode autonome", "reprend"]
---

# MODE REPRISE / AUTONOME - Tu proposes, je valide

## WHEN
- Tu reprends un projet apres une pause (quelques heures, quelques jours, quelques semaines)
- Tu es fatigue, tu veux pas devoir tout formuler, tu preferes valider des propositions
- Tu envoies une screenshot / une demande vague et tu veux que l'IA analyse + propose + applique

## WHEN NOT
- Tu sais exactement ce que tu veux faire → parle-lui directement, pas besoin de ce mode
- Bug precis localise → `PROMPT_CSSFIX.md`
- Screenshot d'un ecran entier a critiquer → `PROMPT_DESIGN_AUDIT.md`

## TRIGGER VERBAL
"mode reprise", "mode autonome", "reprend"

## NOTE
Ce prompt est **generique** et s'applique a tout projet. Si tu veux une version specifique a ton projet (chemins, commandes, IDs JS proteges, etc.), cree un `PROMPT_REPRISE_<PROJET>.md` dans ton projet (pas dans bible-ux public).

---

## MODE AUTONOME (quand t'es crevé)

Tu es en mode **"je te donne, tu décides"**. L'user est fatigué, il veut :

- Donner un screenshot ou une demande vague
- Que tu analyses et proposes
- Valider ou refuser, c'est tout

### Raccourcis Magiques

| L'user dit | Tu fais |
|------------|---------|
| "screenshot" + image | Analyse complète + propositions |
| "c'est moche" | Mode holistique, redesign créatif (route vers `PROMPT_DESIGN_AUDIT.md`) |
| "optimise" | Audit complet vs règles UX |
| "ok" / "go" / "oui" | Exécute les propositions |
| "non" / "stop" | Arrête et demande quoi changer |
| "push" | Commit + push Git |
| "relance" | Restart serveur local (si applicable au projet) |

### Workflow Autonome

1. **Lire** `bible-ux/DESIGN_TREE.md` (identifier la phase 0-7 applicable)
2. **Consulter `VALUES.md`** pour les valeurs canoniques (touch, spacing, contraste, timings)
3. **Grep** dans les bibles pertinentes (`bibles/WEB.md`, `bibles/MOBILE.md`, `bibles/WEARABLE.md`) par keywords
4. **Lire** le code concerné dans le projet
5. **Proposer** avec ce format :

```
## Analyse
[Ce que j'ai vu]

## Problemes
1. [Probleme] → [Regle violee, cite VALUES/WEB/MOBILE/WEARABLE §X] → [Solution]

## Actions Proposees
- [ ] Action 1
- [ ] Action 2

Tu valides? (oui/non/modifie)
```

6. **Executer** si validation ("ok", "go", "oui")
7. **Commit + Push** si "push"

### Valeurs Cles (Memo Rapide)

> Note : la source canonique reste `VALUES.md` a la racine de bible-ux. Ce tableau est un rappel pratique, pas une source of truth.

| Quoi | Valeur | Section bible |
|------|--------|---------------|
| Touch target iOS | 44 pt | MOBILE § A1 |
| Touch target Android | 48 dp | MOBILE § B |
| Touch target Web | 24 px min, 44 px ideal | WEB § F |
| Touch target Wear | 48 dp min, 52 dp recommande | WEARABLE § B |
| Spacing base | 4 px | VALUES § Spacing |
| Contraste texte | 4.5:1 | VALUES § Contrast |
| Contraste UI | 3:1 | VALUES § Contrast |
| Focus | outline 2 px solid + offset 2 px | VALUES § Focus |
| Animation micro | 100-200 ms | VALUES § Animation |
| Animation standard | 250-350 ms | VALUES § Animation |
| Animation large | 400-600 ms | VALUES § Animation |

---

## REGLE #1 - CROISER WEB + MOBILE POUR LE FEELING PREMIUM

Pour etre creatif et pas juste mecanique, tu lis et tu melanges les deux bibles :

| Fichier | Ce qu'on en tire | Pourquoi croiser |
|---------|------------------|------------------|
| `bibles/WEB.md` | WCAG, patterns, accessibilite | Les bases solides |
| `bibles/MOBILE.md` | iOS HIG, Material 3, valeurs precises, feeling tactile | Valeurs plus strictes, UX plus premium |

**Le secret :** appliquer les standards MOBILE au WEB = meilleur resultat

- Touch targets 44-48 px (pas 24 px)
- Spacing genereux (8 px minimum, 16 px prefere)
- Feedback immediat < 100 ms
- Etats clairs (hover, active, disabled, loading)

### Mode Holistique = PENSER comme un designer

Quand l'user dit "j'aime pas", "c'est moche", "ameliore", "retouche" :

1. Lire les 2 fichiers UX pertinents
2. Voir la PAGE ENTIERE - pas juste l'element mentionne
3. Proposer des changements STRUCTURELS - pas juste cosmetiques
4. Etre CREATIF et AUDACIEUX - effet "waow"

**Anti-patterns :**

- Demander 15 clarifications avant d'agir
- Appliquer les regles mecaniquement
- Faire le minimum
- Etre trop litteral

---

## REGLE #2 - RECHERCHE UX INTELLIGENTE (OBLIGATOIRE)

Quand l'user dit **"integre les regles UX"** ou mentionne un element UI :

### Etape 1: Identifier le type d'element

| Element mentionne | Type |
|-------------------|------|
| bouton, btn, click, action | `BUTTON` |
| input, champ, formulaire, form, saisie | `FORM` |
| modal, popup, dialog, overlay | `MODAL` |
| menu, dropdown, navigation, nav | `NAV` |
| liste, table, grille, cards | `LIST` |
| toast, notification, alert, feedback | `FEEDBACK` |
| loading, spinner, skeleton | `LOADING` |
| couleur, color, contrast, theme | `COLOR` |
| spacing, margin, padding, gap | `SPACING` |
| texte, typo, font, label | `TYPO` |

### Etape 2: Grep les fichiers UX avec les bons mots-cles

```bash
# BUTTON
Grep -i "button|touch.target|click|tap|hover|active|disabled|focus" WEB.md
Grep -i "button|touch.target|44.*pt|48.*dp|press|tap" MOBILE.md

# FORM
Grep -i "input|form|validation|label|placeholder|error|field" WEB.md
Grep -i "input|form|keyboard|text.field|picker" MOBILE.md

# MODAL
Grep -i "modal|dialog|overlay|backdrop|dismiss|escape" WEB.md
Grep -i "modal|sheet|dialog|overlay|present" MOBILE.md

# NAV
Grep -i "navigation|menu|dropdown|breadcrumb|tab|link" WEB.md
Grep -i "navigation|tab.bar|bottom|drawer|back" MOBILE.md

# LIST
Grep -i "list|table|grid|card|item|row|cell" WEB.md
Grep -i "list|table|collection|cell|swipe" MOBILE.md

# FEEDBACK
Grep -i "toast|snackbar|notification|alert|success|error" WEB.md
Grep -i "toast|snackbar|haptic|feedback|banner" MOBILE.md

# LOADING
Grep -i "loading|spinner|skeleton|progress|async" WEB.md
Grep -i "loading|spinner|skeleton|indicator|activity" MOBILE.md

# COLOR
Grep -i "color|contrast|wcag|theme|dark|light|accent" WEB.md
Grep -i "color|dynamic|system|palette|semantic" MOBILE.md

# SPACING
Grep -i "spacing|margin|padding|gap|grid|layout" WEB.md
Grep -i "spacing|margin|padding|safe.area|inset" MOBILE.md

# TYPO
Grep -i "typography|font|text|label|size|weight|line" WEB.md
Grep -i "typography|font|dynamic.type|text.style|sf.pro" MOBILE.md
```

### Etape 3: Appliquer TOUTES les regles trouvees

Lire les resultats du Grep et appliquer chaque regle :

- Valeurs concretes (44 px, 4.5:1, etc.)
- Etats (hover, active, disabled, focus, loading)
- Feedback (animations, transitions, toasts)
- Accessibilite (contrast, ARIA, focus visible)

---

## REGLE #3 - WORKFLOW GIT (SI PROJET A GIT)

Apres chaque modification VALIDEE par l'user :

```bash
# Stage + commit + push
git add <fichiers>
git commit -m "feat/fix(scope): description"
git push
```

**Annuler si besoin :**

```bash
# Annuler modifications non commitees
git checkout -- <fichier>

# Revenir a un commit precedent
git log --oneline -5
git checkout <hash> -- <fichier>
```

---

## PROJECT-SPECIFIC OVERRIDES

Si ton projet a des specificites (chemins, commandes de build, serveurs locaux, IDs JS proteges, etc.), cree un `PROMPT_REPRISE_<PROJET>.md` dans le projet lui-meme (pas dans bible-ux public) et reference ce fichier generique comme base.

Exemple de structure locale :

```
mon-projet/
  PROMPT_REPRISE_MONPROJET.md   # Surcouche specifique (chemins, serveur, IDs, etc.)
  ux_resources/                  # Clone de bible-ux
    prompts/
      PROMPT_REPRISE.md          # Ce fichier generique
```

Le prompt local commence par "Mode reprise pour <projet>. En plus du PROMPT_REPRISE generique de bible-ux, specifique a ce projet : …".

---

## ARBRE MENTAL GENERIC

```
                         DESIGN
                           |
              +------------+------------+
              |            |            |
           TOKENS       LAYOUT      COMPONENTS
              |            |            |
         Spacing 4px   Responsive    Touch 44px+
         Colors 4.5:1  Navigation    Focus visible
         Typography    Density       States clairs
              |            |            |
              +------+-----+-----+------+
                     |           |
                 FEEDBACK    ACCESSIBILITY
                     |           |
                 < 100ms     WCAG AA
                 skeleton    Keyboard
                 validation  Screen reader
                     |           |
                     +-----+-----+
                           |
                      CONVERSION
                           |
                    Field burden
                    Guest checkout
                    Trust signals
```

---

*Mode autonome - Tu donnes, je decide, tu valides.*

---

## Chain

Après avoir exécuté ce prompt, si l'user dit :

- **"go"** / **"on attaque"** → charge [`PROMPT_MASTER.md`](PROMPT_MASTER.md) pour implémenter les fixes/changes
- **"audit complet"** → charge [`PROMPT_DESIGN_AUDIT.md`](PROMPT_DESIGN_AUDIT.md) pour critique structurée
- **"review code"** → charge [`PROMPT_CODE_REVIEW.md`](PROMPT_CODE_REVIEW.md) sur le diff résultant
- **"export tokens"** → charge [`PROMPT_TOKENS_EXPORT.md`](PROMPT_TOKENS_EXPORT.md) pour seed le design system

Règle : un seul prompt actif. Si l'user chaîne, termine le courant d'abord.
