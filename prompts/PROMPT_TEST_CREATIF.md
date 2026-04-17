---
prompt: test-creatif
version: 1.1.0
updated: 2026-04-17
authors: [sky1241]
chains_from: []
chains_to: []
trigger_aliases: ["surprends-moi", "sors des règles", "mode libre"]
---

# PROMPT TEST CRÉATIF

## WHEN
- Tu veux voir ce que donne Claude/GPT en mode "free", sans citation de règles
- Tu es bloqué en mode mécanique/ennuyeux et tu veux du créatif
- Tu testes une nouvelle conversation Claude (session neuve)

## WHEN NOT
- Production / projet client → utiliser `PROMPT_MASTER.md` (cadre pro)
- Tu veux un fix précis → `PROMPT_CSSFIX.md`
- Tu veux une critique structurée → `PROMPT_DESIGN_AUDIT.md`

## TRIGGER VERBAL
"surprends-moi", "sors des règles", "mode libre"

## NOTE
Ce prompt désactive volontairement le cadre bible-ux. Il s'utilise rarement, et toujours en session isolée. Pas à combiner avec les autres prompts dans la même session.

---

Copie-colle ce texte dans une NOUVELLE conversation:

---

Voilà mon app: [colle ton screenshot]

Fais-en quelque chose de beau. Surprends-moi.

Je te dis juste "j'aime" ou "j'aime pas", tu ajustes.

Go.

---

## RÈGLES POUR TOI (pas pour Claude)

1. Tu ne mentionnes PAS les règles UX
2. Tu ne mentionnes PAS WEB.md ou MOBILE.md
3. Tu ne guides PAS - tu réagis
4. Tu dis juste: "j'aime" / "j'aime pas" / "plus de X" / "moins de Y"

## SI ÇA MARCHE

Tu retrouves le mode créatif d'il y a 2 jours.

## SI ÇA MARCHE PAS

Reviens ici et dis-moi ce qui s'est passé.
