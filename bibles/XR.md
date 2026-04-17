# UX XR / Spatial Computing — Patterns Headsets & Smart Glasses

> Règles UX/UI cross-plateforme pour les casques VR/MR (Vision Pro, Meta Quest, Samsung Galaxy XR, Pico, Vive, Varjo, PSVR2, Bigscreen, MeganeX) et les lunettes connectées (Ray-Ban Meta, XREAL, VITURE, Rokid, RayNeo, Halliday, Snap Spectacles).
> Sources : Apple visionOS HIG, Meta Horizon OS design guidelines, Android XR developer docs, Khronos OpenXR 1.1, W3C WebXR, Samsung Galaxy XR specs, Sony PSVR2 specs, ChatGPT Deep Research baseline 2026, HCI peer-reviewed papers (CHI, arXiv).
> Règle d'or : **XR UI is sized by angular demand, not inherited 2D pixels**. Grandes cibles, placement central, espacements généreux, courtes lignes de lecture, scaling dynamique.

---

## A. Fondamentaux Hardware & Display

### 1. Deux classes pratiques en 2026

Le marché XR consumer s'est scindé en **deux classes distinctes** qu'il faut traiter comme deux plateformes UX différentes :

| Classe | FOV typique | Usage principal | Règle de design |
|--------|-------------|-----------------|-----------------|
| **Full headset** (Vision Pro, Quest, Galaxy XR, Pico, Vive, Varjo, PSVR2) | 100–120° | VR/MR immersif | Panels spatiaux, profondeur riche, scene anchors |
| **Smart glasses** (Ray-Ban Meta, XREAL, VITURE, Rokid, Halliday) | 0–57° (ou no display) | HUD, écran privé, AI assistant | UI ultra-réduite : 1–2 lignes, 1 action dominante |

**Anti-pattern fondamental :** designer une UI lunettes comme une UI casque. C'est le plus gros piège 2026. Source : [Android XR Spatial UI](https://developer.android.com/design/ui/xr/guides/spatial-ui).

### 2. Catalogue Casques XR (baseline vérifié)

| Device | Poids | FOV | Résolution/œil | PPD | Refresh | Input | Autonomie | Source |
|--------|------:|-----|---------------|----:|--------:|-------|----------:|--------|
| **Apple Vision Pro (2024)** | 750–800 g + batterie 353 g | — | — | — | — | eyes, hands, voice ; IPD 51–75 mm | 2.5 h général, 3 h vidéo | [Apple](https://www.apple.com/apple-vision-pro/specs/) |
| **Apple Vision Pro M5 (2025)** | idem | — | — | — | — | idem + Logitech Muse + PSVR2 Sense compatibles | idem | [Apple Support](https://support.apple.com/en-us/125436) |
| **Meta Quest 3** | — | 110° H × 96° V | — | 25 | 72/90/120 Hz | hands + Touch Plus | — | [Meta](https://www.meta.com/quest/quest-3/) |
| **Meta Quest 3S** | — | — | 1832 × 1920 | 20 | 72/90/120 Hz | idem Quest 3 | — | [Meta](https://www.meta.com/quest/quest-3s/) |
| **Samsung Galaxy XR (2025)** | 545 g | 109° H × 100° V | 4K micro-OLED (4032 PPI) | — | — | eye, hand, voice ; batterie externe | — | [Samsung](https://www.samsung.com/us/xr/galaxy-xr/galaxy-xr/) |
| **PICO 4** | — | 105° | 2160 × 2160 | 20.6 | 72/90 Hz | controllers + hands ; IPD 62–72 mm seamless | — | [PICO](https://www.picoxr.com/global/products/pico4/specs) |
| **HTC Vive Focus Vision** | — | jusqu'à 120° | 2448 × 2448 | — | jusqu'à 120 Hz (DisplayPort) | Snapdragon XR2, 12 GB RAM, 128 GB | — | [Vive](https://www.vive.com/us/product/vive-focus-vision/specs/) |
| **Varjo XR-4** | — | 120° × 105° | 3840 × 3744 | **51** | — | eye tracking 200 Hz, IPD 56–72 mm auto | — | [Varjo](https://varjo.com/products/xr-4) |
| **PlayStation VR2** | — | ~110° | 2000 × 2040 OLED | — | 90/120 Hz | Sense controllers, per-eye eye tracking | tethered PS5 | [PlayStation](https://www.playstation.com/en-tr/ps-vr2/ps-vr2-tech-specs/) |
| **Bigscreen Beyond 2** | **107 g** | 116° | — | — | — | — | — | [Bigscreen](https://store.bigscreenvr.com/products/bigscreen-beyond-2) |
| **Shiftall MeganeX superlight 8K** | 179 g | — | 3552 × 3840 | — | 72/75/90 Hz | motorized IPD 58–72 mm, 0D to -7D focus | tethered | [Shiftall](https://en.shiftall.net/products/meganex8k) |

**Lecture UX du tableau :**
- Varjo XR-4 (51 PPD) est la seule référence proche d'une vraie legibility "human-eye class" pour productivité. Consumer headsets restent en zone de compromis pour le dense text.
- Bigscreen Beyond 2 (107 g) prouve que la masse matters plus que les specs : une baisse de 400 g change le confort session plus qu'un bump de PPD.
- Galaxy XR + Vision Pro sont la classe premium ; Quest 3/3S la classe mainstream ; Pico 4 la classe consumer mature.

### 3. Catalogue Smart Glasses (baseline vérifié)

| Device | Poids | FOV | Display | Battery | AI on-device | Source |
|--------|------:|----:|---------|--------:|--------------|--------|
| **Ray-Ban Meta Gen 2** | 48 g (S) / 50 g (L) | **0° (no display)** | — | 8 h + 48 h (case) | Meta AI via cloud | [Meta](https://www.meta.com/ai-glasses/ray-ban-meta-wayfarer-gen-2/) |
| **Meta Ray-Ban Display** | — | 20° | 600 × 600, 42 PPD, 90 Hz display / 30 Hz content | — | — | [Meta](https://www.meta.com/ai-glasses/meta-ray-ban-display-glasses-and-neural-band/) |
| **XREAL Air 2 / Air 2 Pro** | 72 / 75 g | 46° | 1920 × 1080 per eye, 120 Hz | — | — | [XREAL](https://www.xreal.com/air2) |
| **XREAL One / One Pro** | 84–87 g | 50° / 57° | — | — | — | [XREAL](https://www.xreal.com/glasses/compare) |
| **XREAL Beam / Beam Pro** | — | — | compute puck, 3D spatial camera (Pro) | 3.5 h (Beam) | — | [XREAL](https://uk.shop.xreal.com/products/xreal-beam) |
| **VITURE Luma Pro** | — | 52° | "1200p" virtual display, 1000 nits | — | -4.0 D myopia adjustment | [VITURE](https://www.viture.com/product/viture-luma-pro-xr-glasses) |
| **Rokid Max / Max 2** | 75 g | 50° | 600 nits, 90 Hz | — | myopia to -6.00 D | [Rokid](https://au.rokid.com/products/rokid-max-2-ar-glasses) |
| **RayNeo X3 Pro** | 76 g titanium | — | binocular MicroLED full-color AR | — | Snapdragon AR1 Gen 1 + Gemini | [RayNeo](https://eu.rayneo.com/products/x3-pro-ai-display-glasses) |
| **Halliday** | **28.5 g** | — | "invisible display" | 12 h | proactive assistant | [Halliday](https://hallidayglobal.com/) |
| **Snap Spectacles 5 (dev kit)** | — | 46° diag | 37 PPD, auto-tinting | — | — | [Snap](https://newsroom.snap.com/sps-2024-spectacles-snapos) |

**Lecture UX :**
- Ray-Ban Meta (sans display) = AI/audio/camera wearable → UX **voice-first, glance-free, socially acceptable**. Pas une UI spatiale.
- XREAL/VITURE/Rokid = monitor replacement → panels fixes, pas anchoring room-scale.
- Halliday (28.5 g, 12 h) = proactive assistant → **une ou deux lignes, alertes subtiles, context-aware prompts**.
- Snap Spectacles 5 = dev kit see-through AR, pas grand public.

### 4. PPD et seuil "retina" en XR

| Métrique | Valeur | Notes |
|----------|--------:|-------|
| Retina shorthand (historic) | **~60 PPD** | Utile comme benchmark historique |
| Foveal limit achromatic (2025) | **~94 PPD** | [Cambridge research](https://www.cam.ac.uk/research/news/is-your-ultra-hd-tv-worth-it-scientists-measure-the-resolution-limit-of-the-human-eye) |
| Consumer 2026 headsets | 20–25 PPD | Zone compromis pour dense text |
| Enterprise benchmark (Varjo XR-4) | 51 PPD | Proche legibility productive |
| Meta Ray-Ban Display (glasses) | 42 PPD | HUD-class, pas window-class |
| Snap Spectacles 5 | 37 PPD | See-through AR dev |

**Impact UX :** sur Quest 3S (20 PPD), forcer text sizing plus agressif + contrôles plus larges + UI low-detail qu'en Vision Pro / Galaxy XR.

### 5. Ergonomie physique

| Facteur | Rule | Source |
|---------|------|--------|
| Poids optimal session longue | < 200 g idéal ; 500–800 g = rupture confort à 1 h | [Bigscreen Beyond 2 benchmark](https://store.bigscreenvr.com/products/bigscreen-beyond-2) |
| Distribution | Battery externe (Vision Pro, Galaxy XR) réduit front-heaviness | Apple, Samsung |
| IPD supporté | 51–75 mm minimum (Vision Pro), seamless > discrete steps | Apple, PICO |
| Diopter adjustment | ZEISS Optical Inserts (Vision Pro) ou lentilles amovibles | Apple |
| Child safety age minimum | Quest 10+ avec supervision, Vision Pro 13+ | [Meta parent info](https://www.meta.com/quest/parent-info/), Apple |

---

## B. UI Spatiale — Métriques cross-plateforme

### 6. Unités : angle, pas pixel

La règle la plus importante : **XR UI is sized by angular demand, not inherited 2D pixels**. Ce qui compte :

- Taille angulaire en **degrés d'arc** vue depuis l'œil
- Distance du contenu en **mètres** (pas en points/pixels)
- Scaling **dynamique** pour préserver la taille angulaire quand la fenêtre bouge

### 7. Dimensions canoniques cross-plateforme

| Pattern | visionOS | Android XR | Horizon OS (Meta) | Source |
|---------|----------|------------|-------------------|--------|
| Window par défaut | 1280 × 720 pt, ~2 m devant user, ~3 m apparent width | panel centre 1.75 m et 5° sous eye level | scene-aware | [Apple HIG windows](https://developer.apple.com/design/human-interface-guidelines/windows), [Android XR spatial-ui](https://developer.android.com/design/ui/xr/guides/spatial-ui) |
| Distance reading-heavy | ~1 m (exemple Apple) | 1.75 m | — | idem |
| Safe zone contenu principal | central 41° (Android XR) | idem | central 40–60° (reading zone sans head rotation) | [Android XR foundations](https://developer.android.com/design/ui/xr/guides/foundations) |
| Minimum eye target | **60 pt** | — | — | [Apple HIG buttons](https://developer.apple.com/design/human-interface-guidelines/buttons) |
| Minimum hit target Horizon OS | — | — | **22 × 22 mm / 48 dp / 3° FOV @ 0.42 m** (visual min 32 dp) | [Meta XR hand tracking](https://developers.meta.com/horizon/documentation/unity/unity-handtracking-overview/) |
| Scaling rule | Dynamic scale preserves target area | 0.868 dp-to-dmm (tied to angular legibility) | — | [Apple rendering hover](https://developer.apple.com/documentation/CompositorServices/rendering_hover_effects_in_metal_immersive_apps), [Android XR foundations](https://developer.android.com/design/ui/xr/guides/foundations) |

**Règle unifiée de design cible :** en XR, **48 dp / 60 pt / 3° FOV** sont des façons différentes de dire la même chose — fais les contrôles plus grands que mobile et sépare-les clairement.

### 8. Distance de contenu

| Zone | Distance | Usage |
|------|---------:|-------|
| Arm's length | 0.5–0.7 m | Manipulation directe (pinch sur objet) |
| Workspace | 1–2 m | Reading, UI secondaire, productivité |
| Immersive | 2–10 m | Cinéma, paysages, environnements |
| Far / skybox | > 10 m | Horizon, éléments décoratifs |
| Dead zone proche | < 0.25–0.3 m | **Interdit** : yeux croisés, eye strain |
| Dead zone loin | > 5 m pour reading | Text devient dur à lire |

**Vergence-accommodation :** dans la CHI 2018 VR reading study, focus distance casque ~1.3 m, "most comfortable" vergence median 2.7 m avec variance large. → pas de magic distance, juste **évite de coller du texte persistant à la face**.

### 9. Text block geometry (CHI 2018, [Dingler et al.](https://kaikunze.de/papers/pdf/dingler2018vr.pdf))

| Paramètre | Valeur préférée | Note |
|-----------|-----------------|------|
| Lignes par bloc | **7.3 ± 1.7** | Tighter que desktop |
| Caractères par ligne | **40 ± 6.5** | Courte mesure = moins eye travel |
| Centre bloc vs horizontal | **~1° sous eye level** | Matche naturally-downward gaze |
| x-height | **1.3° ± 0.44** | Visual angle, pas px |
| Capital height | **1.8° ± 0.61** | idem |
| Body height | **2.3° ± 0.77** | idem |

**En clair :** body text doit faire au moins la classe 1–2° angular sinon legibility s'effondre sur mainstream headsets.

### 10. Contraste en XR

Une étude VR text sur Oculus Go et Quest a trouvé les contrastes préférés **8.7:1 à 11.9:1** pour "best reading" — **bien au-dessus des minimums WCAG 2D (4.5:1)**.

**Règle pour XR :** dépasse les minimums WCAG. Cible 7:1 AAA comme plancher, pas 4.5:1 AA.

### 11. Anti-patterns UI spatiale (cross-plateforme)

Ces patterns sont mauvais sur visionOS, Horizon OS, Android XR et glasses — sans exception :

- ❌ **Tiny text** (< 1° body height)
- ❌ **Edge-pinned critical controls** (hors central safe zone)
- ❌ **Fixed-scale panels** qui reculent jusqu'à devenir illisibles
- ❌ **Long paragraphs > 40–50 caractères par ligne**
- ❌ **Persistent head-locked overlays** centrés en vue → motion sickness garantie
- ❌ **Flat mobile port** (window remplie d'une UI iPhone 2D)
- ❌ **Invisible interactivity** (pas de hover effect sur élément tappable)
- ❌ **Depth abuse** (UI éparpillée à Z dépths radicaux → vergence-accommodation discomfort)

### Checklist UI spatiale

- [ ] Primary reading + confirmation UI dans central 40–60° de vue
- [ ] Reading blocks ~40 chars wide, ~7 lines tall
- [ ] Targets ≥ 60 pt (visionOS) ou 48 dp / 3° (Horizon OS, Android XR)
- [ ] Dynamic scale activé, jamais fixed scale pour contrôles distants
- [ ] Contraste ≥ 7:1 sur body text (AAA floor en XR)
- [ ] Aucun head-locked persistant
- [ ] Body text ≥ 1° angular height

---

## C. Input Methods

### 12. Modèle dominant 2026 : multimodal by default, singular by exception

| Plateforme | Modèle input | Source |
|-----------|--------------|--------|
| **visionOS** | **Gaze + pinch.** Eyes establish intent, system hover confirms focus, pinch confirms action. App ne voit **pas** la raw gaze. | [Apple HIG eyes](https://developer.apple.com/design/human-interface-guidelines/eyes), [Apple hover rendering](https://developer.apple.com/documentation/CompositorServices/rendering_hover_effects_in_metal_immersive_apps) |
| **Horizon OS (Meta Quest)** | Hands + controllers + voice. Hands for natural reach, controllers for precision-heavy. | [Meta MR design](https://developers.meta.com/horizon/design/mr-design-guideline/) |
| **Android XR** | Explicitement cross-input : hand, eye, voice, controllers, keyboard, mouse, trackpad. | [Android XR considerations](https://developer.android.com/design/ui/xr/guides/considerations) |
| **WebXR** | Abstracted via WebXR Device API, delegate to native runtime. | [W3C WebXR](https://www.w3.org/TR/webxr/) |

**Règle cross-plateforme :** support **hands + ray + voice + external input**. Ne pas parier sur une seule modality.

### 13. Gaze-first (visionOS paradigm)

- Eye tracking établit l'intent, pas l'action
- App reçoit `is_hovered` boolean, **JAMAIS la raw gaze data** (privacy)
- Pinch confirme
- **Midas touch problem** évité : eye gaze seul ne trigger jamais

**Hover effects obligatoires** sur tout élément interactif — sans hover, user ne sait pas ce qui est tappable :

```swift
// visionOS
Button(action: { selectItem() }) {
    ItemCard(item: item)
}
.buttonStyle(.plain)
.hoverEffect(.highlight)  // .automatic / .highlight / .lift
```

### 14. Hand tracking

| Règle | Valeur | Source |
|-------|--------|--------|
| Hand tracking rate | Meta 60 Hz, Vision Pro 90 Hz | Meta / Apple |
| Pinch distance threshold | ~20 mm pouce-index | Meta XR docs |
| Précision fine selection | 3–5 mm | Research community |
| Gorilla arm fatigue | Évite full-arm extension répétée > 30 s | UX research |
| Controllers vs hands | Hands OK pour natural reach/pinch/grab ; controllers requis pour precision gaming, CAD, dessin fin | [Meta hand tracking](https://developers.meta.com/horizon/documentation/unity/unity-handtracking-overview/) |

### 15. Ray casting

- **Obligatoire pour UI distante** ([Meta MR design](https://developers.meta.com/horizon/design/mr-design-guideline/))
- Hand-anchored ou controller-anchored
- Stabilité : filter (one-euro filter typique) pour réduire le tremblement
- Indicator bout de ray : dot / cursor / icon, change si target valide
- Ne **jamais** forcer full-arm extension répétée pour atteindre des contrôles distants

### 16. One-handed alternatives

**Règle Android XR :** essential actions prioritize one-handed interaction. Si un two-handed gesture est nécessaire, **fournir un one-handed alternative** ([Android XR considerations](https://developer.android.com/design/ui/xr/guides/considerations)).

Exemple : "grab with both hands to scale" → fallback "pinch + stick to scale".

### 17. Body-position flexibility

Layout ne doit **jamais** assumer standing at average height. Support explicite :
- Seated
- Standing
- Reclined (Android XR)
- Assistive device users (Horizon OS)
- Height adjustment offered

Sources : [Meta comfort](https://developers.meta.com/horizon/design/comfort/), [Android XR considerations](https://developer.android.com/design/ui/xr/guides/considerations).

### 18. Text entry throughput (2026 synthesis)

| Méthode | WPM moyenne | Source |
|---------|------------:|--------|
| Physical keyboard | ~50–70 | — |
| Dictation (voice) | 30–50 | — |
| Controller virtual keyboard | **15.3** | [arXiv 2604.03520](https://arxiv.org/html/2604.03520v1) |
| Hand tracking air-type | **13.8** | idem |
| Laser peck virtual keyboard | ~8–12 | Research community |

**Hiérarchie cross-plateforme :**
1. Physical keyboard si desk-plausible
2. Dictation si privacy/noise permet
3. Controller/gaze virtual keyboard pour short + medium input
4. Air typing uniquement pour quick tokens, **jamais** pour pro writing

---

## D. Locomotion & Comfort

### 19. Locomotion defaults (Horizon OS)

| Mode | Recommandation | Risque nausée |
|------|----------------|---------------|
| **Teleport** | Default recommandé | Minimal |
| **Snap turn** | Default + opt-in smooth | Minimal (30°/45°/90° recommandés) |
| **Smooth locomotion** | Opt-in seulement | Élevé |
| **Smooth turn** | Opt-in seulement | Élevé |
| **Room-scale** | Safe zone Guardian (Meta) / Chaperone | — |

Source : [Meta locomotion user preferences](https://developers.meta.com/horizon/design/locomotion-user-preferences/).

**Règle d'or :** **never ship a smooth-locomotion-only experience.**

### 20. Motion sickness prevention

- ❌ **Sudden acceleration** — cause principale de vection / nausée
- ❌ **Rapid direction changes**
- ❌ **Unnatural camera movement** (forced camera motion = #1 retention killer)
- ✅ Constant velocity préférable
- ✅ Vehicle-mode : cockpit reference visible réduit la nausée
- ✅ Vignette dynamique pendant mouvement (réduit peripheral FOV)
- ✅ Deceleration < 2 m/s²

Source : [Meta comfort guide](https://developers.meta.com/horizon/design/comfort/).

### 21. Session duration guidance

| Niveau user | Max session | Note |
|-------------|-------------|------|
| First-time | 10–15 min | Build tolerance graduellement |
| Intermediate | 30 min | Avec pauses |
| Experienced | 1–2 h | Avec pauses 20-20-20 (regarder loin toutes les 20 min) |

---

## E. Passthrough, Anchors, Occlusion, Persistence

### 22. Camera / passthrough access par plateforme

| Plateforme | Accès camera passthrough | Permission | Source |
|-----------|--------------------------|-----------|--------|
| **visionOS** | Pas d'accès direct pour apps tierces ; main-camera access via dedicated entitlement (enterprise API) | Entitlement | [Apple Support 125436](https://support.apple.com/en-us/125436) |
| **Horizon OS (Quest 3 / 3S)** | Passthrough Camera API via Camera2 avec `CAMERA` ou `HEADSET_CAMERA` permission + passthrough activé | Runtime permission | [Meta Spatial SDK PCA](https://developers.meta.com/horizon/documentation/spatial-sdk/spatial-sdk-pca-overview/) |
| **Android XR** | Permissions model | Runtime permission | [Android XR docs](https://developer.android.com/design/ui/xr/guides/considerations) |
| **Snap Spectacles** | Dev-only | — | Snap docs |

**Règle UX :** ne **jamais** architecturer un feature MR dépendant caméra en assumant que ça porte partout. Toujours prévoir un fallback "no camera access".

### 23. Dynamic occlusion

- **Horizon OS Depth API (Quest 3)** : real-time depth maps pour occlusion dynamique des objets virtuels par les objets réels (mains, meubles, outils). Source : [Meta passthrough occlusions](https://developers.meta.com/horizon/documentation/unity/unity-customize-passthrough-passthrough-occlusions/).
- **visionOS** : hand occlusion automatique au niveau système
- **Android XR** : scene understanding + occlusion via SceneCore

Si ton UI MR doit sit **derrière** hands/furniture/tools, Quest-class depth support améliore matériellement la crédibilité.

### 24. Anchors : world, scene, persistence

| Type | Usage | Plateforme |
|------|-------|-----------|
| **Head-locked** | Brief utility, recovery flows seulement. **Jamais** persistent. | Toutes |
| **Body-locked** | UI follows user, low latency | Toutes |
| **World anchors** | Ancré au monde physique, persiste entre sessions | visionOS + Horizon OS |
| **Scene anchors** | Créés pendant Space Setup (Horizon OS) | Horizon OS |
| **Shared world anchors** | Partage multi-user | visionOS 26+ |
| **Persistence APIs** | Content aligné aux surfaces physiques, "locked" reapparaît après restart | visionOS 26+ |
| **Cloud anchors** | Partage multi-device | Azure Spatial Anchors, Niantic Lightship |

Sources : [Meta Spatial Anchors](https://developers.meta.com/horizon/documentation/unity/unity-spatial-anchors-overview/), [visionOS what's new](https://developer.apple.com/visionos/whats-new/).

**Règle UX :** world-locked anchors pour outils persistants et objets partagés. Head-locked UI UNIQUEMENT pour brief utility / recovery flows.

---

## F. Spatial Audio

### 25. APIs par plateforme

| Plateforme | API | Fonctionnalités |
|-----------|-----|-----------------|
| **visionOS** | PHASE / RealityKit | Personalized Spatial Audio, dynamic head tracking, audio ray tracing, distance + directivity models |
| **Horizon OS** | Meta XR Audio SDK | HRTF, ambisonics, room acoustics |
| **Android XR** | SceneCore spatial audio | Spatialized cues + ambisonics |
| **Unity / Unreal** | XR Audio Spatializer / Sound Source | Cross-platform via OpenXR |

### 26. Règles UX audio

- **Audio spatial n'est plus optional polish** — c'est navigation, presence, accessibility
- Sound cones : directivity
- Distance attenuation : inverse, linear, log (choisir selon use case)
- Click sound sur pinch confirmation
- Hover sound sur gaze highlight subtil
- Audio-only navigation = tier-1 accessibility en XR

---

## G. Performance

### 27. Frame rate floors

| Plateforme | Policy | Budget |
|-----------|--------|--------|
| **Horizon OS** | Apps doivent maintenir **≥ 60 fps** ; interactive apps utilisent 72 / 80 / 90 / 96 / 100 / 120 Hz | — |
| **Android XR** | **72 fps min, 90 fps idéal** | 11 ms frame budget |
| **visionOS** | 90 / 120 Hz | — |

### 28. Frame budgets GPU (Meta profiling)

| Refresh | Budget |
|--------:|-------:|
| 72 Hz | **13.9 ms** |
| 90 Hz | **11.1 ms** |
| 120 Hz | **8.3 ms** |

Source : [Meta best practices](https://developers.meta.com/horizon/documentation/unity/ts-ovr-best-practices/).

### 29. Comfort baseline 2026

- Budget pour **90 fps** où hardware sustain
- Treat **72 fps comme floor**, jamais goal
- UI transitions **locales** aux objets / panels (pas camera motion)
- Foveated rendering (eye-tracked) où supporté : +20–30% GPU headroom
- **Ne jamais** utiliser foveated comme excuse pour unbounded shader/texture/scene complexity

---

## H. Privacy, Safety, Children

### 30. Eye data — highly sensitive

**Règle :** eye data est traité comme medical-grade sensitive. Les vendors médient :

- **visionOS** : apps **ne peuvent pas** accéder à la raw gaze data pour les system hover effects ([Apple rendering hover](https://developer.apple.com/documentation/CompositorServices/rendering_hover_effects_in_metal_immersive_apps))
- **Android XR** : raw eye-tracking data n'est **pas partagé** avec les apps ; le système expose un generic hover effect ([Android XR foundations](https://developer.android.com/design/ui/xr/guides/foundations))
- **Meta Quest Pro** : opt-in gaze data

**Design consequence :** use hover state, not raw gaze analytics, comme primary selection primitive. Regulations à venir : EU AI Act, Illinois BIPA.

### 31. Biometric authentication

- **Vision Pro Optic ID** : iris-based, encrypted, accessible only to the Secure Enclave ([Apple Support](https://support.apple.com/en-us/125436))
- Treat biometric auth comme system-owned : request it, don't reinvent it

### 32. Spatial data permissions

- **Horizon OS** : runtime permission pour spatial-data on Quest 2, Quest Pro, Quest 3 ([Meta spatial data perm](https://developers.meta.com/horizon/documentation/unity/unity-spatial-data-perm/))
- Room understanding + anchors doivent être permission-aware et defeatable

### 33. Camera permissions

- Tout feature camera-dependent nécessite un alternative path "no camera access"
- Quest 3/3S passthrough camera access : permission camera-class explicite

### 34. Child safety

| Device | Age minimum | Control |
|--------|:-----------:|---------|
| Meta Quest | **10+** avec supervision parent | Family Center : breaks, supervision controls ([Meta parent info](https://www.meta.com/quest/parent-info/)) |
| Meta Quest (compte solo) | **13+** | — |
| Apple Vision Pro | **13+** | — |

Si ton app vise < 13 ans : session duration + privacy + monétisation doivent être strictes par défaut.

---

## I. Accessibility XR

### 35. Le shortlist a11y cross-plateforme

Si une équipe XR n'a le temps que pour quelques moves a11y, la shortlist stable cross-plateforme est :

- **One-handed alternative** à tout two-handed gesture
- **Seated mode** (standing / seated / reclined)
- **Snap turn + teleport** comme defaults (jamais smooth-only)
- **Reduced motion support** (Apple HIG : [Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility))
- **Live captions** pour tout audio
- **Larger targets mode** (doublée de la taille normale)
- **Tracking-confidence fallback visible** (que faire quand hand tracking drop ? controller fallback avec feedback)

Ces features aident les users avec disabilities **mais aussi** rescue les users mainstream en noisy rooms, shared offices, unfamiliar hardware, fatigue-heavy sessions.

### 36. Visual accessibility

- Low vision : zoom, high contrast mode, large text
- Color blindness : filters, redundant cues (pas color-only)
- Photosensitive epilepsy : flash warnings, reduced motion mandatory

### 37. Motor accessibility

- Dwell click configurable (pour users qui ne peuvent pas pinch)
- Switch Control alternatif
- Head tracking alternatif à hand tracking

---

## J. Frameworks & Standards

### 38. OpenXR 1.1 — standard cross-plateforme qui monte

- Released 2024 ([Khronos announcement](https://www.khronos.org/news/press/khronos-releases-openxr-1.1-to-further-streamline-cross-platform-xr-development))
- Widely used extensions moved into core
- **Android XR Unity path** explicitement built on OpenXR
- **PICO** announced OpenXR 1.1 runtime compliance
- **visionOS** = outlier : official path = native platform frameworks (SwiftUI + RealityKit + ARKit), pas OpenXR-first

### 39. visionOS stack (Apple)

```
SwiftUI + RealityKit + ARKit for visionOS
     +
Reality Composer Pro (Xcode integration)
     +
USDZ format assets
     +
Shader Graph / MaterialX
     +
ImmersiveSpace scene type
     +
TabletopKit (jeux multijoueur locaux)
     +
Object Capture (scan 3D depuis iPhone)
```

Tutoriel : [Develop in Swift: Welcome to Spatial Computing](https://developer.apple.com/tutorials/develop-in-swift/welcome-to-spatial-computing).

### 40. Meta XR SDK / Presence Platform

- Unity integration (Meta XR All-in-One SDK)
- Unreal integration
- Horizon OS v77 / v78 (2025)
- Hand Tracking 2.2
- Movement SDK (face, body tracking)
- Voice SDK
- Multiplayer (Photon, Colyseus)
- Passthrough API + Scene API

### 41. Android XR (Google + Samsung)

- Jetpack XR library (alpha 2024, stable 2025)
- SceneCore, SpatialKit
- Jetpack Compose spatial
- Material 3 adapté XR
- Input API (hand, eye, voice)
- Emulateur Android XR Studio

### 42. WebXR

- **WebXR Device API** — Candidate Recommendation Draft status W3C
- Immersive VR Session + Immersive AR Session
- AR Module : hit-test, anchors
- DOM Overlay pour AR Web
- Browsers : Chrome 113+, Quest Browser, Safari visionOS (partiel)
- Frameworks : Three.js + React Three XR, Babylon.js WebXR, A-Frame

### 43. Cross-platform engines

- Unity XR Plugin Management + OpenXR
- Unreal OpenXR
- Godot XR
- Khronos roadmap : fragmentation reducing via OpenXR core

---

## K. Prototypage sans hardware

**Credible en 2026 cross-stacks :**

| Plateforme | Outil | Ce que ça valide |
|-----------|-------|------------------|
| **visionOS** | visionOS Simulator dans Xcode | Window, ornament, Shared Space, SwiftUI/RealityKit structure |
| **Android XR** | XR Emulator (Android Studio) | Panel placement, Full Space transitions, glasses-vs-headset layout |
| **Horizon OS** | Meta XR Simulator | Keyboard/mouse, Xbox controller, physical Quest controller forwarding |

**Ce que les émulateurs ne valident PAS :**
- Depth comfort réel
- Occlusion précise
- Controller feel
- Hand tracking confidence
- Social acceptability
- Fatigue / visibility / audio leakage / real legibility

**Workflow recommandé :** émulateur pour geometry et flow, puis **hardware validation sur au moins 1 device par classe** (1 gaze-first headset, 1 hand/controller MR headset, 1 smart-glasses device).

---

## L. Smart Glasses — UI patterns spécifiques

### 44. Classes d'affichage

| Type | Exemples | Use case |
|------|----------|----------|
| **Birdbath** (prisms) | XREAL, VITURE | Retina display cinema-style |
| **Waveguide** (transparent) | HoloLens legacy, Magic Leap | See-through AR |
| **Laser Beam Scanning** | Halliday, North Focals | Direct retinal projection |
| **Micro-OLED / Micro-LED** | RayNeo X3 Pro, futur | Super bright outdoor |
| **No display** | Ray-Ban Meta (Gen 2) | Audio + camera + AI only |

### 45. HUD patterns — ce qui marche

- **1–2 lignes de texte max** (jamais paragraphes)
- **1 dominant action** à la fois
- **Peripheral notifications** discrètes
- **Turn-by-turn navigation** avec arrows simples
- **Live captions** (deaf accessibility killer feature)
- **Live translation** (Samsung Galaxy Glasses + Gemini, Halliday)
- **POV photography** (Ray-Ban Meta)
- **Hands-free calls** avec open-ear audio

### 46. Battery life

| Class | Target |
|-------|-------:|
| All-day wearable (no display) | **8 h+** (Ray-Ban Meta : 8 h + 48 h case) |
| Smart glasses avec display | 2–4 h |
| Halliday (invisible display) | 12 h |
| Recharge case | AirPods-style |

### 47. Social acceptability

- Style lunettes normales > style gaming
- **Indicator camera-on** obligatoire (Ray-Ban privacy red light)
- Public use etiquette : no recording sans visual indicator
- Prescription support : snap-on, build-in, contact-lens compat

### 48. On-device AI sur glasses

- **Meta AI** (Ray-Ban) : queries, translations, describe scene ("Hey Meta, what am I looking at")
- **Samsung Galaxy Glasses + Gemini** : translation live, navigation
- **Halliday** : proactive assistant, context-aware prompts
- **RayNeo X3 Pro + Gemini** : open Android-style AR

**UX consequence :** glasses UX converge avec AI wearable UX. Minimal, glanceable, outdoor-legible. **Pas** essayer de reproduire une UI headset.

### Anti-patterns glasses

- ❌ UI dense avec windows multiples
- ❌ Formulaires longs
- ❌ Reading > 1–2 lignes
- ❌ Notifications persistantes qui bloquent central vision
- ❌ Controls qui nécessitent précision > 1°

---

## M. Stratégie & Méthodologie 2026–2028

### 49. Best platform pour indie 2026

Pour small team shipping broad-consumer XR :

1. **Horizon OS (Meta Quest) = pragmatic first target**
   - Simulator story mature
   - Third-party MR / camera / scene access broad
   - Comfort / playability guidance battle-tested
   - Install base largest

2. **visionOS** = strongest pour premium productivity, spatial media, enterprise polish
   - Privacy + sensor boundaries stricter
   - Native toolchain opinionated
   - Higher MSRP → smaller audience

3. **Android XR** = strategically important (futur glasses) mais platform maturity early

**Note :** inference sur current public tooling + capability surface, pas market-share claim.

### 50. Cross-platform conventions émergentes (2026)

Les conventions durables :

- **OpenXR 1.1** pour native engine portability
- **Multimodal input** plutôt que single-input assumption
- **World-locked anchors** plutôt que head-locked
- **System-mediated eye intent** plutôt que raw eye data
- **72–90 fps comfort floors**
- **Spatial audio** as default UI feedback
- **User-adjustable locomotion comfort**
- **WebXR** reste important pour reach, mais **complément** des native runtimes, pas remplacement

### 51. Minimum FOV pour true immersion

Seuil pratique en 2026 : **~100° class horizontal/diagonal**
- ≥ 100° = full immersion (Quest 3, PS VR2, Galaxy XR, Varjo XR-4)
- 50–60° = glasses/HUD-like, pas full-scene immersion
- < 50° = HUD pure (Meta Ray-Ban Display 20°, XREAL Air 46°)

Inference basée sur product classes actuelles, pas standard formel.

### 52. visionOS vs Horizon OS — divergences majeures

| Axe | visionOS | Horizon OS |
|-----|----------|------------|
| **Eye tracking** | System-owned, app ne voit pas raw data | Raw pas exposed mais event richer |
| **Window scaling** | Dynamically preserves angular size | App-managed |
| **Default windows** | Large + distant (1280×720 pt à ~2 m) | Scene-aware |
| **Camera sensing** | Tight control, enterprise entitlement only | Passthrough Camera API ouvert (Quest 3/3S) |
| **Hand rays** | Subtil, secondaire au gaze+pinch | First-class |
| **Scene model** | Limité | Rich (Depth API, anchors) |
| **Spatial data perm** | Enterprise | Runtime permission user-facing |

**Raison :** les plateformes optimisent pour different trust + interaction models. visionOS = premium privacy-first ; Horizon OS = permissive app-building.

### 53. Smart glasses vont-elles remplacer casques d'ici 2028 ?

**Non, pas largement.** Evidence actuelle → **coexistence**, pas replacement.

- Headsets : 100°-class immersion + deep input stacks + scene-aware MR
- Glasses : 20–57° FOV + companion compute + thinner display/UI budget
- AI glasses (no display) : strong pour camera, voice, assistant workflows
- Display glasses : strong pour captions, navigation, private screens

**Résultat probable :** glasses prennent beaucoup d'everyday use cases (notifications, directions, translation, photo), headsets gardent immersive + high-complexity.

### 54. Shortlist "highest-confidence XR defaults 2026"

Si tu ne retiens qu'une seule liste :

- ✅ Primary UI central et grande
- ✅ Persistent reading content à **1–2 m** ou plus loin
- ✅ Support hands + ray + voice + external input
- ✅ Default locomotion à comfort (teleport + snap turn)
- ✅ Gaze + room data = privacy-sensitive by default
- ✅ Captions + seated mode from day one
- ✅ Smart glasses : réduction radicale de densité UI (1–2 lines, 1 dominant action)

C'est la partie que la plupart des équipes ratent encore.

---

## N. Valeurs Clés — Memo Rapide

### Angulaire + distance

| Métrique | Valeur |
|----------|--------|
| Min eye target visionOS | 60 pt |
| Min hit target Horizon OS | 22 × 22 mm / 48 dp / 3° FOV @ 0.42 m |
| Min visual target Horizon OS | 32 dp |
| Central safe zone UI | 40–60° |
| Default window visionOS | 1280 × 720 pt à ~2 m |
| Reading distance optimal | 1–2 m |
| Dead zone near | < 0.25–0.3 m |
| Dead zone far reading | > 5 m |
| Body text angular height | 1–2° |
| Reading line length | 40 ± 6.5 chars |
| Reading block height | 7.3 ± 1.7 lines |
| Block center vs horizontal | ~1° below eye level |

### FOV

| Class | FOV |
|-------|-----|
| Full immersion threshold | ~100° |
| Glasses/HUD | 20–57° |
| HUD pure | < 20° |
| Vision Pro headsets mainstream | 100–120° |

### Perf

| Metric | Valeur |
|--------|--------|
| Comfort floor | 72 fps |
| Comfort target | 90 fps |
| Premium target | 120 fps |
| Budget GPU 72 Hz | 13.9 ms |
| Budget GPU 90 Hz | 11.1 ms |
| Budget GPU 120 Hz | 8.3 ms |
| Motion-to-photon seuil | < 20 ms |

### Contraste

| Context | Ratio |
|---------|------:|
| WCAG 2D minimum (trop bas pour XR) | 4.5:1 |
| XR comfort floor recommandé | **7:1 (AAA)** |
| VR text reading study preferred | **8.7:1 – 11.9:1** |

### Hand tracking

| Metric | Valeur |
|--------|--------|
| Rate Meta | 60 Hz |
| Rate Vision Pro | 90 Hz |
| Pinch threshold | ~20 mm |
| Precision fine | 3–5 mm |

### Text entry (WPM)

| Méthode | WPM |
|---------|----:|
| Physical keyboard | 50–70 |
| Dictation | 30–50 |
| Controller virtual keyboard | 15.3 |
| Hand tracking air-type | 13.8 |

### Locomotion

| Mode | Défaut ? |
|------|:--------:|
| Teleport | ✅ |
| Snap turn (30/45/90°) | ✅ |
| Smooth locomotion | opt-in |
| Smooth turn | opt-in |
| Room-scale (Guardian) | disponible |

### Child safety

| Device | Age min |
|--------|:-------:|
| Meta Quest supervisé | 10+ |
| Meta Quest solo | 13+ |
| Apple Vision Pro | 13+ |

---

## Cross-references dans bible-ux

- [MOBILE.md § CJ](MOBILE.md) — visionOS mobile-dev quick reference (Apple-only focus, complémentaire à cette bible XR cross-plateforme)
- [WEARABLE.md § BX](WEARABLE.md) — AI assistants 2025 (Ray-Ban Meta brièvement mentionné, détails complets ici § L)
- [VALUES.md](../VALUES.md) — les valeurs canoniques générales (touch, spacing, contrast, timings) continuent de s'appliquer là où elles ne sont pas explicitement surchargées ici
- [DESIGN_TREE.md](../DESIGN_TREE.md) — index + arbre de décision

---

## Sources

### Apple / visionOS
- [Apple Vision Pro Specs](https://www.apple.com/apple-vision-pro/specs/)
- [Vision Pro M5 Support](https://support.apple.com/en-us/125436)
- [visionOS HIG Windows](https://developer.apple.com/design/human-interface-guidelines/windows)
- [visionOS HIG Buttons](https://developer.apple.com/design/human-interface-guidelines/buttons)
- [visionOS HIG Eyes](https://developer.apple.com/design/human-interface-guidelines/eyes)
- [visionOS HIG Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)
- [Rendering Hover Effects in Metal Immersive Apps](https://developer.apple.com/documentation/CompositorServices/rendering_hover_effects_in_metal_immersive_apps)
- [visionOS What's New](https://developer.apple.com/visionos/whats-new/)
- [Develop in Swift: Welcome to Spatial Computing](https://developer.apple.com/tutorials/develop-in-swift/welcome-to-spatial-computing)
- [WWDC 2023 Session 10073 — Principles of Spatial Design](https://developer.apple.com/videos/play/wwdc2023/10073/)

### Meta / Horizon OS
- [Meta Quest 3](https://www.meta.com/quest/quest-3/)
- [Meta Quest 3S](https://www.meta.com/quest/quest-3s/)
- [Ray-Ban Meta Gen 2](https://www.meta.com/ai-glasses/ray-ban-meta-wayfarer-gen-2/)
- [Meta Ray-Ban Display Glasses](https://www.meta.com/ai-glasses/meta-ray-ban-display-glasses-and-neural-band/)
- [Horizon MR Design Guideline](https://developers.meta.com/horizon/design/mr-design-guideline/)
- [Horizon Comfort](https://developers.meta.com/horizon/design/comfort/)
- [Horizon Locomotion User Preferences](https://developers.meta.com/horizon/design/locomotion-user-preferences/)
- [Meta XR Hand Tracking Overview](https://developers.meta.com/horizon/documentation/unity/unity-handtracking-overview/)
- [Meta Spatial Anchors](https://developers.meta.com/horizon/documentation/unity/unity-spatial-anchors-overview/)
- [Meta Passthrough Occlusions](https://developers.meta.com/horizon/documentation/unity/unity-customize-passthrough-passthrough-occlusions/)
- [Meta Spatial SDK PCA](https://developers.meta.com/horizon/documentation/spatial-sdk/spatial-sdk-pca-overview/)
- [Meta Spatial Data Permission](https://developers.meta.com/horizon/documentation/unity/unity-spatial-data-perm/)
- [Meta OVR Best Practices](https://developers.meta.com/horizon/documentation/unity/ts-ovr-best-practices/)
- [Meta Parent Info](https://www.meta.com/quest/parent-info/)

### Google / Android XR
- [Android XR Spatial UI](https://developer.android.com/design/ui/xr/guides/spatial-ui)
- [Android XR Foundations](https://developer.android.com/design/ui/xr/guides/foundations)
- [Android XR Considerations](https://developer.android.com/design/ui/xr/guides/considerations)

### Samsung / Sony / others
- [Samsung Galaxy XR](https://www.samsung.com/us/xr/galaxy-xr/galaxy-xr/)
- [PlayStation VR2 Specs](https://www.playstation.com/en-tr/ps-vr2/ps-vr2-tech-specs/)
- [PICO 4](https://www.picoxr.com/global/products/pico4/specs)
- [HTC Vive Focus Vision](https://www.vive.com/us/product/vive-focus-vision/specs/)
- [Varjo XR-4](https://varjo.com/products/xr-4)
- [Bigscreen Beyond 2](https://store.bigscreenvr.com/products/bigscreen-beyond-2)
- [Shiftall MeganeX superlight 8K](https://en.shiftall.net/products/meganex8k)

### Smart Glasses vendors
- [XREAL Air 2](https://www.xreal.com/air2)
- [XREAL One / One Pro compare](https://www.xreal.com/glasses/compare)
- [XREAL Beam](https://uk.shop.xreal.com/products/xreal-beam)
- [VITURE Luma Pro](https://www.viture.com/product/viture-luma-pro-xr-glasses)
- [Rokid Max 2](https://au.rokid.com/products/rokid-max-2-ar-glasses)
- [RayNeo X3 Pro](https://eu.rayneo.com/products/x3-pro-ai-display-glasses)
- [Halliday](https://hallidayglobal.com/)
- [Snap Spectacles 5 (SnapOS)](https://newsroom.snap.com/sps-2024-spectacles-snapos)

### Standards / Research
- [Khronos OpenXR 1.1 Release](https://www.khronos.org/news/press/khronos-releases-openxr-1.1-to-further-streamline-cross-platform-xr-development)
- [Cambridge — Resolution Limit of Human Eye (2025)](https://www.cam.ac.uk/research/news/is-your-ultra-hd-tv-worth-it-scientists-measure-the-resolution-limit-of-the-human-eye)
- [CHI 2018 VR Reading (Dingler et al.)](https://kaikunze.de/papers/pdf/dingler2018vr.pdf)
- [VR Text Reading Study (arXiv 2004.01545)](https://arxiv.org/pdf/2004.01545)
- [XR Text-Entry Synthesis (arXiv 2604.03520)](https://arxiv.org/html/2604.03520v1)

---

**Version :** 1.0 baseline (2026-04-17).
**Next expansion :** deeper SwiftUI/RealityKit code examples, deeper Meta XR SDK patterns, Android XR Jetpack Compose examples, WebXR Three.js starters, specific patterns pour Garmin / Magic Leap enterprise, neural interfaces (Meta EMG Wristband 2025), haptic suits.
