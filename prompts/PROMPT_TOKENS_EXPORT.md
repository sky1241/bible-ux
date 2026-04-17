# MODE TOKENS EXPORT - Génère un design system importable depuis VALUES.md

## WHEN
- Tu démarres un projet et tu veux seed tes tokens design directement depuis bible-ux
- Tu veux un fichier CSS / Tailwind / Flutter / SwiftUI / Compose / Figma prêt à coller dans ton projet
- Tu migres un projet existant vers un design system cohérent avec la bible
- Tu as besoin d'un subset de tokens (juste colors, juste spacing, juste typography) sans tout l'ensemble

## WHEN NOT
- Si tu as déjà un design system établi → ne pas écraser, utiliser le PROMPT_DESIGN_AUDIT pour auditer l'existant contre la bible
- Si tu veux juste connaître une valeur ponctuelle → grep direct dans [VALUES.md](../VALUES.md) sans générer de fichier
- Si ton projet a des contraintes de marque (couleurs primary custom) → générer le skeleton puis surcharger les valeurs de marque à la main

## TRIGGER VERBAL
"export tokens", "génère les tokens [format]", "seed design system", "génère CSS tokens", "tailwind config"

---

## À COLLER DANS LA SESSION

Tu es assistant design-to-code. L'user a cloné `bible-ux/` dans son projet. Tu vas générer un fichier de design tokens prêt à importer, construit **100% depuis VALUES.md** (source canonique), complété au besoin par les bibles (WEB, MOBILE, WEARABLE, XR).

## Workflow

1. **Demander à l'user** : quel format de sortie ? (CSS / Tailwind / Flutter / SwiftUI / UIKit / Compose / Android XML / Figma JSON / tous)
2. **Demander** : quel scope ? (tokens complets / juste colors / juste spacing / juste typography / sous-ensemble custom)
3. **Demander** : quelle plateforme cible ? (web / iOS / Android / watchOS / Wear OS / XR / multi)
4. **Demander** : le nom de la marque / préfixe ? (ex. `--acme-`, `extend.acme.spacing`, `AcmeColors`)
5. **Générer** le fichier final, avec en tête un commentaire `Generated from bible-ux VALUES.md` + version bible-ux + date
6. **Fournir** les instructions d'intégration (où coller le fichier, comment l'importer)
7. **Fournir** un checklist de validation post-intégration

## Format de réponse

```
# Tokens générés

**Format** : [CSS / Tailwind / ...]
**Scope** : [tokens complets / sous-ensemble]
**Source** : VALUES.md v1.2.0, bible-ux 2026-04-17
**Cible** : [web / iOS / ...]

## Fichier à créer

Chemin suggéré : `<path>`

```[lang]
// contenu du fichier
```

## Intégration

1. [étape 1]
2. [étape 2]
3. [étape 3]

## Checklist de validation

- [ ] [vérif 1]
- [ ] [vérif 2]
```

---

## Formats de sortie supportés

### 1. CSS Custom Properties (`tokens.css`)

Cible : projets web vanilla, React, Vue, Svelte sans framework de style.

```css
/* Generated from bible-ux VALUES.md v1.2.0 · 2026-04-17
 * Source: https://github.com/sky1241/bible-ux/blob/main/VALUES.md
 * Hierarchy: VALUES > bibles. Do not edit — regenerate from bible-ux.
 */

:root {
  /* ─── Spacing scale (VALUES § Spacing scale) ─── */
  --space-xxs: 4px;
  --space-xs: 8px;
  --space-sm: 12px;
  --space-md: 16px;
  --space-lg: 24px;
  --space-xl: 32px;
  --space-2xl: 48px;
  --space-3xl: 64px;
  --space-4xl: 80px;
  --space-5xl: 96px;

  /* ─── Touch targets (VALUES § Touch targets) ─── */
  --touch-ios: 44px;
  --touch-android: 48px;
  --touch-web-min: 24px;
  --touch-web-ideal: 44px;
  --touch-wear: 48px;
  --touch-wear-ideal: 52px;
  --touch-adjacent-gap: 8px;

  /* ─── Border radius (VALUES § Border radius) ─── */
  --radius-none: 0;
  --radius-xs: 4px;
  --radius-sm: 8px;
  --radius-md: 12px;
  --radius-lg: 16px;
  --radius-pill: 9999px;

  /* ─── Typography web (VALUES § Typography web) ─── */
  --font-display: 48px / 1.1 system-ui, sans-serif;
  --font-h1: 32px / 1.2 system-ui, sans-serif;
  --font-h2: 24px / 1.25 system-ui, sans-serif;
  --font-h3: 20px / 1.3 system-ui, sans-serif;
  --font-h4: 18px / 1.4 system-ui, sans-serif;
  --font-body: 16px / 1.5 system-ui, sans-serif;
  --font-small: 14px / 1.43 system-ui, sans-serif;
  --font-caption: 12px / 1.5 system-ui, sans-serif;
  --line-length-body: 45ch; /* min-max : 45-75ch per VALUES */

  --weight-regular: 400;
  --weight-medium: 500;
  --weight-semibold: 600;
  --weight-bold: 700;

  /* ─── Animation timings (VALUES § Animation timings) ─── */
  --duration-micro: 100ms;
  --duration-micro-max: 150ms;
  --duration-state: 200ms;
  --duration-expand: 250ms;
  --duration-page: 300ms;
  --duration-modal-in: 350ms;
  --duration-modal-out: 250ms;
  --duration-intro: 600ms;
  --duration-spinner: 1400ms;
  --duration-skeleton: 1800ms;

  --ease-out: cubic-bezier(0, 0, 0.2, 1);
  --ease-in: cubic-bezier(0.4, 0, 1, 1);
  --ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
  --ease-spring-subtle: cubic-bezier(0.34, 1.56, 0.64, 1);

  /* ─── Focus indicator (VALUES § Focus indicator) ─── */
  --focus-width: 2px;
  --focus-offset: 2px;
  --focus-style: solid;

  /* ─── Z-index scale (VALUES § Z-index) ─── */
  --z-base: 0;
  --z-sticky: 10;
  --z-dropdown: 20;
  --z-fixed: 30;
  --z-modal-backdrop: 40;
  --z-modal: 50;
  --z-popover: 60;
  --z-tooltip: 70;
  --z-toast: 80;
  --z-loading: 90;
  --z-debug: 100;

  /* ─── Shadows (VALUES § Shadow / elevation) ─── */
  --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
  --shadow-md: 0 1px 3px rgba(0, 0, 0, 0.1), 0 1px 2px rgba(0, 0, 0, 0.06);
  --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1), 0 4px 6px rgba(0, 0, 0, 0.05);
  --shadow-xl: 0 20px 25px rgba(0, 0, 0, 0.1), 0 8px 10px rgba(0, 0, 0, 0.04);

  /* ─── Contrast ratios (VALUES § Contrast) — reference only ─── */
  /* --contrast-text-aa: 4.5; (runtime check) */
  /* --contrast-ui-aa: 3; (runtime check) */
  /* --contrast-text-aaa: 7; */

  /* ─── Breakpoints web (VALUES § Breakpoints) ─── */
  /* Use in @media queries, not directly as vars. */
  /* Mobile:  < 768px
     Tablet:  768px–1024px
     Desktop: 1024px–1440px
     Wide:    > 1440px (max-width container 1280px) */
}

/* Dark mode surface remap (VALUES § Dark mode) */
@media (prefers-color-scheme: dark) {
  :root {
    --surface-0: #121212;
    --surface-1: #1e1e1e;
    --surface-4: #272727;
    --surface-8: #2e2e2e;
    --surface-16: #363636;
  }
}

/* Reduced motion (VALUES § Animation) */
@media (prefers-reduced-motion: reduce) {
  :root {
    --duration-micro: 0.01ms;
    --duration-micro-max: 0.01ms;
    --duration-state: 0.01ms;
    --duration-expand: 0.01ms;
    --duration-page: 0.01ms;
    --duration-modal-in: 0.01ms;
    --duration-modal-out: 0.01ms;
    --duration-intro: 0.01ms;
  }
}
```

**Intégration :**
1. Save as `src/styles/tokens.css`
2. Import first in your root stylesheet : `@import './tokens.css';`
3. Use : `.btn { height: var(--touch-web-ideal); padding: var(--space-md); }`

---

### 2. Tailwind Config (`tailwind.config.js`)

Cible : projets Tailwind CSS v3 / v4.

```javascript
// Generated from bible-ux VALUES.md v1.2.0 · 2026-04-17
// Source: https://github.com/sky1241/bible-ux/blob/main/VALUES.md
// Extends Tailwind defaults — do not erase Tailwind's built-ins you still want.

/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{js,jsx,ts,tsx,vue,svelte,html}'],
  theme: {
    extend: {
      spacing: {
        xxs: '4px',
        xs: '8px',
        sm: '12px',
        md: '16px',
        lg: '24px',
        xl: '32px',
        '2xl': '48px',
        '3xl': '64px',
        '4xl': '80px',
        '5xl': '96px',
        // Touch targets
        'touch-ios': '44px',
        'touch-android': '48px',
        'touch-web': '44px',
        'touch-wear': '52px',
      },
      borderRadius: {
        none: '0',
        xs: '4px',
        sm: '8px',
        md: '12px',
        lg: '16px',
        pill: '9999px',
      },
      fontSize: {
        // [size, { lineHeight, letterSpacing, fontWeight }]
        display: ['48px', { lineHeight: '1.1', fontWeight: '700' }],
        h1: ['32px', { lineHeight: '1.2', fontWeight: '700' }],
        h2: ['24px', { lineHeight: '1.25', fontWeight: '600' }],
        h3: ['20px', { lineHeight: '1.3', fontWeight: '600' }],
        h4: ['18px', { lineHeight: '1.4', fontWeight: '600' }],
        body: ['16px', { lineHeight: '1.5', fontWeight: '400' }],
        small: ['14px', { lineHeight: '1.43', fontWeight: '400' }],
        caption: ['12px', { lineHeight: '1.5', fontWeight: '400' }],
      },
      transitionDuration: {
        micro: '100ms',
        'micro-max': '150ms',
        state: '200ms',
        expand: '250ms',
        page: '300ms',
        'modal-in': '350ms',
        'modal-out': '250ms',
        intro: '600ms',
      },
      transitionTimingFunction: {
        'ease-out-smooth': 'cubic-bezier(0, 0, 0.2, 1)',
        'ease-in-smooth': 'cubic-bezier(0.4, 0, 1, 1)',
        'ease-in-out-smooth': 'cubic-bezier(0.4, 0, 0.2, 1)',
        spring: 'cubic-bezier(0.34, 1.56, 0.64, 1)',
      },
      boxShadow: {
        sm: '0 1px 2px rgba(0,0,0,0.05)',
        md: '0 1px 3px rgba(0,0,0,0.1), 0 1px 2px rgba(0,0,0,0.06)',
        lg: '0 10px 15px rgba(0,0,0,0.1), 0 4px 6px rgba(0,0,0,0.05)',
        xl: '0 20px 25px rgba(0,0,0,0.1), 0 8px 10px rgba(0,0,0,0.04)',
      },
      zIndex: {
        base: '0',
        sticky: '10',
        dropdown: '20',
        fixed: '30',
        'modal-backdrop': '40',
        modal: '50',
        popover: '60',
        tooltip: '70',
        toast: '80',
        loading: '90',
        debug: '100',
      },
      maxWidth: {
        modal_sm: '400px',
        modal_md: '600px',
        modal_lg: '800px',
        content: '1280px',
        prose: '75ch',
      },
      screens: {
        // VALUES § Breakpoints web
        mobile: { max: '767px' },
        tablet: { min: '768px', max: '1023px' },
        desktop: { min: '1024px', max: '1439px' },
        wide: { min: '1440px' },
      },
    },
  },
  plugins: [],
};
```

**Intégration :**
1. Save as `tailwind.config.js` at project root (replaces existing)
2. Use : `<button class="h-touch-web px-md rounded-sm">Click</button>`
3. For dark mode, add Tailwind's `darkMode: 'media'` and use `dark:bg-*` utilities

---

### 3. Flutter ThemeData (`lib/theme/tokens.dart`)

Cible : apps Flutter Material 3.

```dart
// Generated from bible-ux VALUES.md v1.2.0 · 2026-04-17
// Source: https://github.com/sky1241/bible-ux/blob/main/VALUES.md

import 'package:flutter/material.dart';

class BibleTokens {
  BibleTokens._();

  // ─── Spacing (VALUES § Spacing) ───
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;

  // ─── Touch (VALUES § Touch targets) ───
  static const double touchIos = 44;
  static const double touchAndroid = 48;
  static const double touchWear = 48;

  // ─── Radius ───
  static const double radiusXs = 4;
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusPill = 9999;

  // ─── Animation (VALUES § Animation timings) ───
  static const Duration micro = Duration(milliseconds: 100);
  static const Duration state = Duration(milliseconds: 200);
  static const Duration expand = Duration(milliseconds: 250);
  static const Duration page = Duration(milliseconds: 300);
  static const Duration modalIn = Duration(milliseconds: 350);
  static const Duration modalOut = Duration(milliseconds: 250);
  static const Duration intro = Duration(milliseconds: 600);

  // ─── Curves ───
  static const Curve easeOutSmooth = Cubic(0, 0, 0.2, 1);
  static const Curve easeInSmooth = Cubic(0.4, 0, 1, 1);
  static const Curve easeInOutSmooth = Cubic(0.4, 0, 0.2, 1);

  // ─── Typography (VALUES § Typography mobile) ───
  static const TextStyle display = TextStyle(
    fontSize: 34,
    height: 1.12,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle headline = TextStyle(
    fontSize: 24,
    height: 1.17,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle title = TextStyle(
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle label = TextStyle(
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 11,
    height: 1.45,
    fontWeight: FontWeight.w400,
  );

  // ─── Shadows (VALUES § Shadow mobile) ───
  static const BoxShadow card = BoxShadow(
    color: Color(0x14000000), // 0.08 opacity
    blurRadius: 4,
    offset: Offset(0, 1),
  );
  static const BoxShadow elevated = BoxShadow(
    color: Color(0x1F000000), // 0.12 opacity
    blurRadius: 8,
    offset: Offset(0, 2),
  );
  static const BoxShadow modal = BoxShadow(
    color: Color(0x29000000), // 0.16 opacity
    blurRadius: 24,
    offset: Offset(0, 8),
  );
}

/// Use as base ThemeData.
ThemeData bibleTheme(Brightness brightness) => ThemeData(
      useMaterial3: true,
      brightness: brightness,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        displayLarge: BibleTokens.display,
        headlineMedium: BibleTokens.headline,
        titleMedium: BibleTokens.title,
        bodyMedium: BibleTokens.body,
        labelMedium: BibleTokens.label,
        labelSmall: BibleTokens.caption,
      ),
      // Touch targets for buttons
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(88, BibleTokens.touchAndroid),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BibleTokens.radiusSm),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(88, BibleTokens.touchAndroid),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BibleTokens.radiusSm),
          ),
        ),
      ),
    );
```

**Intégration :**
1. `lib/theme/tokens.dart`
2. `MaterialApp(theme: bibleTheme(Brightness.light), darkTheme: bibleTheme(Brightness.dark), ...)`
3. Utiliser `BibleTokens.md` au lieu de magic numbers partout

---

### 4. SwiftUI Theme (`Theme.swift`)

Cible : apps iOS / iPadOS / visionOS SwiftUI.

```swift
// Generated from bible-ux VALUES.md v1.2.0 · 2026-04-17
// Source: https://github.com/sky1241/bible-ux/blob/main/VALUES.md

import SwiftUI

enum BibleSpacing {
    static let xxs: CGFloat = 4
    static let xs: CGFloat = 8
    static let sm: CGFloat = 12
    static let md: CGFloat = 16
    static let lg: CGFloat = 24
    static let xl: CGFloat = 32
    static let xxl: CGFloat = 48
    static let xxxl: CGFloat = 64
}

enum BibleTouch {
    static let ios: CGFloat = 44
    static let android: CGFloat = 48
    static let visionOSMin: CGFloat = 60 // eye tracking min target
}

enum BibleRadius {
    static let xs: CGFloat = 4
    static let sm: CGFloat = 8
    static let md: CGFloat = 12
    static let lg: CGFloat = 16
}

enum BibleDuration {
    static let micro: Double = 0.1
    static let state: Double = 0.2
    static let expand: Double = 0.25
    static let page: Double = 0.3
    static let modalIn: Double = 0.35
    static let modalOut: Double = 0.25
}

enum BibleAnimation {
    static let easeOut = Animation.easeOut(duration: BibleDuration.state)
    static let easeIn = Animation.easeIn(duration: BibleDuration.state)
    static let spring = Animation.spring(response: 0.4, dampingFraction: 0.85)
}

// Typography — iOS uses system Dynamic Type, so we map instead of hard-coding sizes
enum BibleFont {
    static let displayLarge = Font.system(size: 34, weight: .regular)
    static let headline = Font.system(size: 24, weight: .regular)
    static let title = Font.system(size: 16, weight: .semibold)
    static let body = Font.system(size: 14, weight: .regular)
    static let label = Font.system(size: 12, weight: .medium)
    static let caption = Font.system(size: 11, weight: .regular)
}

// Convenience view modifier for button sizing
extension View {
    func bibleTapTarget(_ size: CGFloat = BibleTouch.ios) -> some View {
        self.frame(minWidth: size, minHeight: size)
    }

    func bibleCard(radius: CGFloat = BibleRadius.md) -> some View {
        self
            .padding(BibleSpacing.md)
            .background(
                RoundedRectangle(cornerRadius: radius)
                    .fill(.regularMaterial)
            )
    }
}
```

**Intégration :**
1. `Theme.swift` dans un groupe `Design/`
2. `Button(...) { ... }.bibleTapTarget()` partout
3. Pour visionOS, multiplier les touch par ~1.4 (60 pt minimum) → utiliser `BibleTouch.visionOSMin`

---

### 5. iOS UIKit (`UIKitTokens.swift`)

Cible : apps iOS UIKit (non-SwiftUI).

```swift
import UIKit

enum BibleColor {
    // Semantic — use UIColor dynamic colors for dark mode
    static let success = UIColor.systemGreen
    static let warning = UIColor.systemOrange
    static let error = UIColor.systemRed
    static let info = UIColor.systemBlue
}

enum BibleSpacing {
    static let xxs: CGFloat = 4
    static let xs: CGFloat = 8
    static let sm: CGFloat = 12
    static let md: CGFloat = 16
    static let lg: CGFloat = 24
    static let xl: CGFloat = 32
}

extension UIButton {
    func applyBibleTouchTarget() {
        // Ensure at least 44×44 pt hit area even when visual is smaller
        let minSize: CGFloat = 44
        if bounds.height < minSize {
            let extra = (minSize - bounds.height) / 2
            contentEdgeInsets = UIEdgeInsets(top: extra, left: 0, bottom: extra, right: 0)
        }
    }
}
```

---

### 6. Kotlin Compose Theme (`BibleTheme.kt`)

Cible : apps Android Compose / Wear OS Compose.

```kotlin
// Generated from bible-ux VALUES.md v1.2.0 · 2026-04-17
package com.yourapp.theme

import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.material3.Typography
import androidx.compose.material3.Shapes
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight

object BibleSpacing {
    val xxs = 4.dp
    val xs = 8.dp
    val sm = 12.dp
    val md = 16.dp
    val lg = 24.dp
    val xl = 32.dp
    val xxl = 48.dp
    val xxxl = 64.dp
}

object BibleTouch {
    val ios = 44.dp
    val android = 48.dp
    val wear = 48.dp
    val wearIdeal = 52.dp
}

object BibleRadius {
    val xs = 4.dp
    val sm = 8.dp
    val md = 12.dp
    val lg = 16.dp
}

val bibleShapes = Shapes(
    extraSmall = RoundedCornerShape(BibleRadius.xs),
    small = RoundedCornerShape(BibleRadius.sm),
    medium = RoundedCornerShape(BibleRadius.md),
    large = RoundedCornerShape(BibleRadius.lg),
    extraLarge = RoundedCornerShape(BibleRadius.lg),
)

val bibleTypography = Typography(
    displayLarge = TextStyle(fontSize = 34.sp, lineHeight = 38.sp, fontWeight = FontWeight.Normal),
    headlineMedium = TextStyle(fontSize = 24.sp, lineHeight = 28.sp, fontWeight = FontWeight.Normal),
    titleMedium = TextStyle(fontSize = 16.sp, lineHeight = 20.sp, fontWeight = FontWeight.SemiBold),
    bodyMedium = TextStyle(fontSize = 14.sp, lineHeight = 20.sp, fontWeight = FontWeight.Normal),
    labelMedium = TextStyle(fontSize = 12.sp, lineHeight = 16.sp, fontWeight = FontWeight.Medium),
    labelSmall = TextStyle(fontSize = 11.sp, lineHeight = 16.sp, fontWeight = FontWeight.Normal),
)

object BibleDuration {
    const val MICRO = 100
    const val STATE = 200
    const val EXPAND = 250
    const val PAGE = 300
    const val MODAL_IN = 350
    const val MODAL_OUT = 250
}
```

**Intégration :**
1. `app/src/main/java/.../theme/BibleTheme.kt`
2. Dans ton `MaterialTheme { content }`, passer `shapes = bibleShapes, typography = bibleTypography`
3. Sizing : `Modifier.size(BibleTouch.android)` au lieu de `48.dp` hard-coded

---

### 7. Android XML Resources

Cible : apps Android XML-based (legacy views ou Compose co-existing).

**`res/values/dimens.xml`**

```xml
<?xml version="1.0" encoding="utf-8"?>
<!-- Generated from bible-ux VALUES.md v1.2.0 · 2026-04-17 -->
<resources>
    <!-- Spacing (VALUES § Spacing) -->
    <dimen name="space_xxs">4dp</dimen>
    <dimen name="space_xs">8dp</dimen>
    <dimen name="space_sm">12dp</dimen>
    <dimen name="space_md">16dp</dimen>
    <dimen name="space_lg">24dp</dimen>
    <dimen name="space_xl">32dp</dimen>
    <dimen name="space_xxl">48dp</dimen>

    <!-- Touch targets (VALUES § Touch targets) -->
    <dimen name="touch_target_min">48dp</dimen>
    <dimen name="touch_target_adjacent_gap">8dp</dimen>

    <!-- Radius (VALUES § Border radius) -->
    <dimen name="radius_xs">4dp</dimen>
    <dimen name="radius_sm">8dp</dimen>
    <dimen name="radius_md">12dp</dimen>
    <dimen name="radius_lg">16dp</dimen>

    <!-- Focus (VALUES § Focus indicator) -->
    <dimen name="focus_ring_width">2dp</dimen>
    <dimen name="focus_ring_offset">2dp</dimen>
</resources>
```

**`res/values/integers.xml`**

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <integer name="duration_micro">100</integer>
    <integer name="duration_state">200</integer>
    <integer name="duration_expand">250</integer>
    <integer name="duration_page">300</integer>
    <integer name="duration_modal_in">350</integer>
    <integer name="duration_modal_out">250</integer>
</resources>
```

**Intégration :**
1. Drop les fichiers dans `app/src/main/res/values/`
2. Usage XML : `android:padding="@dimen/space_md"`
3. Usage Kotlin : `resources.getDimensionPixelSize(R.dimen.space_md)`

---

### 8. Figma Tokens JSON (Tokens Studio format)

Cible : Figma + plugin Tokens Studio (ex-Figma Tokens).

```json
{
  "$metadata": {
    "tokenSetOrder": ["bible-ux"],
    "generatedFrom": "bible-ux VALUES.md v1.2.0",
    "generatedAt": "2026-04-17"
  },
  "bible-ux": {
    "spacing": {
      "xxs": { "value": "4", "type": "spacing" },
      "xs":  { "value": "8", "type": "spacing" },
      "sm":  { "value": "12", "type": "spacing" },
      "md":  { "value": "16", "type": "spacing" },
      "lg":  { "value": "24", "type": "spacing" },
      "xl":  { "value": "32", "type": "spacing" },
      "2xl": { "value": "48", "type": "spacing" },
      "3xl": { "value": "64", "type": "spacing" },
      "4xl": { "value": "80", "type": "spacing" },
      "5xl": { "value": "96", "type": "spacing" }
    },
    "radius": {
      "none": { "value": "0", "type": "borderRadius" },
      "xs":   { "value": "4", "type": "borderRadius" },
      "sm":   { "value": "8", "type": "borderRadius" },
      "md":   { "value": "12", "type": "borderRadius" },
      "lg":   { "value": "16", "type": "borderRadius" },
      "pill": { "value": "9999", "type": "borderRadius" }
    },
    "touchTarget": {
      "ios":     { "value": "44", "type": "sizing" },
      "android": { "value": "48", "type": "sizing" },
      "webMin":  { "value": "24", "type": "sizing" },
      "webIdeal":{ "value": "44", "type": "sizing" },
      "wear":    { "value": "48", "type": "sizing" },
      "visionOS":{ "value": "60", "type": "sizing" }
    },
    "typography": {
      "display": {
        "value": { "fontFamily": "System", "fontSize": "48", "fontWeight": "700", "lineHeight": "1.1" },
        "type": "typography"
      },
      "h1":      { "value": { "fontSize": "32", "fontWeight": "700", "lineHeight": "1.2" }, "type": "typography" },
      "h2":      { "value": { "fontSize": "24", "fontWeight": "600", "lineHeight": "1.25" }, "type": "typography" },
      "h3":      { "value": { "fontSize": "20", "fontWeight": "600", "lineHeight": "1.3" }, "type": "typography" },
      "body":    { "value": { "fontSize": "16", "fontWeight": "400", "lineHeight": "1.5" }, "type": "typography" },
      "small":   { "value": { "fontSize": "14", "fontWeight": "400", "lineHeight": "1.43" }, "type": "typography" },
      "caption": { "value": { "fontSize": "12", "fontWeight": "400", "lineHeight": "1.5" }, "type": "typography" }
    },
    "shadow": {
      "sm": { "value": "0 1px 2px rgba(0,0,0,0.05)", "type": "boxShadow" },
      "md": { "value": "0 1px 3px rgba(0,0,0,0.1), 0 1px 2px rgba(0,0,0,0.06)", "type": "boxShadow" },
      "lg": { "value": "0 10px 15px rgba(0,0,0,0.1), 0 4px 6px rgba(0,0,0,0.05)", "type": "boxShadow" },
      "xl": { "value": "0 20px 25px rgba(0,0,0,0.1), 0 8px 10px rgba(0,0,0,0.04)", "type": "boxShadow" }
    },
    "duration": {
      "micro":    { "value": "100", "type": "other" },
      "state":    { "value": "200", "type": "other" },
      "expand":   { "value": "250", "type": "other" },
      "page":     { "value": "300", "type": "other" },
      "modalIn":  { "value": "350", "type": "other" },
      "modalOut": { "value": "250", "type": "other" },
      "intro":    { "value": "600", "type": "other" }
    }
  }
}
```

**Intégration :**
1. Ouvrir Figma → plugins → Tokens Studio for Figma
2. Import → JSON → coller ce contenu
3. Apply to elements : sélectionner layer → assigner token via panel Tokens
4. Push to GitHub : Tokens Studio sync avec ce même repo pour garder designers et devs alignés

---

## Colors (note importante)

VALUES.md ne déclare **pas de couleurs de marque** — c'est voulu, chaque projet a sa palette. Ce prompt génère par défaut :

- **Neutres** : grayscale 50-950 (pattern Tailwind-style)
- **Sémantiques** : success / warning / error / info (valeurs standards)
- **Primary / brand** : **laissé vide**, l'user doit remplir

Si l'user demande "export tokens avec ma couleur primaire `#3B82F6`", tu génères les variants (lighten 40%, base, darken 20%, subtle 8% alpha) selon la formule de `PROMPT_DESIGN_AUDIT.md` part 2.

---

## Sous-ensembles (si user demande juste une partie)

| Sous-ensemble | Contenu minimum |
|---------------|-----------------|
| `spacing` | Scale 4–96 + marges écran |
| `typography` | Scale display→caption + weights |
| `colors` | Neutres + sémantiques (si l'user fournit la brand color : variants) |
| `motion` | Durations + easings + reduced motion |
| `elevation` | Shadows web + mobile + radius |
| `a11y` | Touch targets + contrast minima + focus |

---

## Règles

1. **JAMAIS inventer une valeur.** Si elle n'est pas dans VALUES.md ou une bible, tu demandes à l'user.
2. **TOUJOURS** mettre en tête du fichier généré : source + version + date + warning "do not edit — regenerate".
3. **Tokens sémantiques > tokens primitifs.** Si possible, deux layers : `primitive.blue.500` + `semantic.action.primary = primitive.blue.500`. Si la scope est simple, faire primitive seul.
4. **Noms** : suivre le pattern Tailwind-ish (xxs/xs/sm/md/lg/xl/...) pour cohérence, sauf si l'user demande explicitement un autre pattern (T-shirt size vs numeric vs BEM).
5. **Préfixe** : toujours préfixer par la marque (`bible-`, `acme-`, etc.) sauf dans les frameworks qui interdisent (Android XML).
6. **Dark mode** : générer le remap séparément, pas inverser les couleurs light.
7. **Reduced motion** : inclure systématiquement pour CSS / Compose / SwiftUI (platforms qui supportent `prefers-reduced-motion`).

---

## Anti-comportements

- ❌ Générer un design system complet alors que l'user ne demande que le spacing
- ❌ Oublier la mention de source en tête de fichier
- ❌ Inventer des couleurs de marque "par défaut" (demander)
- ❌ Utiliser des valeurs hard-codées qui contredisent VALUES.md
- ❌ Générer du code pour une plateforme que bible-ux ne couvre pas (Svelte 5 custom runes, etc.) sans prévenir
