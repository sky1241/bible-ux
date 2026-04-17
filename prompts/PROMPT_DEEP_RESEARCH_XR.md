# DEEP RESEARCH PROMPT - UX XR / SPATIAL COMPUTING / SMART GLASSES (~150 pages cible)

## CONTEXTE
Je construis une base de connaissances UX/UI EXHAUSTIVE pour applications **XR** (Extended Reality) : casques VR/AR/MR et lunettes connectees.

J'ai deja une base solide sur Web + iOS/Android + Wear OS/watchOS (~46 000 lignes, bibles WEB.md + MOBILE.md + WEARABLE.md + ICONS.md + DESIGN_TREE.md).

Il me manque le volet **XR** : TOUTES les regles specifiques aux casques (Vision Pro, Meta Quest 3/3S/Pro, Samsung Galaxy XR, Pico, HTC Vive, Valve Index) ET aux lunettes connectees legeres (Ray-Ban Meta, Xreal, Viture, Snap Spectacles, Samsung Galaxy Glasses, Halliday). L'objectif est de pouvoir designer des experiences spatiales professionnelles, ergonomiques, accessibles, sur tous les OS XR actuels et emergents en 2025-2026.

## CE QUE JE RECHERCHE
Des **valeurs numeriques concretes** et **patterns specifiques** pour TOUTES les plateformes XR :

- Touch targets dans l'espace 3D (angle solide, taille angulaire en degres)
- Distance de confort pour les UI (arm's length, focal, fatigue)
- FOV utilisable (safe zone pour UI dans un FOV 110 degres)
- Ergonomie : poids, centre de masse, duree de session max avant fatigue
- Eye tracking + hand tracking + voice : quand utiliser quoi
- Passthrough design (VST color accuracy, latency, occlusion)
- Motion sickness : regles pour eviter la nausee (Comfort rating systems)
- Persistence spatiale (anchors, world-locked vs body-locked vs head-locked)
- Audio spatial (HRTF, sound cones, spatial audio APIs)
- Privacy : gaze data, room mapping, camera access
- Performance : foveated rendering, target fps, thermal
- Accessibility : teletransport, snap turning, handedness, seated vs standing
- Multi-user XR : avatars, presence, shared spaces
- Text input en XR (virtual keyboard, voice, laser pointer)
- Smart glasses specific : display types, battery, heads-up UI
- Cross-platform XR : OpenXR, WebXR, Unity/Unreal portability

Pour CHAQUE regle :
- Valeurs exactes (degres, cm, ms, Hz, fps, mW, g, mAh)
- Differences entre visionOS / Meta Horizon OS / Android XR / WebXR / lunettes
- Samsung Galaxy XR (Infinite) vs Apple Vision Pro vs Meta Quest 3 quand different
- Exemples d'apps reelles avec descriptions (Vision Pro apps, Quest apps, Ray-Ban Meta features)
- Sources officielles 2023-2026 (guidelines, etudes ergonomiques, papers HCI)
- Anti-patterns : ce qu'il ne faut JAMAIS faire (motion sickness, eye strain, bras fatigues)

---

## PARTIE 1 : FONDAMENTAUX HARDWARE XR (15-20 pages)

### 1.1 Catalogue des Casques XR (2023-2026)

Pour chaque modele ci-dessous, donner : annee de sortie, prix MSRP, poids (g), FOV horizontal/vertical (degres), resolution par oeil (pixels), PPI ou PPD (pixels par degre), type de display (micro-OLED, LCD, micro-LED), frequence de rafraichissement (Hz), autonomie (h), type d'input (controllers, hand tracking, eye tracking, face tracking), IPD adjustable, lentilles (pancake, Fresnel, aspherical), passthrough type (color VST, mono VST, optical), SoC/chipset, RAM, stockage :

- **Apple Vision Pro** (2024) et **Vision Pro M5** (2025)
- **Apple Vision Pro Air / Vision 2** (rumored 2026)
- **Meta Quest 3** (2023), **Meta Quest 3S** (2024), **Meta Quest Pro** (2022, EOL 2024)
- **Meta Quest 4 / Ventura** (rumored 2025-2026)
- **Samsung Galaxy XR / Infinite** (2025, Android XR)
- **Pico 4**, **Pico 4 Ultra** (2024)
- **HTC Vive Focus Vision** (2024), **Vive XR Elite**
- **Valve Index** (2019, legacy reference)
- **Valve Deckard** (rumored 2025)
- **Bigscreen Beyond 2** (2025, ultra-light)
- **Varjo XR-4** (enterprise)
- **Lynx R-1**
- **PlayStation VR2** (2023)
- **Shiftall MeganeX** / **MeganeX superlight** (2024-2025)

### 1.2 Catalogue des Smart Glasses (2023-2026)

Meme tableau pour les lunettes legeres :

- **Ray-Ban Meta (Gen 2)** (2023), **Ray-Ban Meta (Gen 3)** (2025)
- **Meta Orion** (prototype 2024, preview tech)
- **Xreal Air 2 / Air 2 Pro / Air 2 Ultra** (2024), **Xreal One / One Pro** (2024-2025)
- **Xreal Beam / Beam Pro** (accessoires spatiaux)
- **Viture One / Pro / Lite** (2024-2025)
- **Rokid Max / AR Studio**
- **TCL RayNeo X3 Pro** (2025)
- **Snap Spectacles 5** (2024, dev kit)
- **Samsung Galaxy Glasses** (rumored 2025-2026, Android XR)
- **Halliday Smart Glasses** (2025, proactive AI)
- **Apple Smart Glasses** (rumored 2027-2028)

Pour chaque : poids (g), autonomie, type d'affichage (birdbath, waveguide, laser beam scanning, micro-OLED, micro-LED), brightness (nits), FOV (etroit, typique 45-57 degres), on-device AI (oui/non, quel SoC), camera, audio (speakers bone conduction, directional, earbuds integres), microphones, prescription-ready, style design (lunettes normales, lunettes de soleil, gaming, pro).

### 1.3 Specifications d'Affichage

- Resolution par oeil recommandee minimum pour du texte lisible
- PPD (pixels par degre) : seuil de "retina" pour XR (60 PPD est souvent cite)
- Frequence : 60Hz (mobile), 72/80/90Hz (Quest), 90/100/120Hz (Vision Pro), 120Hz+ (PCVR), impact sur motion sickness
- Latence motion-to-photon (M2P) : seuil confort (< 20ms obligatoire)
- Contrast ratio : LCD vs micro-OLED vs micro-LED
- Brightness : nits requises (200 indoors, 500+ outdoors pour AR)
- HDR en XR : support actuel (visionOS Dolby Vision, Quest HDR10)
- Color gamut : sRGB, P3, Rec.2020 — quel standard vise

### 1.4 Ergonomie Physique

- Poids optimal d'un casque : seuil confort 1 heure vs 8 heures
- Distribution du poids : front-heavy vs balanced (tether battery comme Vision Pro)
- Sangle : Y-strap, halo band, elite strap — impact sur la distribution
- Face cushion / light seal : FOM vs FOM Flex vs Foam — hygiene et confort
- IPD (inter-pupillary distance) : plage supportee (58-72mm typique), step continu vs discret
- Diopter adjustment : in-display vs lentilles amovibles (ZEISS Optical Inserts Vision Pro)
- Taille de tete : child safety, casques pour < 13 ans (interdits sur Quest < 10, Vision Pro < 13)
- Distance inter-sangle : reglable ou fixe

---

## PARTIE 2 : DESIGN SYSTEM SPATIAL (15-20 pages)

### 2.1 Unites Spatiales

- **Meter (m)** : unite principale en XR (visionOS, Meta XR SDK, OpenXR)
- **Point (pt)** vs **Pixel (px)** vs **Meter** : conversion en visionOS (1pt ≈ 1.14mm a 1m)
- Taille angulaire : degres d'arc pour un element (cible tactile = X degres)
- Depth cues : perspective, occlusion, shadows, stereopsis, motion parallax
- Scale factor : les UI en XR sont souvent a 1m de distance, ajuster selon context

### 2.2 Touch Targets Spatiaux (visionOS, Meta, Android XR)

- Taille angulaire minimum d'une cible en degres (Apple recommande 60x60pt a 1m = ~1.4 degres, Meta recommande 0.5-1 degre selon input)
- Direct touch (pinch a bout de bras) vs indirect touch (gaze + pinch) — seuils differents
- Taille pour hand tracking direct (doigt pose dessus) vs pour ray (laser pointeur)
- Espacement minimum entre cibles : 2 degres recommande (eviter les mis-taps)
- Hit target vs visual target : hit target peut depasser la forme visuelle
- Cibles a distance (> 2m) : scaling automatique ou taille fixe ?

### 2.3 Distance de Contenu

- **Arm's length** : 0.5-0.7m (comfort pour manipulation directe)
- **Workspace** : 1-2m (lecture, UI secondaire)
- **Immersive** : 2-10m (cinema, paysages, environnements)
- **Far** : > 10m (skybox, horizon, elements decoratifs)
- Convergence-accommodation conflict : sweet spot 1-2m
- Zone morte : < 0.25m (trop proche, yeux croises) et > 10m pour UI interactive

### 2.4 FOV Safe Zone pour UI

- FOV total disponible vs FOV confort pour UI
- Central FOV (15-30 degres) : zone de lecture principale
- Peripheral FOV : icones secondaires, notifications
- "Dead zone" peripherique : ou l'UI est coupee selon le casque
- Taille d'une fenetre visionOS par defaut vs max
- Pourcentage de l'ecran recommande pour contenu essentiel

### 2.5 Depth Layering & Z-Axis

- Nombre de couches de profondeur maximum avant confusion (3-5 max)
- Separation minimum entre couches pour distinguer depth (visionOS : 0.01m suffit avec shadow)
- Shadow length selon depth (visionOS system shadows)
- Blur background selon depth (depth of field in XR UI)
- Floating elements : combien en meme temps

### 2.6 Color & Contrast en XR

- Luminance percue : impact de la transparence passthrough
- Contrast ratio WCAG en XR : 4.5:1 est-il suffisant ? Apple recommande plus eleve
- Couleurs interdites en AR (confusion avec le monde reel)
- Transparence & glass materials : visionOS Liquid Glass adapte, Meta Horizon glass UI
- Dark mode en XR : pourquoi c'est different (l'obscurite = plus confortable en VR immersif)

### 2.7 Typography en XR

- Taille de texte minimum lisible en degres angulaires (typiquement 0.4-0.5 degre pour body)
- Polices system : SF Pro (visionOS), Meta Sans (Horizon), Google Sans (Android XR)
- Line-height en XR (plus genereux, 1.5-1.7)
- Line length maximum (45-60 caracteres, plus court qu'en 2D)
- Reading distance : 1m standard, adapter si plus proche/loin
- Text rendering : SDF (Signed Distance Field) vs bitmap pour la nettete a toute distance

### 2.8 Iconography Spatiale

- SF Symbols sur visionOS : rendering automatique avec depth
- Iconographie Meta Horizon
- Taille minimum pour icon button (pt angulaires)
- Filled vs outlined en XR (lisibilite passthrough)
- Icon alignment : centered ou off-center pour optical balance

### 2.9 Motion & Animation

- Duree standard : 250-350ms comme mobile, mais attention a la persistence visuelle
- Easing : spring-based recommande sur visionOS (Liquid Glass)
- Mouvement de camera : a EVITER (induction motion sickness)
- Mouvement d'elements UI : OK si local
- Frame rate requirement : 90fps min sur Quest, 120fps sur Vision Pro
- Reduced motion setting : comment le respecter en XR

---

## PARTIE 3 : INPUT METHODS (20-25 pages)

### 3.1 Hand Tracking

- Taux de rafraichissement du hand tracking par plateforme (Meta 60Hz, Vision Pro 90Hz)
- Latence end-to-end hand tracking
- Pinch gesture : distance pouce-index seuil (typiquement 20mm)
- Gestures systeme reserves (palm up = Home sur Vision Pro, tap wrist = menu sur Quest)
- Hand mesh vs skeleton tracking
- Occlusion : que faire quand la main est cachee
- Deux mains simultanees : interactions bimanuelles
- Precision : seuil de precision pour selection fine (3-5mm)
- Fatigue du bras (gorilla arm syndrome) : regles d'ergonomie
- Hover feedback : highlight, scale, color change
- Custom gestures : quand utiliser, comment les enseigner

### 3.2 Eye Tracking (Vision Pro, Quest Pro, Pico)

- Precision : 1-2 degres typique
- Calibration : requise au premier lancement, periode de re-calibration
- Gaze-based selection : dwell time (typiquement 500-1000ms) vs gaze + pinch (visionOS)
- Smooth pursuit vs saccades : seuil detection
- Midas touch problem : comment l'eviter
- Foveated rendering : indicator pour le dev que ca fonctionne
- Privacy : les donnees gaze sont-elles accessibles a l'app ? (Vision Pro : NON, seul "is hovered" est expose)
- Attention tracking : les apps peuvent-elles savoir si l'utilisateur regarde ailleurs
- Eye tracking pour avatars : lip sync + eye sync

### 3.3 Voice Input

- Wake word : custom ("Hey Siri", "Hey Meta") vs always-on vs push-to-talk
- Latence recommandee : < 1s pour quick commands
- Ambient noise handling : beamforming microphones
- Offline vs cloud : apps offline sur Vision Pro vs Meta AI cloud
- Voice privacy : indicator visual (micro actif), quand il apparait
- Voice typing : vitesse WPM moyenne en XR (50-80 wpm atteignable)
- Code-mixing : voice in English + language switch

### 3.4 Controllers (Meta Touch Plus, PSVR2 Sense, Index Knuckles)

- Boutons conventionnels : A/B/X/Y + grip + trigger + stick + menu
- Haptics : amplitude, duree, pattern (Meta Touch Plus TruTouch)
- Tracking : inside-out (Quest), outside-in (Index, PSVR2 avec PS5 camera)
- Battery : AA vs rechargeable, duree
- Finger tracking sur controllers (Index Knuckles capacitance, Touch Plus touch zones)
- Quand utiliser controllers vs hands (precision, gaming, arm fatigue)

### 3.5 Gaze + Pinch (visionOS paradigm)

- Pattern standard Apple : regarder une cible, pincer les doigts
- Latence : < 50ms entre intention et retour visuel
- Feedback : gaze highlight subtle, pinch confirmation explicit
- Scrolling : gaze + pinch + drag, avec inertie
- Drag & drop : pinch + move + release
- Comparaison avec Quest : direct touch ou ray-based

### 3.6 Ray Casting / Laser Pointer

- Longueur de la ray : infinite vs limited
- Couleur : convention (blanc/bleu par defaut, change si target valide)
- Curve : straight line vs curved arc (teleportation)
- Hand-anchored vs controller-anchored
- Stability : filtering pour reduire le tremblement (one-euro filter)
- Indicator en bout de ray : dot, cursor, icon

### 3.7 Body Tracking

- Upper body tracking (Meta Quest body tracking via cameras)
- Full body : Vive trackers, Meta Movement SDK
- Inverse kinematics (IK) : estimation du corps a partir des 3 points (tete + 2 mains)
- Lower body estimation : quand c'est acceptable
- Privacy : body pose data

### 3.8 Face Tracking

- Face tracking sur Vision Pro (Persona) et Quest Pro (Codec Avatars Mark I)
- Expressions capturees : smile, frown, eyebrows, lip curl
- Calibration Persona visionOS : scan du visage, process
- Bandwidth : face tracking en multi-user coute X kbps

### 3.9 Brain-Computer Interface (BCI) — Emerging

- Meta Neural Wristband (EMG) : etat 2025, precision, use cases
- Apple AirPods + Vision Pro "Head shake/nod" pour declencher actions
- Snap Spectacles + hand gesture on-device
- Subvocalization research (sub-audible speech)

### 3.10 Combining Inputs

- Multimodal : gaze + voice + hand
- Conflict resolution : quel input gagne
- Accessibility : switch control, head tracking alternatif

---

## PARTIE 4 : UI PATTERNS SPATIAUX (15-20 pages)

### 4.1 Windows, Volumes, Spaces (visionOS nomenclature)

- **Window** : 2D plan flottant (SwiftUI standard), WindowGroup
- **Volume** : boite 3D limitee contenant des objets RealityKit
- **Full Space** : app occupe tout l'environnement, monde reel masque ou mixe
- **Shared Space** (default) : multiples apps cohabitent
- Passage entre les modes : progressive immersion

### 4.2 Window Management

- Dimensions par defaut : visionOS standard window size (1280x720 points)
- Resize handles : position, taille, feedback
- Move (drag) : grabber position, hover behavior
- Z-reorder : front-most, automatic
- Minimize/close : buttons position, gestures
- Multi-window : combien simultanement (visionOS limite a quelques dizaines)

### 4.3 Tabs & Navigation en Fenetre Spatiale

- Tab bar visionOS : bottom vs sidebar
- Ornaments : UI flottant hors de la fenetre (visionOS pattern), positionnement
- Toolbar : top vs floating
- Breadcrumbs en 3D : comment ils s'affichent
- Back navigation : gesture universel ?

### 4.4 Menus & Pickers

- Context menu : hover + pinch tenu
- Spatial menu : radial vs linear
- Picker (wheel, segmented) : adaptation 3D
- Date picker : rotation wheel comme watchOS
- Color picker : 3D color sphere

### 4.5 Alerts, Dialogs, Sheets

- Modal : centered window, darkens background
- Sheet : slides from bottom of window
- Full-screen alert : rare, seulement pour erreurs critiques
- Confirmation for destructive actions : double-pinch ou texte typing ?

### 4.6 Lists & Tables

- List item height : angular size recommande
- Selection : hover + pinch
- Swipe actions : adapter au gaze + pinch + drag
- Infinite scroll vs pagination
- Checkboxes/radios : taille en XR

### 4.7 Forms & Text Input

- Virtual keyboard : position (persistent, appears on focus)
- Dictation : toujours disponible en option
- Typing speed : controller (WPM), laser peck (WPM), hand tracking air type (WPM)
- Gaze typing : QuickType sur Vision Pro
- Autofill : pattern identique a iOS

### 4.8 Notifications

- Appear in shared space : floating near user's peripheral
- Duration : 3-5s typical
- Haptic : si possible (controller)
- Sound : spatial audio positionnel
- Groupement multi-notifs

### 4.9 Loading States

- Skeleton en 3D : extrusion, ombres
- Spinners 3D : rotation multi-axes
- Progress indicators : bar, circular, %
- Timeout : que faire si ca prend > 10s

### 4.10 Spatial Video & Photos

- Affichage d'une video spatiale (visionOS Spatial Video, Quest 3)
- Resolution recommandee (2x Apple ProRes 4K per eye)
- Framing : cinema mode vs lifelike
- Video controls en XR : ou les placer

### 4.11 Scenes & Environments

- Environment (visionOS) : skybox + ambient lighting
- Custom environment creation (Reality Composer Pro)
- Intensity slider : passthrough → full immersion
- Sunset/forest/beach : environments built-in

---

## PARTIE 5 : PASSTHROUGH & MIXED REALITY (10-12 pages)

### 5.1 Passthrough Types

- **Video Pass-Through (VST)** : Vision Pro, Quest 3, Samsung Galaxy XR
- **Optical See-Through (OST)** : HoloLens legacy, Magic Leap 2, smart glasses
- **Hybrid** : fallback automatique
- Color fidelity VST : delta E, uniform color
- Latency VST : < 12ms sur Vision Pro, < 20ms Quest 3
- Resolution VST : decalage avec eye resolution
- Focal plane VST : fixed focus, accommodation issues

### 5.2 Occlusion

- Real-world objects occluding virtual : requis pour MR credible
- Hand occlusion : masquer les UI derriere les mains
- Room scan : one-time ou continuous
- Scene understanding : planes (floor, wall, ceiling), meshes
- Anchors : world-locked content persistence

### 5.3 Lighting Estimation

- Environment light probe : couleur ambiante detectee
- Directional light : position du soleil estimee
- Adapt virtual materials : matching du monde
- Contact shadows : sous les objets poses

### 5.4 MR vs VR Mode Switching

- Smooth transition passthrough → immersive
- Digital Crown visionOS : bezel de control
- Intensite slider Quest 3
- Haptic ou audio feedback du switch
- Social acceptability : quand l'utilisateur peut voir les autres

### 5.5 Anchoring & Persistence

- World anchors : ancre un element au monde physique
- Room anchors : persiste entre sessions
- Spatial Anchors cross-device (Azure, Niantic Lightship)
- Cloud anchors : partage multi-user

### 5.6 AR Glass vs MR Headset

- Differences UX fondamentales
- Glass limitations : FOV etroit, battery, heat
- Heads-up display (HUD) patterns pour lunettes

---

## PARTIE 6 : SPATIAL AUDIO (8-10 pages)

### 6.1 Fundamentals

- Head-Related Transfer Function (HRTF) : personnalisee vs generique
- Object-based audio (Dolby Atmos in XR)
- Binaural rendering
- Ambisonics (ordre 1, 2, 3)

### 6.2 APIs

- visionOS PHASE (spatial audio engine)
- Meta Audio SDK, Meta XR Audio
- Android XR AudioSpaces
- Unity Audio Spatializer, Unreal Sound Source

### 6.3 Positional Audio

- Sound cones : directivity
- Distance attenuation : inverse, linear, logarithmique
- Doppler effect
- Reverb zones (reflective surfaces)

### 6.4 UI Sound Design

- Click sound : pinch confirmation
- Hover sound : gaze highlight
- Navigation sounds : directional cues
- Accessibility : audio-only navigation

### 6.5 Audio Passthrough

- Transparency mode (AirPods Pro + Vision Pro)
- Ambient awareness vs immersion
- Voice isolation en calls

---

## PARTIE 7 : MOTION SICKNESS & COMFORT (10-12 pages)

### 7.1 Fondamentaux

- Vestibular conflict : cause principale
- Vection : sensation de mouvement sans mouvement reel
- Tunnel vision comfort option
- Oculus Comfort rating : Comfortable / Moderate / Intense

### 7.2 Locomotion Techniques

- **Teleportation** : pointeur arc, instantane
- **Smooth locomotion** : joystick, continu, risque nausee
- **Dash** : tres rapide, reduce vection
- **Vignette dynamique** : reduire FOV pendant mouvement
- **Snap turning** : rotation discrete (30-45 degres)
- **Room-scale** : marcher physiquement (safe zone Guardian/Chaperone)

### 7.3 Comfort Settings

- Toggle vignette
- Snap turn angle configurable
- Movement speed
- Forward vs head-direction
- Seated vs standing mode

### 7.4 Acceleration

- Jamais d'acceleration arbitraire imposee
- Constant velocity preferable
- Vehicle-mode : cockpit reference visible = moins de nausee
- Deceleration : < 2m/s2

### 7.5 Camera Control

- First-person : OK
- Third-person : attention
- Cinematic camera control : eviter, sauf cutscene
- Fixed camera : preferable pour certains jeux

### 7.6 Session Duration

- First-time user : 10-15 min max
- Intermediate : 30 min
- Experienced : 1-2h avec pauses
- Fatigue eye strain : 20-20-20 rule (regarder loin toutes les 20 min)

### 7.7 Contenu Stationnaire vs Mobile

- Stationary XP : bureau, lecture, film = confort maxi
- Mobile XP : jeu, sport = risque nausee eleve

---

## PARTIE 8 : PERFORMANCE & TECHNIQUE (10-12 pages)

### 8.1 Frame Rate

- 90Hz minimum Quest, 120Hz Vision Pro
- 72Hz = threshold confort sur devices moins puissants
- Dropped frames : comment les detecter, feedback utilisateur
- Adaptive fps (ASW, ATW)

### 8.2 Foveated Rendering

- Fixed foveated rendering (FFR)
- Dynamic foveated rendering (eye tracked)
- Impact performance : +20-30% GPU headroom
- Artifact potentiel : sparkling peripheral

### 8.3 Graphics

- Polygon budget par scene
- Texture size recommandations
- LOD (Level of Detail)
- Draw calls limite
- Shader complexity

### 8.4 Thermal & Battery

- Thermal throttling : signes, comment l'eviter
- Battery : Vision Pro external pack 2h30, Quest interne 2h
- Standby mode : quand l'app est en arriere-plan

### 8.5 Memory

- RAM disponible par app
- Texture streaming
- Asset loading : progressive

### 8.6 Networking

- Latency requirements pour multi-user
- Bandwidth : avatars, voice, tracking data
- Edge compute vs cloud

---

## PARTIE 9 : PRIVACY & SECURITY (8-10 pages)

### 9.1 Camera Access

- Vision Pro : aucune camera API pour les apps tierces
- Quest 3 : Passthrough API (2024+) avec consent
- Android XR : permissions model
- Snap Spectacles : dev-only

### 9.2 Eye Tracking Data

- Gaze data : tres sensible (medical, deception detection)
- visionOS : jamais expose a l'app
- Meta Quest Pro : opt-in
- Regulations a venir (EU AI Act, Illinois BIPA)

### 9.3 Room Mapping Data

- Scene understanding data : ownership
- Meta World Model, ARKit Room Plan
- Peut-on exporter la carte de sa maison ?

### 9.4 Biometrics

- Iris scan pour unlock (Vision Pro Optic ID)
- FaceID adapter en XR

### 9.5 Voice Data

- Wake word processing on-device vs cloud
- Conversation logging (Meta AI, Apple Intelligence)

### 9.6 Avatar Data

- Persona scan : stocke ou ?
- Replay attacks : empecher usurpation

### 9.7 Children Safety

- Vision Pro : 13+ minimum
- Quest : 10+ avec supervision parent
- Parental controls
- COPPA compliance

---

## PARTIE 10 : ACCESSIBILITY XR (10-12 pages)

### 10.1 Motor Accessibility

- One-handed mode
- Seated experiences
- Input remapping
- Voice alternatives
- Dwell click configurable

### 10.2 Visual Accessibility

- Low vision : zoom, contrast, large text
- Blind users : audio-based XR possible ?
- Color blindness : filters, redundant cues
- Photosensitive epilepsy : flash warnings

### 10.3 Hearing Accessibility

- Captions (live captions Vision Pro)
- Visual notifications
- Haptic alternatives
- Spatial audio visualization

### 10.4 Cognitive Accessibility

- Reduce motion
- Simplified UI mode
- Tutorial pace adjustable
- Predictable interactions

### 10.5 Physical Accessibility

- Tall/short user accommodations
- Wheelchair seated mode
- Tremor : input filtering

### 10.6 Platform APIs

- visionOS accessibility APIs
- Meta Quest Accessibility Framework
- Android XR TalkBack adapte
- OpenXR accessibility extensions

---

## PARTIE 11 : DEVELOPMENT FRAMEWORKS (12-15 pages)

### 11.1 visionOS (Apple)

- SwiftUI + RealityKit + ARKit pour visionOS
- Reality Composer Pro (Xcode integration)
- Shader Graph / MaterialX
- USDZ format assets
- Reality Kit 2 : physics, animations
- Quick Look AR preview
- Shared Space vs Full Space APIs
- ImmersiveSpace scene type
- TabletopKit (jeux multijoueur locaux)
- Object Capture (scan 3D depuis iPhone)

### 11.2 Meta XR SDK / Presence Platform

- Unity integration (Meta XR All-in-One SDK)
- Unreal integration
- Horizon OS v77 / v78 (2025)
- Hand Tracking 2.2
- Movement SDK (face, body tracking)
- Voice SDK
- Multiplayer (Photon, Colyseus)
- Passthrough API + Scene API

### 11.3 Android XR (Google + Samsung)

- Jetpack XR library (alpha 2024, stable 2025)
- SceneCore, SpatialKit
- Jetpack Compose spatial
- Material 3 adapte XR
- Input API (hand, eye, voice)
- Emulateur Android XR Studio

### 11.4 WebXR

- WebXR Device API
- Immersive VR Session
- Immersive AR Session
- AR Module : hit-test, anchors
- DOM Overlay pour AR Web
- Supported browsers (Chrome 113+, Quest Browser, Safari visionOS?)
- Three.js + React Three XR
- Babylon.js WebXR
- A-Frame

### 11.5 Cross-Platform

- OpenXR 1.1 standard
- Unity XR Plugin Management
- Unreal OpenXR
- Godot XR
- Khronos standards roadmap

### 11.6 Prototyping Tools

- Adobe Aero (AR)
- Bezi (spatial Figma alternative)
- ShapesXR (collaborative prototyping in Quest)
- Gravity Sketch (3D drawing)
- Meta's Horizon Worlds editor
- Snap Lens Studio

---

## PARTIE 12 : MULTI-USER & SHARING (8-10 pages)

### 12.1 SharePlay (visionOS)

- FaceTime spatial
- Shared app experiences
- Presence indicators

### 12.2 Meta Horizon Worlds

- Avatars
- World creation
- Private rooms vs public

### 12.3 Cross-Platform Multi-User

- OpenXR multi-session
- WebXR multi-user
- Relay servers (Photon, Edgegap)

### 12.4 Avatars

- Personal avatar (Meta), Persona (visionOS)
- Codec Avatars (research Meta)
- Avatar pedagogy : uncanny valley
- Avatar accessibility (wheelchair users representation)

### 12.5 Proxemics

- Personal space respected
- Avatar collision avoidance
- Gesture in group

### 12.6 Moderation

- Report / mute / block
- Safe zone bubble
- Age-gating
- Content moderation ML

---

## PARTIE 13 : SMART GLASSES SPECIFIC (10-12 pages)

### 13.1 Display Types

- **Birdbath** (Xreal, Viture) : retina display via prisms
- **Waveguide** (HoloLens, Magic Leap) : transparent
- **Laser Beam Scanning** (Halliday, North Focals) : direct retinal projection
- **Micro-OLED / Micro-LED** : futur, super bright
- **No display** (Ray-Ban Meta) : audio + camera only

### 13.2 FOV Glasses

- Ray-Ban Meta : 0 degres (no display)
- Xreal Air 2 : 46 degres
- Meta Orion : 70 degres (prototype)
- Impact sur UI design : tres restreint

### 13.3 HUD Patterns

- Minimal UI (1-2 lines of text)
- Peripheral notifications
- Turn-by-turn navigation
- Caption live
- Translation live (Samsung Galaxy Glasses feature)

### 13.4 Battery Life

- All-day wearable : 8h+ target
- Smart glasses avec affichage : 2-4h
- Recharge case : comme AirPods

### 13.5 Prescription Support

- Snap-on inserts
- Prescription build-in
- Contact lens compatibility

### 13.6 Social Acceptability

- Glasses that look normal (Ray-Ban style)
- Indicator camera on (privacy red light Ray-Ban)
- Public use etiquette

### 13.7 On-Device AI

- Meta AI : queries, translations, describe scene
- Ray-Ban Meta : "Hey Meta, what am I looking at"
- Samsung Galaxy Glasses + Gemini
- Halliday : proactive suggestions

### 13.8 Integration Phone

- Companion app (Meta View, Xreal Nebula)
- Continuity : commencer sur lunettes, continuer sur phone
- Control via phone : touchpad, clicker

### 13.9 Use Cases Validated

- Live translation (travel)
- Navigation (running, cycling)
- POV photography
- Hands-free video calls
- Reading notifications discretely
- Accessibility (real-time captions deaf)

---

## PARTIE 14 : EMERGING & RESEARCH (6-8 pages)

### 14.1 Neural Interfaces

- Meta EMG wristband (2025)
- Apple research on brain signals
- Neuralink + XR potential
- Muse headband + XR

### 14.2 Haptic Suits

- bHaptics TactSuit
- HaptX Gloves
- Meta research : tactile rendering

### 14.3 Olfactory / Taste

- Research niche, OVR Technology
- Not near consumer

### 14.4 Volumetric Capture

- Meta Codec Avatars
- Microsoft Mesh
- Apple Persona evolution

### 14.5 Generative AI in XR

- AI-generated 3D (Meshy, Shap-E, Luma)
- AI NPC (Convai, Inworld)
- AI world generation (Meta Horizon AI creation)

### 14.6 Spatial Computing Beyond Headsets

- Spatial displays (Looking Glass, Sony Spatial Reality)
- Holograms 2D

### 14.7 Digital Twins & Enterprise

- NVIDIA Omniverse
- Unity Industrial Collection
- Autodesk VRED

---

## PARTIE 15 : ANTI-PATTERNS & RESEARCH VALIDATION (5-8 pages)

### 15.1 Anti-Patterns Critiques

- UI trop proche (< 0.5m)
- Camera motion forcee
- FOV narrow in peripheral
- Text tiny (< 0.3 degre)
- Ignoring hand occlusion
- Sound not spatialized
- No motion sickness options
- Persistent UI blocking peripheral vision
- Forcing voice when private setting
- Tracking failure without feedback
- Loading that freezes world
- No calibration for IPD / eye tracking

### 15.2 Best Practices Consolidated

- Respect personal space (virtual avatars)
- Always indicate tracking confidence
- Graceful degradation (hand tracking fails → controller fallback)
- Progressive immersion (don't full-immerse too fast)
- Physical safety (Guardian, Chaperone)
- Regular pauses prompts
- Hygiene messaging (sweat, shared device)

### 15.3 Academic Studies

- Studies on comfort in VR (Oculus Research Labs papers)
- SIGCHI and CHI papers on XR UX
- Nielsen Norman Group XR usability
- Stanford Virtual Human Interaction Lab

### 15.4 Industry Benchmarks

- Market size : XR in 2025, growth 2026
- Active users Quest, Vision Pro, Pico
- App revenue top categories
- Retention curves XR apps

### 15.5 Sources Officielles

- Apple visionOS HIG
- Meta Presence Platform docs
- Google Android XR docs
- Microsoft Mixed Reality design
- OpenXR specification
- WebXR specification
- Khronos standards
- Unity XR best practices
- Unreal XR documentation

### 15.6 Research Labs & Benchmarks

- Meta Reality Labs Research (blog, papers)
- Apple Machine Learning Research
- Samsung Research
- Google ATAP
- Stanford HCI

---

## FORMAT DES RESULTATS ATTENDUS

Pour chaque regle / pattern trouve :

```markdown
### [Titre du pattern]

| Plateforme | Valeur | Notes |
|-----------|--------|-------|
| Vision Pro | X | detail |
| Meta Quest 3 | Y | detail |
| Android XR | Z | detail |
| WebXR | W | detail |

**Exemples d'apps :** App1 (Vision Pro), App2 (Quest), App3 (WebXR)

**Source :** [link](url)

**Anti-pattern :** [description]

**Checklist :**
- [ ] Point verifiable 1
- [ ] Point verifiable 2
```

## TON DE LA RECHERCHE

- Neutre, factuel, verifiable
- Citer les sources a CHAQUE assertion
- Preferer les valeurs officielles (Apple HIG, Meta docs) aux tutoriels tiers
- Si une valeur varie selon version, indiquer (visionOS 2.0 vs 3.0)
- Distinguer "officiel" vs "recommande communaute" vs "etude academique"
- Mettre en evidence les valeurs qui vont changer rapidement (hardware evolue vite)

## CIBLE FINAL

~150 pages markdown, ~12 000-15 000 lignes si integree dans un fichier XR.md de bible-ux. Plus exhaustif que visionOS HIG + Meta docs reunis, avec cross-references et valeurs concretes exploitables par un dev indie.

## PERIODE DE RECHERCHE

Focus 2023-2026. Integrer :
- WWDC 2023, 2024, 2025 (Vision Pro annonce, visionOS evolution)
- Meta Connect 2023, 2024, 2025 (Quest 3, Orion reveal, Horizon OS evolution)
- Google I/O 2024, 2025 (Android XR reveal, Samsung partnership)
- Samsung Unpacked 2025 (Galaxy XR launch)
- CES 2024, 2025, 2026
- CHI, SIGGRAPH, UIST papers 2023-2026

## EXCLUSIONS

- PAS de contenu marketing commercial (only specs verifiees)
- PAS de rumeurs non-confirmees (sauf clairement labellisees "rumored")
- PAS de devices abandonnes avant 2023 sauf si reference historique (Hololens 2, Magic Leap 1 = OK en reference, Google Glass 1 = skip)
- PAS de speculations sur roadmap secrete

## QUESTIONS METHODOLOGIQUES A TRAITER

En conclusion, l'etude doit adresser :

1. Quelle est la meilleure plateforme XR en 2026 pour un dev indie (rapport valeur/effort) ?
2. Quelles conventions emergent comme standards cross-platform (OpenXR adoption) ?
3. Quel FOV minimum pour une vraie experience immersive ?
4. Quelles valeurs divergent entre visionOS et Meta Horizon (et pourquoi) ?
5. Les smart glasses vont-elles remplacer les casques XR pour le grand public d'ici 2028 ?
6. Comment prototyper en XR sans casque (emulateurs, Figma 3D) ?

---

**Livrable attendu :** document markdown structure, valeurs chiffrees exhaustives, tableaux comparatifs, checklists, exemples, sources, prepare pour etre integre dans `bible-ux/XR.md` en suivant le meme format que `WEB.md`, `MOBILE.md`, `WEARABLE.md`.
