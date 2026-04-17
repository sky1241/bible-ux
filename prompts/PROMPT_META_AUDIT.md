---
prompt: meta-audit
version: 1.0.0
updated: 2026-04-17
authors: [sky1241, claude-opus-4-7]
chains_from: [master]
chains_to: [master]
trigger_aliases: ["meta audit", "audit la bible", "scan bible-ux", "meta", "audit interne"]
---

# MODE META AUDIT — Audit bible-ux lui-même

## WHEN
- Tu veux vérifier que **la bible reste cohérente** avec elle-même (pas de contradictions, pas de valeurs stale, pas de cross-refs cassés)
- Tu viens de **terminer un gros batch** d'intégration DR et tu veux valider avant de bumper la version
- Tu sens qu'un sujet (iOS 18, watchOS 12, CSS 2025) a évolué et tu veux trouver où la bible est en retard
- Tu lances une **release** et tu veux le "compliance check" du repo

## WHEN NOT
- Tu veux auditer un produit utilisateur → `PROMPT_DESIGN_AUDIT.md`
- Tu veux vérifier les liens uniquement → `bash scripts/check-links.sh` directement
- Tu veux regen stats → `bash scripts/update-stats.sh`

## TRIGGER VERBAL
"meta audit", "audit la bible", "scan bible-ux", "audit interne"

## PARAMS
- `meta audit quick` → scan rapide links + stats (utilise les scripts, 30 s)
- `meta audit` (default) → scan complet (links + stats + contradictions + stale + cross-refs)
- `meta audit deep` → complet + web search pour vérifier les sources externes (URLs mortes, versions dépassées)
- `meta audit section [X]` → audit ciblé sur une section/bible

---

## Protocole complet

### Étape 1 — Scripts automatisés

Lancer d'abord les outils déjà en place :

```bash
bash scripts/check-links.sh     # Cross-refs internes
bash scripts/update-stats.sh    # Stats à jour
git diff stats.json              # Flag si les stats ont drifté
```

Si ça passe : ✅ fondations OK.
Si ça casse : ❌ fix ça AVANT de continuer.

### Étape 2 — Contradictions entre fichiers

Le repo maintient une **hiérarchie** : `VALUES.md > bibles > DESIGN_TREE > prompts`. Un conflit n'est pas un bug si VALUES.md gagne, mais doit être documenté.

**Check systématique :**

1. **Touch targets cohérents ?**
   - VALUES § Touch targets : iOS 44 pt, Android 48 dp, Web 24/44 px, Wear 48/52 dp, visionOS 60 pt
   - Grep `bibles/*.md` pour chaque valeur, flag les occurrences hors norme

2. **Contrast ratios cohérents ?**
   - VALUES § Contrast : 4.5:1 text AA, 3:1 UI, 7:1 AAA
   - Flag mentions d'autres ratios non-WCAG dans les bibles

3. **Animation timings cohérents ?**
   - VALUES § Animation : micro 100–150, state 200, page 300…
   - Flag mentions d'autres timings dans bibles

4. **Spacing scale cohérent ?**
   - VALUES § Spacing : 4/8/12/16/24/32/48/64/80/96
   - Flag mentions de 7, 13, 22, 15 dans bibles (multiples non-canoniques)

5. **Cross-refs entre bibles**
   - `bibles/MOBILE.md § CJ` doit pointer vers `bibles/XR.md` (pas `XR.md` naked)
   - Grep les `§ CX` / `§ DY` et vérifier que la section existe bien

### Étape 3 — Valeurs stale (dépassées)

Flag tout ce qui dit "iOS N", "Android M", "Chrome V" avec des versions dépassées :

**Seuils actuels (2026-04-17) :**

| Tech | Version stable courante | Flag si bible dit |
|------|------------------------|-------------------|
| iOS | 19 (Liquid Glass) | "iOS 17" / "iOS 18" dans un contexte "latest" |
| Android | 16 | "Android 14" / "15" dans "latest" |
| watchOS | 12 | "watchOS 10" / "11" dans "latest" |
| Wear OS | 5 | "Wear OS 4" dans "latest" |
| WCAG | 2.2 | "WCAG 2.1" dans "compliance target" |
| Material | Material 3 (Expressive) | "Material 2" |
| Chrome | 124+ features | ≤ 112 sans ref historique |
| Safari | 17+ features | ≤ 15 sans ref historique |
| OpenXR | 1.1 | "1.0 only" sans ref historique |

Flag aussi les **roadmap items annoncés mais non shippés** :
- "Apple Smart Glasses 2027" = OK (clairement labelled rumored)
- "Vision Pro Air 2026" = OK (clairement rumored)
- "Meta Quest 4" sans rumored = ❌

### Étape 4 — Sources mortes

Sur `meta audit deep`, lance un check HTTP sur chaque URL externe :

```bash
# Extract all external links from bibles + prompts
grep -hoE 'https?://[^) ]+' bibles/*.md prompts/*.md _sources/SOURCES.md \
  | sort -u > /tmp/all-urls.txt

# Check each (20s timeout, HEAD only)
while IFS= read -r url; do
  code=$(curl -s -o /dev/null -w "%{http_code}" -I --max-time 20 "$url")
  if [ "$code" != "200" ] && [ "$code" != "301" ] && [ "$code" != "302" ]; then
    echo "$code $url"
  fi
done < /tmp/all-urls.txt
```

Flag les 4xx / 5xx / timeouts. Vérifier si une redirection 301 pointe toujours vers du contenu pertinent.

### Étape 5 — Sections orphelines

Une section dans une bible est **orpheline** si aucun autre fichier ne la référence. Pas forcément un bug (les sections rarement appelées existent), mais signal à reviewer.

Grep reverse : pour chaque `## XX` header dans `bibles/`, compter les références externes. < 2 refs = flag pour review.

### Étape 6 — Duplications oubliées

Parfois un concept finit décrit dans 2–3 endroits (ex. "loading states" dans WEB § R + MOBILE § AZ + fragment states-coverage). C'est OK quand intentionnel + cohérent, KO quand divergent.

Grep les mots-clés majeurs (touch, spacing, contrast, loading, modal, toast…) et flagger les occurrences qui donnent des valeurs différentes.

### Étape 7 — Format du rapport

```markdown
# Meta Audit — YYYY-MM-DD

## Score global

Fondations : ✅ / ❌
Contradictions : X flagged
Stale values : Y flagged
Dead URLs : Z / N checked
Orphan sections : W
Duplications divergentes : V

**Verdict** : 🟢 clean / 🟡 needs curation / 🔴 ship blocker

---

## 🔴 Blockers (avant next release)

- [ ] [Fichier:Ligne] [problème] · Fix suggéré
- ...

## 🟠 Curation (à faire ce sprint)

- [ ] [Fichier:Ligne] [stale/contradiction] · Fix suggéré
- ...

## 🟡 Polish (backlog)

- [ ] [Fichier:Ligne] [orphan/duplication] · Fix optionnel
- ...

## ✅ Points validés

- Touch targets cohérents entre bibles et VALUES.md
- ...

---

## Méthodologie

- `scripts/check-links.sh` : X links, Z broken
- `scripts/update-stats.sh` : X files, Z content lines
- Contradictions scan : [list keywords checked]
- Stale scan : [list versions checked]
- Dead URL scan : [skipped / N checked]

---

## Next actions

Dis `fix blockers` → charge `PROMPT_MASTER.md` pour attaquer les 🔴.
```

---

## Règles d'or

1. **Fondations d'abord.** Pas de meta audit valable si `check-links.sh` casse.
2. **VALUES.md gagne toujours.** Toute contradiction entre bible et VALUES = la bible est stale.
3. **Stale ≠ wrong.** iOS 17 mentionné dans une section "history" = OK. iOS 17 dans "current best practice" = flag.
4. **Orphan ≠ inutile.** Certaines sections sont rarement référencées mais valables (ex. legacy platform docs).
5. **Honnêteté méthodologique.** Si on n'a pas scanné les URLs externes, le dire explicitement dans le rapport.

## Anti-comportements

- ❌ Flagger un pattern qui a été volontairement dupliqué pour discoverability
- ❌ "Version X dépassée" sans proposer quelle version mentionner à la place
- ❌ Générer un rapport sans actions concrètes (doit toujours finir sur une todo list)
- ❌ Oublier d'écrire le rapport dans `META_AUDIT_REPORT.md` (fichier gitignored ou pas selon préférence)

---

## Chain

Après le rapport, si l'user dit :

- **"fix blockers"** / **"fix tout"** → charge [`PROMPT_MASTER.md`](PROMPT_MASTER.md) pour implémenter les fixes
- **"curation ce sprint"** → charge un prompt dédié à la bible à curater (ex. `PROMPT_DEEP_RESEARCH_XR.md` si XR est stale)
- **"laisse en l'état"** → sauvegarde le rapport et close

Règle : un seul prompt actif. Si l'user chaîne, termine le courant d'abord.
