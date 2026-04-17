---
prompt: growth-ux
version: 1.0.0
updated: 2026-04-17
authors: [sky1241, claude-opus-4-7]
chains_from: [master, spec-from-scratch, design-audit]
chains_to: [master, design-audit, dark-pattern-detector, ux-writing]
trigger_aliases: ["growth ux", "retention", "onboarding conversion", "referral", "re-engagement"]
---

# MODE GROWTH UX — Patterns de croissance éthiques

## WHEN
- Tu veux améliorer une métrique de croissance (activation, retention D1/D7/D30, referral rate, LTV)
- Tu lances une feature growth (onboarding, referral program, re-engagement, paywall)
- Tu veux auditer une feature growth existante pour voir si elle est **éthique** ou **dark pattern**

## WHEN NOT
- Si tu veux détecter des dark patterns dans une UI existante → `PROMPT_DARK_PATTERN_DETECTOR.md`
- Marketing copy / landing → sort du scope bible-ux
- Stratégie business pure (pricing model, segments) → sort du scope

## TRIGGER VERBAL
"growth ux", "retention", "onboarding conversion", "referral", "re-engagement"

## PARAMS
- `growth onboarding` → focus first-use / activation
- `growth retention` → focus habits, streaks, notifications
- `growth referral` → focus invite, viral loops
- `growth monetization` → focus trial, paywall, upgrade paths
- `growth ethics` → audit éthique d'une feature existante

## SOURCE OF TRUTH

- [`../bibles/WEB.md`](../bibles/WEB.md) §§ N (Gamification), AA (E-commerce), BP (Urgency ethical), AK (Social), BQ (A/B testing)
- [`../bibles/MOBILE.md`](../bibles/MOBILE.md) §§ W (Gamification), AE (IAP + subscriptions), AF (ASO), BW (App rating), BL (Social)
- [`../bibles/WEARABLE.md`](../bibles/WEARABLE.md) § F (gamification watch)
- Hook Model (Nir Eyal) — ethical version
- Fogg Behavior Model
- [`PROMPT_DARK_PATTERN_DETECTOR.md`](PROMPT_DARK_PATTERN_DETECTOR.md) — la ligne rouge

---

## Les 4 piliers growth éthique

### 1. Activation — amener l'user à la "aha moment"

**Objectif :** l'user vit la valeur du produit le plus vite possible.

| Pattern | Quand | Bible |
|---------|-------|-------|
| Empty state as tutorial | App simple, 1 core job | WEB § V, MOBILE § AY |
| Progressive disclosure | App complexe, many features | MOBILE § AY |
| Pre-prime permissions | Demande permission OS | MOBILE § N |
| Onboarding checklist | Multiple setup steps | WEB § V §2 |
| Sample data | Productivity tool, demo | WEB § V |
| Social login | Réduire friction signup | WEB § Z |

**Règle :** **time-to-value < 60 secondes** sur mobile, < 30 s sur web pour un user qualifié.

**Anti-patterns :**
- ❌ 7 écrans d'onboarding carousel obligatoires (60–70 % skip)
- ❌ Demander email AVANT de montrer la valeur
- ❌ Tutorial pop-ups sur chaque élément (Hansel & Gretel UX)
- ❌ Permission cold start (push, location) avant le 1er moment de valeur

### 2. Retention — habit formation

**Objectif :** l'user revient sans que tu lui rappelles.

| Pattern | Impact typique | Bible |
|---------|----------------|-------|
| Streaks (7+ jours) | +3.6× retention | WEB § N, MOBILE § W |
| Daily login bonus | +15–30 % DAU | WEB § N §3 |
| Milestone celebrations | +10 % D30 | WEB § N §4 |
| Variable rewards | +20–40 % session (dopamine) | WEB § N §3 |
| Smart re-engagement notifs | +5–15 % returning | WEB § AY, MOBILE § BQ |
| Personalization | +25 % session length | WEB § AK |

**Règle :** la "habit loop" saine = **Trigger → Action → Variable reward → Investment**.

**Anti-patterns éthiques :**
- ❌ Streaks punitifs (perdre 365 jours pour 1 jour raté = anxiety)
- ❌ Variable rewards trop fréquentes (casino-like, voir MOBILE § AE)
- ❌ Notifications forcées sans value (spam)
- ❌ "Engagement hacking" qui nuit à l'user (pull-to-refresh random à la TikTok)

**Guardrails éthiques (bible-ux) :**
- [ ] Grace period 24–48 h pour streaks (VALUES § Gamification)
- [ ] Freeze tokens / vacations (Duolingo)
- [ ] Notifs **frequency cap** (max 1/jour transactional, 1/semaine re-engagement)
- [ ] Opt-out facile pour chaque type de notif

### 3. Referral — viral loops

**Objectif :** user devient ambassadeur, amène de nouveaux users.

| Pattern | Viral coefficient typique | Bible |
|---------|--------------------------|-------|
| Double-sided reward (invite & get X) | K > 1 possible | WEB § AK |
| Social sharing natif (iOS Share Sheet / Android Intent) | 5–10 % conv | MOBILE § AG |
| Referral contest / leaderboard | Pic viral temporaire | WEB § N §5 |
| In-product invitation (collab features) | Meilleur (forced viral) | WEB § AF |

**Règle K-factor :** **new users per existing user** = invited × conversion. Cible K > 0.5 = sain. K > 1 = viral.

**Anti-patterns :**
- ❌ Pop-up "invite tes amis" au 1er launch (user pas encore converti)
- ❌ Accès contact list sans explication (privacy creep)
- ❌ Fake "X de tes amis utilisent déjà [app]" (dishonest)
- ❌ "Unlock feature by inviting N friends" (gating coercitif)

**Timing correct :** proposer l'invite APRÈS l'aha moment, jamais avant.

### 4. Monetization — paywalls, trials, upgrades

**Objectif :** user paie sans friction excessive ni buyer's remorse.

| Pattern | Conv typique | Bible |
|---------|-------------:|-------|
| Freemium soft paywall (dismissable) | 2–5 % | MOBILE § AE §2 |
| Free trial no card (7–14j) | 40–60 % trial → 15–25 % convert | MOBILE § AE §2 |
| Free trial with card (14j) | 15–30 % trial → 50–70 % convert | MOBILE § AE §2 |
| Usage-limit paywall (après N usages) | 8–15 % | MOBILE § AE §2 |
| Feature-gate paywall | 5–10 % | MOBILE § AE §2 |
| Annual discount (20–40 % off) | +30 % LTV | MOBILE § AE §3 |

**Règle :** **paywall timing = au moment de la valeur**, pas avant (pas de paywall cold-start) ni après (pas de gating invisible).

**Transparence obligatoire :**
- [ ] Prix clairement affiché AVANT signup
- [ ] Conditions de trial (card required ? cancel anytime ? auto-renew ?) visibles
- [ ] **Cancel path** accessible en ≤ 3 clics (régul EU : Dark Patterns in Subscriptions Act)
- [ ] Email de rappel avant fin de trial (24 h avant billing)
- [ ] Prorata / remboursement partiel si annule en cours de période

**Anti-patterns = dark patterns, voir PROMPT_DARK_PATTERN_DETECTOR.md :**
- ❌ Forced continuity (trial → abo sans rappel)
- ❌ Roach motel (facile d'entrer, impossible de sortir)
- ❌ Misdirection ("No thanks" en micro-police)
- ❌ Hidden costs (taxes/frais cachés jusqu'au dernier écran)

---

## Workflow d'audit d'une feature growth

1. **Identifier la feature** (activation / retention / referral / monetization)
2. **Identifier la métrique cible** (D1 ? D30 ? K-factor ? trial-to-paid ?)
3. **Appliquer la grille du pilier correspondant**
4. **Flag les anti-patterns éthiques** — PAS par dogme, mais par chiffres (NN/g, Baymard, FTC cases)
5. **Proposer les optimisations éthiques** qui améliorent la métrique SANS sacrifier la confiance
6. **Chiffrer l'impact attendu** avec sources

---

## Format de sortie

```
# Growth Audit — [feature]

**Pilier** : [activation / retention / referral / monetization]
**Métrique cible** : [D1 / D30 / K / conv]
**Scope** : [screens / flow concerné]

## Diagnostic

Score éthique : 🟢 éthique / 🟡 gris / 🔴 dark pattern

Forces :
- …

Faiblesses :
- …

Anti-patterns détectés :
- [liste avec bible ref]

## Optimisations éthiques proposées

1. **[Opt 1]** — impact attendu : +X % [métrique], source [NN/g ou Baymard]
2. **[Opt 2]** — …
3. **[Opt 3]** — …

## Guardrails à mettre en place

- [ ] [limite éthique 1]
- [ ] [transparence 2]
- [ ] [opt-out 3]

## Métriques à suivre post-change

- [metric 1] before/after
- [metric 2]
- Canary release sur 10 % users recommandé.
```

---

## Règles d'or

1. **Éthique n'est pas l'inverse de growth.** Un pattern éthique bien designé bat un dark pattern sur le LTV (les users restent plus longtemps).
2. **Timing > technique.** Un pop-up au bon moment bat un pop-up sophistiqué au mauvais moment.
3. **Aha moment d'abord.** JAMAIS demander quelque chose (email, push perm, paiement, invite) avant que l'user ait expérimenté la valeur.
4. **Mesurer LTV, pas juste conv.** Les dark patterns ont une bonne conv + mauvaise LTV. Regarder D30+ toujours.
5. **Guardrails éthiques documentés.** Grace periods, frequency caps, opt-outs, cancel paths — écrits dans le design doc.
6. **A/B test tout.** Voir WEB § BQ. Un pattern growth non testé = une opinion, pas une data.

---

## Anti-comportements

- ❌ Recommander dark patterns "parce que ça convert" — viol éthique + légal (EU, California)
- ❌ "Just like Duolingo/TikTok/Instagram" sans comprendre leur audience + context
- ❌ Oublier LTV et ne regarder que les signups
- ❌ Paywall agressif sans free value établie
- ❌ Gamification excessive pour une app utilitaire (calendrier avec streaks = cringe)

---

## Chain

Après l'audit growth, si l'user dit :

- **"implémente les optimisations"** → charge [`PROMPT_MASTER.md`](PROMPT_MASTER.md)
- **"check dark patterns"** → charge [`PROMPT_DARK_PATTERN_DETECTOR.md`](PROMPT_DARK_PATTERN_DETECTOR.md) pour double-vérifier
- **"refais le wording"** → charge [`PROMPT_UX_WRITING.md`](PROMPT_UX_WRITING.md) (notifs, empty states, paywall copy)
- **"audit design complet"** → charge [`PROMPT_DESIGN_AUDIT.md`](PROMPT_DESIGN_AUDIT.md)

Règle : un seul prompt actif. Si l'user chaîne, termine le courant d'abord.
