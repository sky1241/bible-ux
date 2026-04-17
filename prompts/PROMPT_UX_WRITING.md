---
prompt: ux-writing
version: 1.0.0
updated: 2026-04-17
authors: [sky1241, claude-opus-4-7]
chains_from: [master, design-audit, spec-from-scratch]
chains_to: [master, design-audit]
trigger_aliases: ["ux writing", "microcopy", "wording", "relis mon wording", "ton de la marque"]
---

# MODE UX WRITING — Microcopy, boutons, empty states, erreurs

## WHEN
- Tu veux polir les **mots** de ton interface : labels de boutons, empty states, erreurs, emails transactionnels, notifs, onboarding tooltips
- Tu lances une nouvelle feature et tu veux son ton aligné avec la marque
- Tu as reçu un feedback "ton bof" ou "pas clair"
- Tu traduis / localises et tu veux vérifier que les textes supportent l'i18n (expansion FR 30 %, RTL, etc.)

## WHEN NOT
- Tu veux du marketing copy (landing, emails promo) → sort du scope bible-ux
- Tu veux écrire une doc technique / readme → sort du scope bible-ux
- Tu n'as pas encore designé l'écran → `PROMPT_SPEC_FROM_SCRATCH.md` d'abord

## TRIGGER VERBAL
"ux writing", "microcopy", "wording", "relis mon wording", "ton de la marque"

## PARAMS
- `ux writing quick` → pass rapide sur les boutons + erreurs seulement
- `ux writing` (default) → tout le set (boutons + empty + errors + success + tooltips + labels)
- `ux writing tone` → focus sur le ton (ajuster formel / casual / technique selon audience)
- `ux writing i18n` → focus préparer le texte pour la trad (text expansion, plurals, RTL)

## SOURCE OF TRUTH

- [`../bibles/WEB.md`](../bibles/WEB.md) §§ L (microcopy), AS (content strategy), M (i18n)
- [`../bibles/MOBILE.md`](../bibles/MOBILE.md) §§ V (i18n mobile)
- Apple HIG — [Writing](https://developer.apple.com/design/human-interface-guidelines/writing)
- Material — [Writing](https://m3.material.io/foundations/content-design/style-guide)
- NN/g — Hostile Error Messages research

---

## Les règles d'or du UX writing bible-ux

### 1. Boutons — verbes d'action

```
NON                   OUI
"OK"                → "Enregistrer" / "Continuer" / "Envoyer"
"Oui"               → "Supprimer" / "Confirmer la suppression"
"Non"               → "Annuler" (ou juste laisser "Retour")
"Soumettre"         → "Créer le compte" / "Publier l'article"
"Cliquer ici"       → décris l'action : "Télécharger le rapport PDF"
```

**Règles :**
- Verbe d'action au début
- Max **20 chars** mobile, **25** web, **12** watch
- Cohérent : toujours "Créer" plutôt que "Ajouter" si on a choisi "Créer" une fois
- FR: Première lettre capitale seulement ("Enregistrer les modifications")
- EN: Title Case sur boutons ("Save Changes"), sentence case le reste

### 2. Messages d'erreur — formule magique

**Formule : [Ce qui s'est passé] + [Pourquoi] + [Comment corriger]**

```
NON
"Erreur"
"Invalide"
"Une erreur est survenue"
"Code: 500"

OUI
"Impossible d'envoyer le message. Ta connexion internet semble coupée. Vérifie ton wifi et réessaye."
"Ce nom d'utilisateur est déjà pris. Essaye d'ajouter un chiffre ou un underscore."
"Le mot de passe doit contenir au moins 8 caractères. Il en a 6."
```

**Règles :**
- **Max 80 chars** par message (1–2 phrases courtes)
- Jamais **blâmer l'user** : "We couldn't…" plutôt que "You did…"
- Ton **neutre / empathique**, pas d'humour ni sarcasme dans les erreurs
- **Pas de code technique** visible (500, NETWORK_ERROR) sans explication human-readable
- Toujours donner **l'action de recovery** ("Réessayer", "Vérifier")

### 3. Empty states — encourager, pas décrire

```
NON
"Aucune donnée"
"Rien à afficher"
"Vide"
"0 résultat"

OUI (first use)
"Crée ton premier projet pour commencer"
"Aucun message encore — tes notifications arriveront ici"

OUI (no results)
"Aucun résultat pour 'xyz'. Essaye un autre mot-clé ou efface les filtres."

OUI (error)
"Impossible de charger les données. [Réessayer]"
```

**Structure canonique (voir [WEB.md § V Onboarding]) :**
1. Illustration ou icône (optionnel, ≤ 120 dp max)
2. Titre court (≤ 8 mots)
3. Description 1–2 lignes
4. CTA clair (verbe d'action)

### 4. Success feedback — court, visible, discret

```
NON                              OUI
"Opération réussie !"          → "Enregistré"
"Vos changements ont été ... " → "Envoyé à 5 personnes"
"Succès"                       → "Copié dans le presse-papier"
```

**Règles :**
- **1–3 mots** idéalement, max 5 mots
- Verbe au participe passé (état, pas action)
- Pas d'exclamation excessive (1 `!` max, et seulement pour célébrations rares)
- Durée toast : **3–4 s** (VALUES § Loading thresholds)
- Si action réversible (snackbar undo) : "Supprimé  [Annuler]"

### 5. Tooltips & help text — courts et contextuels

```
NON                                       OUI
"Ce champ est utilisé pour…"           → "Ex. jean.dupont@email.com"
"Cliquez ici pour en savoir plus"      → [Voir la doc →]
"Obligatoire"                          → marqueur `*` + label "Requis" dans placeholder
```

**Règles :**
- Tooltip = **max 1 ligne, 60 chars**
- Help text (en bas de champ) = **max 2 lignes**
- Jamais répéter ce que le label dit déjà
- Si explication > 2 lignes → lien vers doc ou modal dédié

### 6. Notifications push / emails transactionnels

```
NON                                    OUI
"Nouvelle notification"              → "Jean t'a envoyé un message"
"Votre commande est mise à jour"     → "Ta commande #4217 est expédiée"
"Action requise"                     → "Confirme ton email avant demain 18h"
```

**Règles :**
- **Titre ≤ 50 chars** (iOS/Android cut off)
- **Body ≤ 150 chars** pour preview
- Jamais de marketing dans une transactional
- Unsubscribe link obligatoire (emails) + "Gérer les notifications" (push)
- CTA dans le body, pas en sujet

### 7. Onboarding / progressive disclosure

- **1 idée par écran**, 10–15 mots max
- Ton **encourageant**, pas condescendant ("Tu peux…" > "Tu dois…")
- Skip button **TOUJOURS visible**, pas caché
- Dernier écran = CTA fort pour la première action (pas "Terminé" vague)

### 8. Placeholders — jamais seuls

**Règle dure :** `placeholder` ne remplace JAMAIS un `label`. Le label disparaît dès que l'user commence à taper, et il a besoin de revérifier ce qu'il saisit.

```
<!-- NON -->
<input placeholder="Email"/>

<!-- OUI -->
<label for="email">Email</label>
<input id="email" type="email" placeholder="ex. jean@email.com" />
```

Placeholder = **exemple de format**, pas nom du champ.

---

## Ton — comment choisir

| Audience | Ton | Exemples |
|----------|-----|----------|
| B2C grand public | Casual, tutoiement FR possible | "Bienvenue !", "On t'envoie un email" |
| B2B SaaS | Professionnel sans être raide, tu/vous selon le produit | "Votre tableau de bord", "Créer un workspace" |
| Enterprise interne | Formel, vouvoiement FR, jargon métier OK | "Accéder au module Finance", "Contrat validé" |
| Dev tools | Technique, direct, humor OK si culture | "Stack trace captured", "LGTM — deploying" |
| Health / medical | Neutre, factuel, jamais inquiétant, ton rassurant | "Votre rythme cardiaque est stable", pas "Anomalie détectée !" |
| Kids / education | Encourageant, court, concret | "Super ! Prochain exercice ?", pas "Vous avez terminé avec succès" |

**Règle mono-voix :** choisir UN ton et s'y tenir sur toute l'app. L'user sent immédiatement quand le ton change entre deux écrans.

---

## i18n — préparer le texte pour la trad

- **Text expansion** : FR est ~30 % plus long que EN. Prévoir de l'espace dans les boutons / labels.
- **RTL** : tester Arabic ou Hebrew ; les icons directionnels doivent s'inverser (arrows, chevrons) mais pas les icons factuels (play, pause, volume).
- **Plurals** : utiliser ICU message format, pas `count === 1 ? "item" : "items"` hardcoded.
- **Dates / times / numbers** : JAMAIS concatenation manuelle ; utiliser `Intl.DateTimeFormat`, `NumberFormat`.
- **Variables** : `"Hello {name}"` pas `"Hello " + name` (ordre des mots change entre langues).
- Noms propres dans les messages : éviter de les décliner ("Bonjour Marc" vs "Bienvenue, Marc" → préférer la 2e forme neutre).

---

## Workflow d'audit wording

Pour reviewer le wording d'une interface :

1. **Lister chaque string user-facing** (boutons, titres, labels, errors, empty, tooltips).
2. **Passer chaque string dans la grille** des 8 règles ci-dessus.
3. **Flag les violations** par catégorie (boutons / erreurs / empty / etc.).
4. **Proposer la réécriture** en Avant/Après.
5. **Vérifier cohérence du ton** sur tout le set.
6. **Vérifier i18n-readiness** si applicable.

Format rapport — voir [`_fragments/report-p0-p1.md`](_fragments/report-p0-p1.md), adapté :

- P0 = erreur qui peut faire quitter l'user (error hostile, empty state vague sans CTA)
- P1 = non conforme aux règles d'or (bouton "OK", placeholder sans label)
- P2 = ton incohérent (formel ailleurs, casual ici sans raison)
- P3 = polish (pourrait être plus concis)

---

## Anti-comportements

- ❌ Tout remplacer par "plus court" — parfois 1 mot en plus rend plus clair
- ❌ Ajouter du flair ("🎉 Bravo !!!") quand l'user vient juste de cliquer save
- ❌ Jargon marketing dans transactional ("Unlock your journey")
- ❌ Questions rhétoriques dans les erreurs ("Oops!", "Aïe !")
- ❌ Écrire en majuscules pour faire fort (CREATE ACCOUNT → accessibility break, screen reader épelle)
- ❌ Dark patterns wording : "Non merci, je ne veux pas économiser 50 €"

## Règles d'or

1. **Verbes d'action sur les boutons.** Pas "OK".
2. **Erreurs = quoi + pourquoi + comment.** Max 80 chars.
3. **Empty states encouragent.** Jamais "aucune donnée".
4. **Placeholder ≠ label.** Toujours les deux.
5. **1 ton, toute l'app.**
6. **i18n-ready dès la v1** (même si EN-only pour l'instant).
7. **Lis à voix haute.** Si ça sonne bizarre, ça l'est.
8. **Teste sur un user non-dev.** Ils voient ce que tu as cessé de voir.

---

## Chain

Après l'audit wording, si l'user dit :

- **"fix tout"** → charge [`PROMPT_MASTER.md`](PROMPT_MASTER.md) pour appliquer les réécritures
- **"audit design complet"** → charge [`PROMPT_DESIGN_AUDIT.md`](PROMPT_DESIGN_AUDIT.md) si l'UI a aussi des problèmes visuels
- **"refais le ton"** → relance ce prompt avec param `ux writing tone` + nouvelle définition d'audience

Règle : un seul prompt actif. Si l'user chaîne, termine le courant d'abord.
