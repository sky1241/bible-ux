---
prompt: dark-pattern-detector
version: 1.0.0
updated: 2026-04-17
authors: [sky1241, claude-opus-4-7]
chains_from: [master, design-audit, growth-ux, a11y-audit]
chains_to: [master, ux-writing, growth-ux, design-audit]
trigger_aliases: ["dark pattern", "détecte dark patterns", "dark pattern audit", "audit éthique", "ethical audit"]
---

# MODE DARK PATTERN DETECTOR — Flag les manipulations UI

## WHEN
- Tu veux **auditer un flow** (signup, checkout, subscription, paywall, cancel) pour détecter les manipulations
- Tu reçois des retours "UI manipulative" / "j'ai pas compris ce que j'ai accepté"
- Tu prépares la conformité **EU Digital Services Act** ou **FTC Guidelines** (USA 2024+)
- Tu veux vérifier qu'une feature growth n'a pas dérapé en dark pattern

## WHEN NOT
- Audit UX généraliste → `PROMPT_DESIGN_AUDIT.md`
- Audit accessibilité → `PROMPT_A11Y_AUDIT.md`
- Optimisation growth (éthique) → `PROMPT_GROWTH_UX.md`

## TRIGGER VERBAL
"dark pattern", "détecte dark patterns", "audit éthique"

## PARAMS
- `dark pattern quick` → top 5 patterns courants seulement (2 min scan)
- `dark pattern` (default) → audit complet (17 patterns Brignull-taxonomy)
- `dark pattern subscription` → focus subscription / cancel flow (EU focus)
- `dark pattern consent` → focus cookie banners / privacy consent

## SOURCE OF TRUTH

- **Taxonomie Harry Brignull** (deceptive.design) — 16 patterns de base
- **FTC report 2022 "Bringing Dark Patterns to Light"** — USA regulatory
- **EU Dark Patterns in Subscriptions Act 2024** — EU regulatory
- **C. M. Gray et al. CHI 2018** — taxonomie académique
- [`../bibles/WEB.md`](../bibles/WEB.md) §§ BP (Urgency/Scarcity Ethical), AI (GDPR), Z (Auth)
- [`../bibles/MOBILE.md`](../bibles/MOBILE.md) §§ AE (IAP/Subs), CA (Privacy Regulation)

---

## Les 17 dark patterns à détecter

### Catégorie 1 — Confirmshaming (shaming l'user)

```
ATTERISSAGE : User clique "Non merci" sur une offre.

❌ Dark pattern :
"Non merci, je ne veux pas économiser 50 €"
"Non, je préfère payer plus cher"
"Je ne souhaite pas recevoir d'offres exclusives"

✅ Éthique :
"Non merci" (neutre)
"Pas maintenant"
"Continuer sans abonnement"
```

**Source :** [deceptive.design/confirmshaming](https://www.deceptive.design/types/confirmshaming)

### Catégorie 2 — Misdirection (faux visuel)

```
ATTERISSAGE : CTA primaire mis en gris, CTA secondaire (cher) en coloré.

❌ Dark pattern :
[Continuer sans protection] (gris, petit)  [Acheter la garantie 49 €] (bleu, grand)

✅ Éthique :
[Continuer sans protection] (outlined)  [Acheter la garantie 49 €] (filled primary)
// Les deux lisibles, l'user choisit en connaissance
```

### Catégorie 3 — Trick questions

```
❌ Dark pattern :
☐ "Ne pas me pas envoyer d'emails promo" (double négation)

✅ Éthique :
☐ "M'envoyer des emails promo" (direct)
```

### Catégorie 4 — Sneak into basket

```
❌ Dark pattern :
Ajout automatique d'une "assurance transport 4.99 €" dans le panier, à décocher manuellement.

✅ Éthique :
Pas d'auto-add. Proposer opt-in explicite.
```

### Catégorie 5 — Hidden costs

```
❌ Dark pattern :
Produit 29 € → panier → shipping → taxes → frais de service → total final 41 €.

✅ Éthique :
Prix final transparent dès la page produit (VAT included, shipping estimé avec CP).
Baymard : 48 % abandons checkout = hidden costs découverts tardivement.
```

### Catégorie 6 — Forced continuity

```
❌ Dark pattern :
Trial gratuit 7 jours + CB obligatoire → facturé au J8 sans rappel.

✅ Éthique :
Trial gratuit sans CB (meilleur)
OU trial CB obligatoire + email rappel J5 "Ton trial finit dans 48h".
Voir [PROMPT_GROWTH_UX.md] § monétisation.
```

### Catégorie 7 — Roach motel

```
ATTERISSAGE : Facile de s'inscrire, impossible de se désinscrire.

❌ Dark pattern :
Signup : 1 formulaire, 30 s.
Unsubscribe : "Appelez notre service client du L-V 9h-17h UTC+2".

✅ Éthique :
Cancel dans Settings > Subscription > Cancel en ≤ 3 clics.
(EU Dark Patterns Act 2024 : obligation de cancel aussi simple que signup.)
```

### Catégorie 8 — Privacy Zuckering

```
❌ Dark pattern :
Toggle "Partager mon activité" ON par défaut, caché dans Settings > Privacy > Advanced.

✅ Éthique :
OFF par défaut. Opt-in explicite si user veut.
(GDPR Art. 25 : privacy by default.)
```

### Catégorie 9 — Price comparison prevention

```
❌ Dark pattern :
Prix affichés en différentes devises / périodes pour empêcher la comparaison.
"9.99 € / semaine" vs "399 € / an"

✅ Éthique :
Comparable direct : "9.99 € / semaine (519 € / an)" vs "399 € / an (soit 7.67 € / semaine, −23 %)".
```

### Catégorie 10 — Disguised ads

```
❌ Dark pattern :
Native ad dans un feed de news, style identique aux articles, label "Sponsored" invisible.

✅ Éthique :
Label "Sponsorisé" visible (≥ 12 pt), bordure / fond qui marque la distinction.
(FTC guidelines 2022.)
```

### Catégorie 11 — Bait and switch

```
❌ Dark pattern :
User clique "Fermer" sur pop-up → action "Abonner".

✅ Éthique :
Close button fait close. Toujours.
```

### Catégorie 12 — Fake scarcity

```
❌ Dark pattern :
"Plus que 2 chambres à ce prix !" (fake, toujours affiché)

✅ Éthique :
Scarcity réelle only. Ou pas de scarcity.
WEB § BP Urgency Ethical : scarcity authentique, pas manipulative.
```

### Catégorie 13 — Fake urgency

```
❌ Dark pattern :
"Offre expire dans 00:04:32 !" (se reset à chaque visit)

✅ Éthique :
Deadline réelle only. Stockée côté server, pas JS local.
```

### Catégorie 14 — Activity notifications (fake social proof)

```
❌ Dark pattern :
"Jean de Paris vient de réserver !" (algorithmique, pas un vrai Jean)

✅ Éthique :
Social proof réel (reviews vérifiées, "5000 users actifs ce mois-ci" agrégé).
Ou pas de social proof.
```

### Catégorie 15 — Nagging

```
❌ Dark pattern :
Pop-up "Activer les notifications" à chaque lancement.
Demande de rating app à chaque écran.

✅ Éthique :
Max 1 demande per session, cooldown 7 jours entre demandes, opt-out "Ne plus demander".
(Apple HIG / Material guidelines.)
```

### Catégorie 16 — Obstruction

```
❌ Dark pattern :
Export de données possible mais format obscure, uniquement par email delayed 48h.

✅ Éthique :
Export immédiat, format standard (JSON / CSV).
(GDPR Art. 20 : droit à la portabilité.)
```

### Catégorie 17 — Forced action (new, 2024)

```
❌ Dark pattern :
"Pour continuer, acceptez les cookies non-essentiels" sans option "Reject".

✅ Éthique :
Reject all aussi proéminent que Accept all (EU GDPR + EDPB 2022).
Button "Reject" = même taille / couleur que "Accept".
```

---

## Workflow

### Étape 1 — Scope

Demander :
1. **Quel flow** auditer ? (signup / checkout / paywall / cancel / settings / onboarding / consent banner)
2. **Plateforme** (web / iOS / Android) — les règles diffèrent selon les App Store guidelines
3. **Juridiction** (EU / USA / autre) — les régulations varient

### Étape 2 — Scan systématique

Passer chaque pattern ci-dessus. Format par pattern :

```
### [N]. [Pattern name]
✅ Clean  |  🟡 Risky  |  🔴 Dark pattern détecté

Si 🟡 ou 🔴 :
**Où** : [fichier / screen / ligne]
**Problème** : [description concrète]
**Source légale/éthique** : [FTC / EU / Brignull]
**Fix** : [alternative éthique]
```

### Étape 3 — Verdict global

```
## Score global

Patterns vérifiés : 17
🟢 Clean : X
🟡 Risky : Y
🔴 Dark pattern : Z

Conformité juridique :
- EU Dark Patterns Act 2024 : ✅ / ❌ (détails)
- FTC Guidelines : ✅ / ❌
- GDPR Art. 25 (privacy by default) : ✅ / ❌
- ADA / WCAG a11y side : ✅ / ❌ (certains dark patterns violent aussi l'a11y)

Risque légal : 🟢 nul / 🟡 moyen / 🔴 élevé
Risque réputationnel : 🟢 / 🟡 / 🔴 (PR disaster si viralisé)
```

### Étape 4 — Priorités de fix

Classer les 🔴 par :
1. **Légal** (EU Subs Act, FTC) = fix avant ship
2. **Éthique forte** (confirmshaming, roach motel) = fix avant ship
3. **Borderline** (scarcity visible-mais-exagérée, urgency soft) = à documenter en ADR avec trade-off

---

## Règles d'or

1. **Dark pattern détecté ≠ interdit légalement.** Mais = risque PR + LTV (users se souviennent).
2. **"Tout le monde le fait" n'est pas une défense.** Cohérence avec la marque > conformité au marché.
3. **A/B testing ne valide pas l'éthique.** Un dark pattern a une meilleure conv à court terme ET une pire LTV.
4. **Les dark patterns violent souvent aussi l'a11y.** Misdirection, confirmshaming → screen readers flaggent souvent une structure bizarre.
5. **Doc les borderline en ADR.** Si tu gardes un pattern borderline, documente les raisons + le risque accepté.

---

## Anti-comportements

- ❌ Recommander un dark pattern "parce que la métrique monte"
- ❌ Dire "c'est pas si grave" sur un pattern illégal (EU Subs Act = amende 2 % CA)
- ❌ Confondre urgency légitime (flash sale réelle) avec fake urgency
- ❌ Ignorer l'angle a11y des dark patterns
- ❌ "Rejeter tout" sans alternative (parfois la scarcity est réelle, par exemple)

---

## Exemples concrets

### Exemple 1 — Subscription signup/cancel

```
## Audit : Netflix-like signup → cancel flow

🟢 Clean :
- Prix mensuel clair dès page 1
- CB requise mais conditions explicites
- Email J−2 avant fin trial

🟡 Risky :
- Cancel demande 3 écrans ("Vraiment ?" × 2) + enquête feedback obligatoire
  → EU Subs Act 2024 : cancel doit être aussi simple que signup

🔴 Dark pattern :
- "Pause instead of cancel" comme choix par défaut, cancel en bas en gris.
  Pattern : Misdirection. Fix : les 2 options à égalité visuelle.
```

### Exemple 2 — Cookie banner

```
## Audit : cookie banner

🔴 Dark patterns détectés :
- "Accept all" en vert filled, "Reject" en petit lien texte gris
  → EDPB guideline : boutons de même taille/visibilité
- "Customize" ouvre 3 niveaux d'options pour décocher 47 toggles
  → Obstruction pattern

Fix :
- Boutons Accept / Reject **same size, same prominence**
- Options pré-cochées UNIQUEMENT essential cookies
- Customize accessible en 1 clic, pas 3
```

---

## Chain

Après l'audit, si l'user dit :

- **"fix tous les dark patterns"** → charge [`PROMPT_MASTER.md`](PROMPT_MASTER.md) pour implémenter les alternatives éthiques
- **"refais le wording"** → charge [`PROMPT_UX_WRITING.md`](PROMPT_UX_WRITING.md) (microcopy non-manipulative)
- **"propose growth éthique"** → charge [`PROMPT_GROWTH_UX.md`](PROMPT_GROWTH_UX.md) (alternatives éthiques à la même métrique cible)
- **"audit a11y aussi"** → charge [`PROMPT_A11Y_AUDIT.md`](PROMPT_A11Y_AUDIT.md) (souvent corrélé)

Règle : un seul prompt actif. Si l'user chaîne, termine le courant d'abord.
