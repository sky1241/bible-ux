# P0 / P1 / P2 / P3 bug report format

> Standardized output format for audits (DESIGN_AUDIT, CODE_REVIEW, A11Y_AUDIT).

## Priority buckets

| Bucket | Meaning | Example |
|:------:|---------|---------|
| 🔴 **P0** | Bloquant / casse l'UX ou l'a11y. À corriger AVANT merge. | `outline: none` sans alternative, touch target 20 px, info color-only, modal sans trap focus |
| 🟠 **P1** | Important / fait amateur. À prévoir ce sprint. | spacing 7/13/22 px, transitions 800 ms sur hover, pas de loading state, contrast 3.2:1 sur texte |
| 🟡 **P2** | Polish / différencie du reste. Backlog. | pas de skeleton, pas d'optimistic UI, pas de haptic mobile, pas de `content-visibility` |
| 🟢 **P3** | Nice to have si temps. | pourrait utiliser `@starting-style`, View Transitions, Core Web Vitals optimisables |

## Format de sortie standardisé

```markdown
# [Audit / Review] — [nom file / composant / screen]

**Contexte** : [langage / plateforme / type composant]
**Scope** : [review complet / focus a11y / focus perf / …]
**Verdict global** : X P0 · Y P1 · Z P2 · W P3

---

## 🔴 P0 — à corriger AVANT merge

### [#1] [titre court de l'issue]
**Où** : [fichier:ligne X–Y] (ou nom fonction)
**Problème** : [description technique précise, 1–2 lignes]
**Règle violée** : [FICHIER.md § XX] · [VALUES § ZZ si applicable]

Avant :
​```lang
[code problématique]
​```

Après :
​```lang
[code corrigé]
​```

---

## 🟠 P1 — important, à prévoir ce sprint

### [#2] …

---

## 🟡 P2 — polish, à mettre en backlog

### [#N] …

---

## 🟢 P3 — nice to have si temps

### [#M] …

---

## ✅ Points corrects

[3–5 lignes max — ce qui est déjà bien fait, pour contextualiser. Pas de flattering gratuit.]

---

## Checklist post-fix

- [ ] [vérif 1]
- [ ] [vérif 2]
- [ ] Re-run audit / review après fix

---

## Next steps

Dis "fix P0" / "fix P1" / "fix tout" → route vers PROMPT_MASTER pour implémentation.
```

## Règles du format

1. **P0 et P1 exigent un couple `Avant / Après`** en code. Pas de "just fix it".
2. **Chaque issue cite une bible ref.** Pas de convention externe sans source.
3. **Les issues similaires sont batchées.** 12 × `outline: none` dans un fichier = UNE issue P0 avec liste des lignes.
4. **Pas de flattering gratuit.** "Great code!" = interdit. "Points corrects" section reste factuelle, 3–5 lignes max.
5. **Scope respect.** Si user a dit "focus a11y", ne pas déborder sur perf ou i18n.
6. **Ordre = priorité, pas ordre d'apparition dans le fichier.** P0 #1 > P0 #2 > P1 #1 > P1 #2.

## Exemple concret (extrait)

```markdown
# Review — src/components/Login.tsx

**Contexte** : React + Tailwind + TypeScript
**Scope** : review complet
**Verdict global** : 2 P0 · 3 P1 · 1 P2

---

## 🔴 P0 — à corriger AVANT merge

### [#1] Input password sans label associé
**Où** : Login.tsx:42
**Problème** : `<input type="password"/>` sans `<label>` ni `aria-label`. Screen readers n'annoncent rien.
**Règle violée** : WEB § F (a11y labels)

Avant :
​```jsx
<input type="password" placeholder="Mot de passe" />
​```

Après :
​```jsx
<label htmlFor="pwd" className="block mb-1 font-medium">Mot de passe</label>
<input id="pwd" type="password" className="..." />
​```
```
