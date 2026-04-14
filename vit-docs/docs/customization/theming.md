---
sidebar_position: 1
---

# Theming

Vit Design System provides a comprehensive and flexible theming system that allows you to customize every visual aspect of your application. The `VitTheme` class serves as the central configuration hub, giving you fine-grained control over colors, typography, spacing, layout properties, and more.

The theming system is designed with modern application development in mind, supporting features like dark mode, semantic color naming, responsive layouts, and internationalization out of the box. Whether you're building a simple app with default styling or a complex enterprise application with strict brand guidelines, VitTheme provides the flexibility you need.

## Basic Theming

### Default Theme

The simplest way to start using Vit Design System is with the default theme. This provides a carefully crafted color palette and typography system that works well for most applications:

```dart
VitApp(
  theme: VitTheme(),
  home: MyHomePage(),
)
```

The default theme uses a neutral dark gray (`#1F1F1F`) as the primary color, a light gray background (`#F6F7F7`), and the Inter font family. It's designed to be professional and accessible while remaining visually appealing.

### Custom Theme

You can easily customize your theme to match your brand identity by overriding specific properties. The VitTheme constructor accepts all theme properties as optional parameters, so you only need to specify the values you want to change:

```dart
VitApp(
  theme: VitTheme(
    primaryColor: Colors.blue,
    secondaryColor: Colors.orange,
    backgroundColor: Colors.white,
    fontFamily: 'Roboto',
  ),
  home: MyHomePage(),
)
```

Any properties you don't specify will automatically use their default values, making it easy to start with a basic customization and refine it over time.

## Color System

Vit Design System uses a structured color system that organizes colors by their purpose and context. This approach ensures visual consistency across your application and makes it easy to maintain a cohesive design language.

### Primary Colors

The primary and secondary colors form the foundation of your app's visual identity. These colors are used throughout the design system for interactive elements, emphasis, and branding:

```dart
VitTheme(
  primaryColor: Color(0xff1F1F1F),
  secondaryColor: Color(0xff1F1F1F),
  backgroundColor: Color(0xffF6F7F7),
)
```

The **primary color** is typically your brand's main color and is used for primary buttons, active states, key icons, and other prominent interface elements. The **secondary color** provides an alternative accent for variety and hierarchy. The **background color** sets the base canvas for your entire application.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `primaryColor` | `Color` | `Color(0xff1F1F1F)` | Primary brand color used for buttons, accents |
| `secondaryColor` | `Color` | `Color(0xff1F1F1F)` | Secondary brand color for alternative elements |
| `backgroundColor` | `Color` | `Color(0xffF6F7F7)` | Main background color of the app |

### Card Colors

Cards are fundamental building blocks in modern UI design. Vit Design System provides a sophisticated card color system with support for elevation and variants, allowing you to create visual depth and hierarchy:

```dart
VitTheme(
  cardColor: Color(0xffFEFEFF),
  elevatedCardColor: Color(0xffF6F7F7),
  cardVariantColor: Color(0xffEAEBEB),
  elevatedCardVariantColor: Color(0xffD6D6D6),
)
```

The **cardColor** is your primary card background, typically slightly elevated from the main background. The **elevatedCardColor** is used for cards that sit above other cards, creating additional visual hierarchy. The variant colors provide alternative styling options for secondary cards or different content types within the same interface.

This four-level color system gives you precise control over visual depth without relying solely on shadows, which is especially useful for creating accessible designs that work well in different lighting conditions.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `cardColor` | `Color` | `Color(0xffFEFEFF)` | Base card background color |
| `elevatedCardColor` | `Color` | `Color(0xffF6F7F7)` | Elevated card background |
| `cardVariantColor` | `Color` | `Color(0xffEAEBEB)` | Alternative card color |
| `elevatedCardVariantColor` | `Color` | `Color(0xffD6D6D6)` | Elevated alternative card |

### Text Colors

Text colors follow the Material Design principle of "on" colors, which describe text and icon colors based on what surface they appear on. This naming convention ensures proper contrast and readability:

```dart
VitTheme(
  onBackrgroundColor: Color(0xff191919),
  onPrimaryColor: Color(0xffffffff),
  onSecondaryColor: Color(0xffffffff),
  onBackgroundVariantColor: Color(0xff666666),
)
```

The **onBackrgroundColor** (note: there's a typo in the property name that's maintained for backwards compatibility) is used for primary text on your background color. The **onPrimaryColor** and **onSecondaryColor** ensure text remains legible when displayed on primary and secondary colored surfaces. The **onBackgroundVariantColor** provides a muted text option for secondary information, captions, and less important content.

When customizing these colors, always ensure sufficient contrast ratios for accessibility. A good rule of thumb is a contrast ratio of at least 4.5:1 for normal text and 3:1 for large text.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `onBackrgroundColor` | `Color` | `Color(0xff191919)` | Text color on background |
| `onPrimaryColor` | `Color` | `Color(0xffffffff)` | Text color on primary |
| `onSecondaryColor` | `Color` | `Color(0xffffffff)` | Text color on secondary |
| `onBackgroundVariantColor` | `Color` | `Color(0xff666666)` | Muted text color |

### Semantic Colors

Semantic colors communicate meaning and state through color. These colors should remain consistent with user expectations across different platforms and applications:

```dart
VitTheme(
  errorColor: Color(0xffFF4D4F),
  successColor: Color(0xff52C41A),
  disabledColor: Color(0xffCBCBCB),
  borderColor: Color(0xffE2E2E2),
)
```

The **errorColor** is used for error messages, validation failures, destructive actions, and alert states. The **successColor** indicates successful operations, confirmations, and positive states. The **disabledColor** is applied to components that are currently inactive or unavailable, providing clear visual feedback about interactivity. The **borderColor** creates subtle boundaries between elements without overwhelming the interface.

These colors work together to create an intuitive feedback system that helps users understand the state of their actions and the application.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `errorColor` | `Color` | `Color(0xffFF4D4F)` | Error states and messages |
| `successColor` | `Color` | `Color(0xff52C41A)` | Success states and messages |
| `disabledColor` | `Color` | `Color(0xffCBCBCB)` | Disabled component state |
| `borderColor` | `Color` | `Color(0xffE2E2E2)` | Border and divider color |

### Skeleton Loading Colors

Skeleton screens are a powerful UX pattern for perceived performance during content loading. Vit Design System provides dedicated colors for creating smooth, animated skeleton loaders:

```dart
VitTheme(
  skeletonBaseColor: Color(0xFFE0E0E0),
  skeletonHighlightColor: Color(0xFFF5F5F5),
)
```

The **skeletonBaseColor** serves as the foundation of the skeleton element, while the **skeletonHighlightColor** creates the shimmer effect that sweeps across the skeleton. The contrast between these two colors should be subtle to create a smooth, professional loading animation.

These colors automatically adapt to your theme but can be customized to better match your brand or to provide better visibility in different contexts. For dark themes, consider using darker base colors with slightly lighter highlights to maintain the same visual effect.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `skeletonBaseColor` | `Color` | `Color(0xFFE0E0E0)` | Base skeleton color |
| `skeletonHighlightColor` | `Color` | `Color(0xFFF5F5F5)` | Skeleton shimmer highlight |

### Custom Colors

Beyond the predefined color properties, VitTheme provides a flexible map for defining additional custom colors specific to your application needs:

```dart
VitTheme(
  colors: {
    'brand': Colors.purple,
    'accent': Colors.amber,
    'warning': Color(0xFFFF9800),
    'info': Color(0xFF2196F3),
  },
)
```

The `colors` map allows you to extend the theme with domain-specific colors without modifying the core design system. This is particularly useful for:

- Additional semantic colors like warning or info states
- Feature-specific colors for different sections of your app
- Special colors for data visualization
- Brand colors beyond primary and secondary
- Any other color that doesn't fit into the standard categories

Access custom colors anywhere in your application with type-safe null handling:

```dart
final theme = VitAppTheme.of(context).theme;
final brandColor = theme.colors['brand'];
final warningColor = theme.colors['warning'];
```

Always provide fallback values when accessing custom colors to handle cases where they might not be defined.

## Typography

Typography is a cornerstone of great user interface design. Vit Design System provides a comprehensive type system organized into three hierarchical categories, each with three sizes for maximum flexibility.

### Text Styles

The typography system is built around three style categories that serve distinct purposes in your interface hierarchy:

#### Title Styles

Title styles are designed for headings, section headers, and any text that needs to command attention. They use bold font weights to create clear visual hierarchy:

```dart
VitTheme(
  titleBig: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  title: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
)
```

Use **titleBig** for page headers and main headings, **title** for section headings and modal titles, and **titleSmall** for subsections and card titles. The bold weight ensures these elements stand out clearly from body text.

| Property | Default | Usage |
|----------|---------|-------|
| `titleBig` | 24px, bold | Main page headings |
| `title` | 20px, bold | Section headings |
| `titleSmall` | 18px, bold | Subsection headings |

#### Body Styles

Body styles are optimized for readability and extended reading. They use normal font weights and sizes that are comfortable for longer text passages:

```dart
VitTheme(
  bodyBig: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
  body: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
)
```

The **body** style at 16px is the recommended size for most body text, as it provides excellent readability on both mobile and desktop screens. Use **bodyBig** when you want to emphasize certain paragraphs or improve readability, and **bodySmall** for dense information or secondary content.

| Property | Default | Usage |
|----------|---------|-------|
| `bodyBig` | 18px, normal | Emphasized body text |
| `body` | 16px, normal | Standard body text |
| `bodySmall` | 14px, normal | Secondary body text |

#### Label Styles

Label styles are designed for UI elements like form labels, captions, badges, and metadata. These smaller sizes are perfect for supporting information:

```dart
VitTheme(
  labelBig: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  label: TextStyle(fontSize: 8, fontWeight: FontWeight.normal),
  labelSmall: TextStyle(fontSize: 6, fontWeight: FontWeight.normal),
)
```

Use **labelBig** for form field labels, button labels, and captions. The smaller **label** and **labelSmall** sizes are useful for timestamps, badges, tiny indicators, and very compact interfaces. Be cautious with the smallest sizes to ensure they remain readable across different devices and screen densities.

| Property | Default | Usage |
|----------|---------|-------|
| `labelBig` | 10px, normal | Input labels, captions |
| `label` | 8px, normal | Small labels |
| `labelSmall` | 6px, normal | Very small text |

### Font Family

Typography consistency across your application is crucial for a professional appearance. The font family setting applies globally to all text styles in your theme:

```dart
VitTheme(
  fontFamily: 'Roboto',
)
```

The default font family is **Inter**, a modern, highly legible typeface designed specifically for user interfaces. When specifying a custom font family, ensure that:

1. The font is properly added to your Flutter project's `pubspec.yaml` file
2. The font files are included in your assets
3. The font provides good readability at all the sizes used in your theme
4. The font supports all the character sets needed for your application's languages

The font family automatically applies to all predefined text styles (titleBig, title, body, etc.), but can be overridden at the component level when needed for specific design requirements.

## Layout & Spacing

Layout properties control the visual rhythm and spacing of your application. These settings affect how components look and feel across your entire app.

### Border Radius

Border radius determines the roundness of component corners, contributing significantly to your app's visual style. From sharp edges to fully rounded pills, this single property can dramatically change your app's personality:

```dart
VitTheme(
  borderRadius: BorderRadius.circular(12),
)
```

The default border radius is 8px, which provides a modern, friendly appearance without being overly rounded. Common values include:

- `BorderRadius.circular(0)` - Sharp, rectangular corners for a more traditional or serious interface
- `BorderRadius.circular(4)` - Subtle rounding for a softer look while maintaining crispness
- `BorderRadius.circular(8)` - Default, balanced roundness suitable for most applications
- `BorderRadius.circular(12)` or higher - More pronounced roundness for a friendly, modern aesthetic
- `BorderRadius.circular(999)` - Fully rounded ends, creating pill-shaped buttons and components

This setting consistently affects buttons, cards, text inputs, modals, and other components with visible borders. You can also use `BorderRadius.only()` for asymmetric corner radii if needed for specific design requirements.

### Visual Density

Visual density controls the compactness of components, affecting padding, spacing, and overall component sizes. This is particularly useful for adapting your interface to different use cases and user preferences:

```dart
VitTheme(
  visualDensity: VisualDensity.comfortable,
)
```

The visual density system provides three preset configurations:

- **VisualDensity.compact** - Reduces padding and spacing to fit more content on screen. Ideal for data-dense applications, dashboards, or power-user interfaces where information density is prioritized over spaciousness.

- **VisualDensity.standard** - The default setting, providing a balanced approach that works well for most applications. Offers good touch targets and comfortable spacing without wasting screen real estate.

- **VisualDensity.comfortable** - Increases padding and spacing for a more relaxed, accessible interface. Recommended for applications targeting older users, touch-primary interfaces, or when prioritizing ease of interaction over information density.

Visual density affects hit targets, internal component padding, and the spacing between elements. Consider your target audience and primary input method (touch vs. mouse) when choosing the appropriate density.

### Button Width

On large screens like tablets and desktops, buttons can become impractically wide if allowed to expand freely. The button max width property prevents this issue:

```dart
VitTheme(
  buttonMaxWidth: 450,
)
```

The default maximum width is 450px, which provides a good balance between visibility and usability. When a button's container is wider than this value, the button will center itself and remain at the maximum width.

This is particularly important for:
- Form submission buttons that would otherwise stretch across the entire screen on desktop
- Full-width buttons in responsive layouts that need reasonable constraints
- Maintaining consistent button sizes across different screen sizes

Set this value based on your typical button label lengths and overall design language. Very short labels might benefit from a smaller max width, while longer labels or multi-line buttons might need more space.

## Theme System Properties

Beyond colors, typography, and layout, VitTheme includes several system-level properties for advanced configuration.

### Brightness

The brightness property indicates whether the theme is intended for light or dark mode. While it doesn't automatically change colors, it helps components make appropriate decisions about rendering:

```dart
VitTheme(
  brightness: Brightness.light,
)
```

Set to `Brightness.light` for light themes and `Brightness.dark` for dark themes. This property is used by the system and components to:

- Determine appropriate status bar and navigation bar styling
- Adjust system overlays and modal barriers
- Help components make smart decisions about contrast
- Support accessibility features that depend on theme brightness

Always set this property correctly when creating custom themes to ensure consistent behavior across your application.

### Values Configuration

VitTheme integrates with the `VitValues` class, which provides additional customizable values for spacing, sizing, and other numeric properties:

```dart
VitTheme(
  values: VitValues(),
)
```

The values system allows you to define consistent spacing scales, component-specific dimensions, animation durations, and other numeric constants that should remain consistent across your application. Refer to the [values customization documentation](./values.md) for detailed information.

### Configuration Settings

The configuration property provides access to behavioral settings and feature flags through the `VitConfiguration` class:

```dart
VitTheme(
  configuration: VitConfiguration(),
)
```

This system allows you to control component behavior, enable or disable features, and adjust functionality without changing visual styling. Check the configuration documentation for available options.

### Internationalization

VitTheme includes built-in support for internationalization through the `VitStrings` class, allowing you to customize all user-facing text in Vit components:

```dart
VitTheme(
  bitStrings: VitStrings(),
)
```

This enables you to provide translations for built-in component text like button labels, error messages, and accessibility hints. See the [internationalization guide](./i18n.md) for details on translating your application.

## Dark Mode

Dark mode has become an essential feature in modern applications, reducing eye strain in low-light environments and conserving battery on OLED screens. Vit Design System makes implementing dark mode straightforward and flexible.

Create separate themes for light and dark modes:

### Light Theme

When designing a light theme, use darker text on lighter backgrounds. The default light theme provides a professional starting point:

```dart
final lightTheme = VitTheme(
  primaryColor: Colors.blue,
  secondaryColor: Colors.orange,
  backgroundColor: Color(0xffF6F7F7),
  cardColor: Color(0xffFEFEFF),
  onBackrgroundColor: Color(0xff191919),
  errorColor: Color(0xffFF4D4F),
  successColor: Color(0xff52C41A),
  borderColor: Color(0xffE2E2E2),
  brightness: Brightness.light,
);
```

Light themes should prioritize:
- Sufficient contrast between text and background
- Subtle shadows and borders for depth
- Slightly off-white backgrounds to reduce glare
- Clear semantic colors that remain visible against light backgrounds

### Dark Theme

Dark themes require careful color selection to maintain readability while reducing brightness. Use lighter text on darker backgrounds and adjust accent colors for better visibility:

```dart
final darkTheme = VitTheme(
  primaryColor: Colors.blue.shade300,
  secondaryColor: Colors.orange.shade300,
  backgroundColor: Color(0xff121212),
  cardColor: Color(0xff1E1E1E),
  onBackrgroundColor: Color(0xffE1E1E1),
  errorColor: Color(0xffFF6B6B),
  successColor: Color(0xff69DB7C),
  borderColor: Color(0xff373737),
  brightness: Brightness.dark,
);
```

Dark theme best practices:
- Use true black (`#000000`) sparingly as it can cause smearing on OLED screens
- Prefer dark grays (`#121212` to `#1E1E1E`) for backgrounds
- Lighten accent colors compared to your light theme for better contrast
- Use subtle elevation differences rather than heavy shadows
- Ensure borders remain visible without being too bright
- Test semantic colors to ensure they remain meaningful in dark contexts

### Applying Dark Mode

Once you've defined both light and dark themes, apply them to your application using the `VitApp` widget:

```dart
VitApp(
  theme: lightTheme,
  darkTheme: darkTheme,
  themeMode: ThemeMode.system,
  home: MyHomePage(),
)
```

The `themeMode` parameter determines which theme is active:

- **ThemeMode.system** (recommended) - Automatically follows the user's device theme preference. This provides the best user experience as it respects their system-wide settings and adapts automatically when they change.

- **ThemeMode.light** - Always uses the light theme regardless of system settings. Useful during development or for applications that require a specific appearance.

- **ThemeMode.dark** - Always uses the dark theme regardless of system settings. Appropriate for specialized applications like photography or video editing tools where dark interfaces are preferred.

You can dynamically change the theme mode at runtime by wrapping your `VitApp` in a stateful widget and rebuilding when the theme mode changes, allowing users to override the system preference within your app.

## Accessing Theme in Widgets

The theme system is designed to be easily accessible throughout your widget tree, ensuring consistent styling across your entire application.

### Get Current Theme

Access the current active theme from any widget in your tree using the `VitAppTheme` inherited widget:

```dart
final theme = VitAppTheme.of(context).theme;
```

This automatically returns the correct theme (light or dark) based on the current theme mode. The theme is available anywhere below the `VitApp` widget in your widget tree, making it convenient to use in deeply nested components.

### Use Theme Colors

Apply theme colors to your custom widgets to ensure they adapt properly to theme changes and dark mode:

```dart
Container(
  color: theme.primaryColor,
  child: Text(
    'Hello',
    style: TextStyle(color: theme.onPrimaryColor),
  ),
)
```

By using theme colors instead of hardcoded values, your components will automatically adapt when the theme changes, supporting both light and dark modes without additional code.

### Use Theme Typography

Leverage the predefined text styles to maintain consistent typography throughout your application:

```dart
VitText(
  'Hello, World!',
  style: theme.title,
)
```

You can also combine theme text styles with color overrides:

```dart
Text(
  'Important Message',
  style: theme.titleBig.copyWith(color: theme.errorColor),
)
```

This approach keeps your typography consistent while allowing contextual color adjustments.

### Use Custom Colors

When working with custom colors from the theme's color map, always provide fallback values to handle cases where the color might not be defined:

```dart
final brandColor = theme.colors['brand'] ?? Colors.purple;

Container(
  decoration: BoxDecoration(
    color: brandColor,
    borderRadius: theme.borderRadius,
  ),
)
```

This pattern ensures your UI remains functional even if someone forgets to define a custom color in the theme configuration.

### Access Theme Properties

All theme properties are accessible in the same way:

```dart
Container(
  decoration: BoxDecoration(
    color: theme.cardColor,
    borderRadius: theme.borderRadius,
    border: Border.all(color: theme.borderColor),
  ),
  padding: EdgeInsets.all(16),
  child: Text(
    'Card Content',
    style: theme.body.copyWith(color: theme.onBackrgroundColor),
  ),
)
```

## Advanced Theming

For complex applications, you may need more sophisticated theming approaches beyond basic customization.

### Multiple Themes

Create a library of theme presets for different contexts, user preferences, or A/B testing:

```dart
class AppThemes {
  static final VitTheme blue = VitTheme(
    primaryColor: Colors.blue,
    secondaryColor: Colors.blueAccent,
  );

  static final VitTheme green = VitTheme(
    primaryColor: Colors.green,
    secondaryColor: Colors.greenAccent,
  );

  static final VitTheme purple = VitTheme(
    primaryColor: Colors.purple,
    secondaryColor: Colors.purpleAccent,
  );
}
```

This pattern is useful for:
- Allowing users to choose their preferred theme color
- Creating seasonal or event-specific themes
- Supporting different brands in a white-label application
- Testing different color schemes during development

Use them dynamically based on user preferences or application state:

```dart
VitApp(
  theme: AppThemes.blue,
  home: MyHomePage(),
)
```

### Theme Inheritance

Build new themes based on existing ones to maintain consistency while making targeted adjustments:

```dart
final baseTheme = VitTheme(
  primaryColor: Colors.blue,
  fontFamily: 'Roboto',
);

final customTheme = VitTheme(
  primaryColor: baseTheme.primaryColor,
  secondaryColor: Colors.orange,
  fontFamily: baseTheme.fontFamily,
  backgroundColor: Colors.white,
);
```

This approach helps when:
- Creating variations of a base theme
- Maintaining consistent properties across multiple themes
- Building a theme system for a design system library
- Ensuring certain properties always match across themes

Note that VitTheme doesn't currently provide a `copyWith` method, so you'll need to manually specify inherited properties. Consider creating a factory method for your specific inheritance patterns.

### Conditional Theming

Apply different themes based on runtime conditions, user data, or application state:

```dart
VitApp(
  theme: userPreference == 'blue' 
    ? AppThemes.blue 
    : AppThemes.green,
  home: MyHomePage(),
)
```

More complex conditional theming examples:

```dart
VitApp(
  theme: _getThemeForUser(currentUser),
  darkTheme: _getDarkThemeForUser(currentUser),
  themeMode: userSettings.prefersDarkMode 
    ? ThemeMode.dark 
    : ThemeMode.light,
  home: MyHomePage(),
)

VitTheme _getThemeForUser(User user) {
  if (user.isPremium) {
    return AppThemes.premium;
  } else if (user.role == 'admin') {
    return AppThemes.admin;
  }
  return AppThemes.standard;
}
```

This enables:
- Role-based theming for different user types
- Premium features with exclusive themes
- Regional or localization-specific themes
- Feature flag controlled theme variations

## Complete Theme Example

Here's a comprehensive example demonstrating a fully customized theme with both light and dark variants. This example showcases best practices for creating a cohesive, production-ready theme:

```dart
import 'package:flutter/material.dart';
import 'package:vit_design_system/vit_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VitApp(
      theme: VitTheme(
        primaryColor: Color(0xff6366F1),
        secondaryColor: Color(0xffEC4899),
        backgroundColor: Color(0xffF9FAFB),
        cardColor: Colors.white,
        elevatedCardColor: Color(0xffF3F4F6),
        cardVariantColor: Color(0xffE5E7EB),
        elevatedCardVariantColor: Color(0xffD1D5DB),
        onBackrgroundColor: Color(0xff111827),
        onPrimaryColor: Colors.white,
        onSecondaryColor: Colors.white,
        onBackgroundVariantColor: Color(0xff6B7280),
        errorColor: Color(0xffEF4444),
        successColor: Color(0xff10B981),
        disabledColor: Color(0xffD1D5DB),
        borderColor: Color(0xffE5E7EB),
        skeletonBaseColor: Color(0xffE5E7EB),
        skeletonHighlightColor: Color(0xffF3F4F6),
        fontFamily: 'Inter',
        borderRadius: BorderRadius.circular(8),
        visualDensity: VisualDensity.standard,
        brightness: Brightness.light,
        buttonMaxWidth: 450,
        colors: {
          'warning': Color(0xffF59E0B),
          'info': Color(0xff3B82F6),
        },
      ),
      darkTheme: VitTheme(
        primaryColor: Color(0xff818CF8),
        secondaryColor: Color(0xffF472B6),
        backgroundColor: Color(0xff111827),
        cardColor: Color(0xff1F2937),
        elevatedCardColor: Color(0xff374151),
        cardVariantColor: Color(0xff374151),
        elevatedCardVariantColor: Color(0xff4B5563),
        onBackrgroundColor: Color(0xffF9FAFB),
        onPrimaryColor: Color(0xff111827),
        onSecondaryColor: Color(0xff111827),
        onBackgroundVariantColor: Color(0xff9CA3AF),
        errorColor: Color(0xffF87171),
        successColor: Color(0xff34D399),
        disabledColor: Color(0xff4B5563),
        borderColor: Color(0xff374151),
        skeletonBaseColor: Color(0xff374151),
        skeletonHighlightColor: Color(0xff4B5563),
        fontFamily: 'Inter',
        borderRadius: BorderRadius.circular(8),
        visualDensity: VisualDensity.standard,
        brightness: Brightness.dark,
        buttonMaxWidth: 450,
        colors: {
          'warning': Color(0xffFBBF24),
          'info': Color(0xff60A5FA),
        },
      ),
      themeMode: ThemeMode.system,
      home: MyHomePage(),
    );
  }
}
```

This example demonstrates:
- Complete color definitions for both light and dark modes
- Properly adjusted accent colors for dark theme visibility
- Consistent border radius and spacing across themes
- Custom semantic colors (warning and info) in the colors map
- System theme mode for automatic adaptation
- All four card color variants for proper elevation hierarchy
- Appropriate contrast ratios for accessibility

## Best Practices

Following these guidelines will help you create themes that are consistent, accessible, and maintainable.

### Consistency

Consistent theming creates a cohesive user experience and makes your application feel professional and well-designed:

- **Use theme colors instead of hardcoding colors** - Always access colors through `VitAppTheme.of(context).theme` rather than using literal color values. This ensures your components adapt to theme changes and dark mode automatically.

- **Apply the same border radius throughout your app** - Visual consistency in corner rounding contributes significantly to a unified design language. Avoid mixing different border radius values unless there's a specific design reason.

- **Use semantic colors for their intended purpose** - Error colors should only indicate errors, success colors should only indicate success. Mixing purposes creates confusion and reduces the effectiveness of color as a communication tool.

- **Maintain consistent spacing** - Use the visual density setting consistently and avoid overriding spacing at the component level unless absolutely necessary.

### Accessibility

Accessible themes ensure your application is usable by everyone, including users with visual impairments:

- **Ensure sufficient contrast between text and background** - Aim for a minimum contrast ratio of 4.5:1 for normal text and 3:1 for large text (18px bold or 24px regular). Use online contrast checkers to verify your color choices.

- **Test your theme in both light and dark modes** - Colors that work well in light mode may have insufficient contrast in dark mode. Test all combinations of text and background colors.

- **Consider color-blind users when choosing colors** - Approximately 8% of men and 0.5% of women have some form of color blindness. Don't rely solely on color to convey information. Use additional visual cues like icons, patterns, or text labels.

- **Use semantic colors meaningfully** - Beyond accessibility requirements, semantic colors help users quickly understand states and actions. Consistent use of red for errors and green for success aligns with universal conventions.

- **Ensure interactive elements are easily identifiable** - Buttons, links, and other interactive elements should be visually distinct through color, borders, or other styling.

### Performance

Efficient theme implementation prevents unnecessary rebuilds and keeps your application responsive:

- **Define themes at the app level, not per component** - Create your VitTheme instances outside of build methods, ideally as static or top-level constants. Creating new theme instances in build methods causes unnecessary object creation.

- **Avoid creating new theme instances frequently** - If you need to change themes dynamically, manage the theme selection state at a high level rather than recreating themes on every build.

- **Cache theme-derived values when possible** - If you compute colors or styles based on theme values, consider caching these computations, especially in frequently rebuilt widgets.

- **Use const constructors where possible** - When defining theme configurations that don't change, use const constructors to allow Flutter to reuse instances.

### Maintainability

Well-organized themes are easier to update, debug, and extend:

- **Define color constants in a central location** - Create a dedicated file for your color palette (e.g., `app_colors.dart`) that contains named color constants. This makes it easy to update colors across all themes.

```dart
class AppColors {
  static const indigo500 = Color(0xff6366F1);
  static const pink500 = Color(0xffEC4899);
  static const gray50 = Color(0xffF9FAFB);
}
```

- **Use descriptive names for custom colors** - Instead of `colors: {'color1': ...}`, use meaningful names like `colors: {'brandAccent': ...}` or `colors: {'promotionalBanner': ...}`.

- **Document your theme choices for team members** - Add comments explaining why certain colors or values were chosen, especially if they deviate from typical patterns or have specific accessibility requirements.

- **Version your themes** - When making significant theme changes, consider keeping old theme definitions temporarily to allow for gradual migration or A/B testing.

- **Create a theme preview or showcase** - Build a screen that displays all your theme colors, typography, and common component combinations. This helps designers and developers see the full theme at a glance.

## Next Steps

- [Explore spacing and values customization](./values.md)
- [Set up internationalization](./i18n.md)
- [Browse components](../components/button.md)
