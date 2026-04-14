---
sidebar_position: 2
---

# Values & Spacing

Vit Design System provides a sophisticated values system that precisely controls spacing, sizing, and padding across all components. The `VitValues` class is the central configuration point for dimensional properties, enabling you to create consistent spatial relationships and ensure harmonious sizing throughout your application.

This system goes beyond simple padding and margins by providing density-aware values that automatically adapt to different device contexts and user preferences. Whether you're designing for dense data displays or spacious, accessible interfaces, the values system gives you fine-grained control while maintaining consistency.

## Overview

The values system is essential for creating cohesive, professional interfaces. It controls multiple aspects of component appearance and behavior:

- **Component heights** - Buttons, inputs, and interactive elements maintain consistent heights that adapt to your chosen visual density
- **Component sizes** - Avatars, loading indicators, and icons scale proportionally across density levels
- **Padding and spacing** - Internal component padding and margins follow consistent patterns for all components
- **Adaptive sizing** - All values automatically adjust based on the visual density setting in your theme

By centralizing these values, you ensure that spacing relationships remain consistent throughout your application. This creates a sense of rhythm and predictability that users subconsciously appreciate, making your interface feel more polished and professional.

## Visual Density

Visual density is the foundation of the values system, determining how components scale across different contexts. It's a powerful tool for adapting your interface to different use cases and user needs.

Components automatically adapt their sizing based on the visual density setting:

- **Comfortable** - Larger, more spacious sizing with generous touch targets and breathing room. Recommended for accessibility-focused applications, older users, touch-primary interfaces, or when prioritizing ease of interaction over information density.

- **Standard** - Default balanced sizing that works well for most applications. Provides adequate touch targets and comfortable spacing without wasting screen real estate. This is the recommended starting point for most projects.

- **Compact** - Smaller, space-efficient sizing for dense interfaces. Ideal for data-heavy applications, dashboards, desktop-first experiences, or power-user tools where information density is prioritized. Use with caution on touch devices to ensure touch targets remain usable.

Set visual density in your theme to apply it globally:

```dart
VitTheme(
  visualDensity: VisualDensity.standard,
)
```

The visual density setting automatically cascades to all components, ensuring consistent sizing relationships throughout your application. When you change the density, all components automatically adjust their dimensions to match.

## Button Values

Buttons are among the most frequently interacted elements in your interface, making their sizing crucial for usability and user experience.

### Heights

Button heights directly impact both aesthetics and usability. Taller buttons are easier to tap but consume more vertical space, while shorter buttons allow for denser layouts but require more precision from users:

```dart
VitTheme(
  values: VitValues(
    buttonComfortableHeight: 65,
    buttonStandardHeight: 50,
    buttonCompactHeight: 40,
  ),
)
```

The default heights are carefully chosen to balance usability with space efficiency:

- **Comfortable (65px)** provides ample touch area, exceeding the recommended minimum of 44px with generous margin for error. Ideal for primary actions and accessibility-focused designs.

- **Standard (50px)** strikes a balance between generous touch targets and efficient use of vertical space. Suitable for most applications and user demographics.

- **Compact (40px)** minimizes vertical space while still providing adequate touch targets for most users. Best suited for desktop applications or secondary actions.

| Property | Default | Description |
|----------|---------|-------------|
| `buttonComfortableHeight` | `65` | Height for comfortable density |
| `buttonStandardHeight` | `50` | Height for standard density |
| `buttonCompactHeight` | `40` | Height for compact density |

Usage example:

```dart
VitButton(
  text: 'Click Me',
  onPressed: () {},
)
```

The button automatically uses the appropriate height based on the theme's visual density. You never need to manually specify heights in individual components—the theme handles this automatically, ensuring consistency across your entire application.

## Avatar Values

Avatars provide visual representation of users, teams, or entities throughout your interface. Consistent avatar sizing helps maintain visual hierarchy and recognition.

### Radius

Avatar sizes are defined by their radius, which determines both the width and height of the circular avatar component:

```dart
VitTheme(
  values: VitValues(
    avatarComfortableRadius: 26,
    avatarStandardRadius: 24,
    avatarCompactRadius: 18,
  ),
)
```

The radius value creates avatars with diameters of twice the radius value. For example, the standard 24px radius creates a 48px × 48px avatar. These sizes are optimized to:

- Remain clearly recognizable and distinguishable
- Maintain proper proportions relative to text and other UI elements
- Provide adequate space for profile images or initials
- Scale gracefully across different screen densities

Consider that smaller avatars may make it harder to recognize faces or read initials, while larger avatars can dominate the interface. The defaults provide a good balance for most use cases.

| Property | Default | Description |
|----------|---------|-------------|
| `avatarComfortableRadius` | `26` | Radius for comfortable density (52px diameter) |
| `avatarStandardRadius` | `24` | Radius for standard density (48px diameter) |
| `avatarCompactRadius` | `18` | Radius for compact density (36px diameter) |

## Input Values

Text inputs are critical interaction points in most applications. Proper padding and sizing significantly impact usability, readability, and the overall user experience.

### Padding

Input field padding controls the internal space around the text content. Adequate padding improves readability, makes text selection easier, and creates a more comfortable typing experience:

```dart
VitTheme(
  values: VitValues(
    inputComfortablePadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 26,
    ),
    inputStandardPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 21,
    ),
    inputCompactPadding: EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 16,
    ),
  ),
)
```

The vertical padding significantly affects the visual height and tap target of input fields. Generous vertical padding makes inputs easier to tap and creates more visual prominence, while tighter padding allows more form fields to fit in limited vertical space.

Horizontal padding should be sufficient to prevent text from touching the input borders, which can make content feel cramped and difficult to read. The defaults maintain comfortable whitespace while optimizing for space efficiency.

| Property | Default | Description |
|----------|---------|-------------|
| `inputComfortablePadding` | `h:16, v:26` | Padding for comfortable density |
| `inputStandardPadding` | `h:16, v:21` | Padding for standard density |
| `inputCompactPadding` | `h:14, v:16` | Padding for compact density |

### Raw Input Font Size

Raw text inputs are specialized input fields for numerical codes, PINs, or verification codes. These typically display larger text for better readability and confidence during data entry:

```dart
VitTheme(
  values: VitValues(
    rawInputComfortableFontSize: 28,
    rawInputStandardFontSize: 24,
    rawInputCompactFontSize: 21,
  ),
)
```

Larger font sizes in raw inputs serve several purposes:

- Improve readability of numbers and special characters
- Reduce data entry errors by making characters more distinguishable
- Create visual emphasis for critical input fields
- Provide better feedback during typing

The default sizes are proportionally larger than standard body text, ensuring that raw input values stand out clearly in your interface.

| Property | Default | Description |
|----------|---------|-------------|
| `rawInputComfortableFontSize` | `28` | Font size for comfortable density |
| `rawInputStandardFontSize` | `24` | Font size for standard density |
| `rawInputCompactFontSize` | `21` | Font size for compact density |

## Badge Values

Badges are small visual indicators used for notifications, counts, status indicators, or labels. Their padding must be carefully balanced to remain visible without becoming obtrusive.

### Padding

Badge padding controls the internal space around badge content. Vit Design System distinguishes between regular badges (status indicators) and count badges (numerical displays):

```dart
VitTheme(
  values: VitValues(
    badgeComfortablePadding: EdgeInsets.all(6),
    badgeStandardPadding: EdgeInsets.all(4),
    badgeCompactPadding: EdgeInsets.all(2),
    badgeCountComfortablePadding: EdgeInsets.all(4),
    badgeCountStandardPadding: EdgeInsets.all(4),
    badgeCountCompactPadding: EdgeInsets.all(4),
  ),
)
```

**Regular badges** typically contain text or icons and benefit from varied padding across density levels. The padding ensures content doesn't feel cramped while keeping the badge visually compact.

**Count badges** maintain consistent 4px padding across all densities because they display numbers that need to remain legible regardless of density setting. This consistency ensures notification counts are always readable.

The minimal padding values reflect badges' role as subtle, non-intrusive indicators that should draw attention without dominating the interface.

| Property | Default | Description |
|----------|---------|-------------|
| `badgeComfortablePadding` | `6` | Regular badge comfortable padding |
| `badgeStandardPadding` | `4` | Regular badge standard padding |
| `badgeCompactPadding` | `2` | Regular badge compact padding |
| `badgeCountComfortablePadding` | `4` | Count badge comfortable padding |
| `badgeCountStandardPadding` | `4` | Count badge standard padding |
| `badgeCountCompactPadding` | `4` | Count badge compact padding |

## Select Values

Select dropdowns and pickers require careful spacing to ensure options are easy to scan and select, especially on touch devices.

### Item Padding

Dropdown item padding controls the internal space around each selectable option. Adequate padding improves touch accuracy and creates clear visual separation between options:

```dart
VitTheme(
  values: VitValues(
    selectItemComfortablePadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 20,
    ),
    selectItemStandardPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 18,
    ),
    selectItemCompactPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
  ),
)
```

The vertical padding is particularly important for select items because it directly impacts the tap target size. Users need enough space to confidently tap their desired option without accidentally selecting adjacent items.

Horizontal padding prevents text from touching the edges of the dropdown menu, improving readability and providing visual breathing room. The consistent horizontal padding across densities maintains left-edge alignment while allowing vertical density to vary.

These values create clear, tappable rows that feel comfortable to interact with, whether you're using a mouse pointer or a finger on a touch screen.

| Property | Default | Description |
|----------|---------|-------------|
| `selectItemComfortablePadding` | `h:16, v:20` | Item padding comfortable |
| `selectItemStandardPadding` | `h:16, v:18` | Item padding standard |
| `selectItemCompactPadding` | `h:16, v:14` | Item padding compact |

## Chip Values

Chips are compact elements used for tags, filters, selections, or labels. They need sufficient padding to be readable and tappable while remaining visually compact.

### Padding

Chip padding controls the space around chip content (text and optional icons):

```dart
VitTheme(
  values: VitValues(
    chipComfortablePadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    chipStandardPadding: EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    chipCompactPadding: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 6,
    ),
  ),
)
```

Chip padding follows these design principles:

- **Horizontal padding** is proportionally larger to create a pill-shaped appearance and provide adequate space for text and icons
- **Vertical padding** ensures chips have sufficient height to be tappable while remaining visually lightweight
- **Density scaling** maintains the chip's characteristic compact appearance across all density levels

Chips often appear in groups (like tag clouds or filter lists), so their padding must balance individual usability with collective visual density. The defaults ensure chips remain distinguishable and tappable even when multiple chips appear side by side.

| Property | Default | Description |
|----------|---------|-------------|
| `chipComfortablePadding` | `h:16, v:10` | Chip padding comfortable |
| `chipStandardPadding` | `h:12, v:8` | Chip padding standard |
| `chipCompactPadding` | `h:10, v:6` | Chip padding compact |

## Accordion Values

Accordions organize content into expandable/collapsible sections. Their spacing affects both usability (tap targets) and visual hierarchy (content organization).

### Header Padding

Accordion headers are interactive elements that users tap or click to expand/collapse content. Their padding must provide adequate touch targets while clearly indicating interactivity:

```dart
VitTheme(
  values: VitValues(
    accordionHeaderComfortablePadding: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    accordionHeaderStandardPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    accordionHeaderCompactPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
  ),
)
```

Header padding serves multiple purposes:

- Creates adequate tap targets for expanding/collapsing sections
- Provides visual breathing room around header text and icons
- Establishes clear visual separation between adjacent accordion items
- Helps users understand that headers are interactive elements

The symmetrical padding creates balanced, centered headers that feel stable and organized, contributing to clear information hierarchy.

### Body Padding

Accordion body padding controls the space around expanded content. This padding visually distinguishes body content from headers while maintaining comfortable readability:

```dart
VitTheme(
  values: VitValues(
    accordionBodyComfortablePadding: EdgeInsets.all(20),
    accordionBodyStandardPadding: EdgeInsets.all(16),
    accordionBodyCompactPadding: EdgeInsets.all(12),
  ),
)
```

Body padding considerations:

- Should be slightly less than or equal to header padding to create visual continuity
- Provides adequate reading space for expanded content
- Creates visual distinction between collapsed headers and expanded content
- Prevents content from feeling cramped within the accordion panel

The uniform padding (all sides equal) ensures consistent spacing regardless of content type or structure within the accordion body.

| Property | Default | Description |
|----------|---------|-------------|
| `accordionHeaderComfortablePadding` | `h:20, v:20` | Header padding comfortable |
| `accordionHeaderStandardPadding` | `h:16, v:16` | Header padding standard |
| `accordionHeaderCompactPadding` | `h:16, v:12` | Header padding compact |
| `accordionBodyComfortablePadding` | `20` | Body padding comfortable |
| `accordionBodyStandardPadding` | `16` | Body padding standard |
| `accordionBodyCompactPadding` | `12` | Body padding compact |

## Card Values

Cards are versatile containers used throughout modern interfaces. Their padding significantly impacts content presentation and visual hierarchy.

### Padding

Card padding controls the internal space around card content, affecting both aesthetics and readability:

```dart
VitTheme(
  values: VitValues(
    cardComfortablePadding: EdgeInsets.all(24),
    cardStandardPadding: EdgeInsets.all(16),
    cardCompactPadding: EdgeInsets.all(12),
  ),
)
```

Card padding serves critical functions in interface design:

- **Content breathing room** - Creates whitespace around card content, preventing it from feeling cramped or overwhelming
- **Visual hierarchy** - Larger padding makes cards feel more important and elevated from the background
- **Touch targets** - Adequate padding ensures interactive elements within cards remain easily tappable
- **Content organization** - Helps separate card content from its borders, improving scannability

The uniform padding (all sides equal) creates balanced, centered content that feels stable and organized. This works well for most card content types, from simple text to complex layouts with images and actions.

Consider using the larger comfortable padding for primary cards or hero content, standard padding for general-purpose cards, and compact padding for card-heavy layouts like grids or lists where space efficiency is important.

| Property | Default | Description |
|----------|---------|-------------|
| `cardComfortablePadding` | `24` | Card padding comfortable |
| `cardStandardPadding` | `16` | Card padding standard |
| `cardCompactPadding` | `12` | Card padding compact |

## Toast Values

Toast notifications provide temporary feedback to users. Their spacing must balance visibility with non-intrusiveness, ensuring messages are readable without dominating the screen.

### Padding and Margin

Toasts have two distinct spacing properties: internal padding (around the message content) and external margin (from the screen edges):

```dart
VitTheme(
  values: VitValues(
    toastComfortablePadding: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 16,
    ),
    toastStandardPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    toastCompactPadding: EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 10,
    ),
    toastComfortableMargin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    toastStandardMargin: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    toastCompactMargin: EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12,
    ),
  ),
)
```

**Padding** (internal spacing):
- Controls space around the toast message text and icon
- Ensures text doesn't touch the toast borders, maintaining readability
- Provides adequate touch target if toasts are dismissible
- Varies with density to maintain proportional appearance

**Margin** (external spacing):
- Controls distance from screen edges and other UI elements
- Ensures toasts don't obscure important content near screen edges
- Provides visual separation from underlying content
- Helps toasts feel like floating overlay elements rather than inline content

The combination of padding and margin creates a "floating" effect where toasts appear distinct from the main interface while remaining accessible and readable.

| Property | Default | Description |
|----------|---------|-------------|
| `toastComfortablePadding` | `h:20, v:16` | Internal padding comfortable |
| `toastStandardPadding` | `h:16, v:12` | Internal padding standard |
| `toastCompactPadding` | `h:14, v:10` | Internal padding compact |
| `toastComfortableMargin` | `h:20, v:20` | Screen margin comfortable |
| `toastStandardMargin` | `h:16, v:16` | Screen margin standard |
| `toastCompactMargin` | `h:12, v:12` | Screen margin compact |

## Loading Values

Loading indicators provide visual feedback during asynchronous operations. Their size and appearance must be noticeable without being overwhelming or distracting.

### Size

Loading indicator size determines the diameter of circular progress spinners. The size should be proportional to the context where the loader appears:

```dart
VitTheme(
  values: VitValues(
    loadingComfortableSize: 60,
    loadingStandardSize: 50,
    loadingCompactSize: 40,
  ),
)
```

Loading indicator sizing considerations:

- **Comfortable (60px)** - Highly visible for full-screen loading states or primary loading indicators. Draws immediate attention and clearly communicates a loading state.

- **Standard (50px)** - Balanced size suitable for most loading contexts, including modal dialogs, content sections, and general-purpose loading states.

- **Compact (40px)** - Smaller indicators for inline loading states, button loading states, or contexts where space is limited. Still clearly visible but less visually dominant.

Choose sizes based on context: larger for full-page loads, medium for section loads, smaller for inline or button loading states.

### Stroke Width

Stroke width controls the thickness of the circular loading indicator's line. It should scale proportionally with the loading indicator size:

```dart
VitTheme(
  values: VitValues(
    loadingComfortableStrokeWidth: 5,
    loadingStandardStrokeWidth: 4,
    loadingCompactStrokeWidth: 3,
  ),
)
```

Stroke width impacts both visibility and aesthetic:

- **Thicker strokes** (5px) are more visible and create a bolder, more prominent loading indicator
- **Medium strokes** (4px) provide good balance between visibility and visual weight
- **Thinner strokes** (3px) create a more delicate, refined appearance for smaller loading indicators

The stroke width should maintain a consistent visual proportion relative to the loading indicator's overall size. As a rule of thumb, stroke width should be approximately 8-10% of the indicator diameter for optimal appearance.

| Property | Default | Description |
|----------|---------|-------------|
| `loadingComfortableSize` | `60` | Size for comfortable density |
| `loadingStandardSize` | `50` | Size for standard density |
| `loadingCompactSize` | `40` | Size for compact density |
| `loadingComfortableStrokeWidth` | `5` | Stroke width comfortable |
| `loadingStandardStrokeWidth` | `4` | Stroke width standard |
| `loadingCompactStrokeWidth` | `3` | Stroke width compact |

## Popover Values

Popovers are floating overlays that display additional content or options relative to a trigger element. Their styling helps distinguish them from the main interface.

### Border Radius

Unlike most components that inherit border radius from the theme, popovers have their own dedicated border radius setting. This allows you to create more distinctive popover styling:

```dart
VitTheme(
  values: VitValues(
    popoverBorderRadius: 25,
  ),
)
```

The popover border radius is intentionally larger than typical component border radii (default 25px vs. theme default 8px) to:

- **Create visual distinction** - Helps users immediately recognize popovers as temporary overlays separate from permanent UI elements
- **Soften appearance** - More rounded corners create a friendlier, less rigid appearance for floating elements
- **Improve perceived hierarchy** - The distinctive shape helps establish popovers as a higher layer in the visual hierarchy
- **Enhance modern aesthetics** - Prominent rounding contributes to contemporary, app-like interfaces

You can adjust this value to match your design language. Use smaller values (8-12px) for a more traditional, structured appearance, or larger values (20-30px) for a modern, fluid aesthetic. Consider maintaining some differentiation from your theme's standard border radius to help popovers remain visually distinct.

| Property | Default | Description |
|----------|---------|-------------|
| `popoverBorderRadius` | `25` | Corner radius for popover overlays |

## Complete Custom Values Example

Here's a comprehensive example demonstrating a fully customized values configuration optimized for a compact, space-efficient design system. This example shows how all values work together to create a cohesive, dense interface:

```dart
VitApp(
  theme: VitTheme(
    visualDensity: VisualDensity.compact,
    values: VitValues(
      buttonCompactHeight: 36,
      avatarCompactRadius: 16,
      inputCompactPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      rawInputCompactFontSize: 19,
      badgeCompactPadding: EdgeInsets.all(2),
      badgeCountCompactPadding: EdgeInsets.all(3),
      selectItemCompactPadding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      chipCompactPadding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      accordionHeaderCompactPadding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      accordionBodyCompactPadding: EdgeInsets.all(10),
      cardCompactPadding: EdgeInsets.all(10),
      toastCompactPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      toastCompactMargin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      loadingCompactSize: 32,
      loadingCompactStrokeWidth: 2.5,
      popoverBorderRadius: 20,
    ),
  ),
  home: MyHomePage(),
)
```

This compact configuration demonstrates several important principles:

- **Consistent reduction** - All values are proportionally reduced from the standard defaults, maintaining visual harmony
- **Minimum usability** - Touch targets still meet minimum recommendations (though this is better suited for desktop/mouse interfaces)
- **Cohesive spacing** - Padding values maintain proportional relationships across different component types
- **Complete coverage** - All density-aware properties are explicitly configured for comprehensive control

Use this as a template when creating your own custom value sets, adjusting the specific numbers to match your design requirements while maintaining proportional relationships.

## Accessing Values in Custom Components

When building custom components that should respect the design system's spacing and sizing, you can access the current values configuration from anywhere in your widget tree.

You can access the current values in your custom widgets:

```dart
final theme = VitAppTheme.of(context).theme;
final values = theme.values;
final visualDensity = theme.visualDensity;

Container(
  padding: visualDensity == VisualDensity.comfortable
    ? values.cardComfortablePadding
    : visualDensity == VisualDensity.compact
      ? values.cardCompactPadding
      : values.cardStandardPadding,
  child: YourWidget(),
)
```

This pattern ensures your custom components automatically adapt to the theme's visual density setting, maintaining consistency with built-in Vit Design System components.

### Best Practices for Accessing Values

When implementing density-aware custom components:

1. **Always check visual density** - Don't assume a specific density; check the theme's current setting
2. **Provide all three density options** - Support comfortable, standard, and compact for complete flexibility
3. **Default to standard** - Use standard density as the fallback when density isn't explicitly set
4. **Cache theme references** - If accessing values multiple times in a build method, cache the theme reference to avoid repeated context lookups

## Helper Method Example

Creating helper functions to retrieve density-appropriate values simplifies your code and improves maintainability. Here's a reusable pattern for accessing density-aware values:

```dart
EdgeInsets getInputPadding(BuildContext context) {
  final theme = VitAppTheme.of(context).theme;
  final values = theme.values;
  final density = theme.visualDensity;

  if (density == VisualDensity.comfortable) {
    return values.inputComfortablePadding;
  } else if (density == VisualDensity.compact) {
    return values.inputCompactPadding;
  }
  return values.inputStandardPadding;
}
```

You can create similar helpers for different component types:

```dart
double getButtonHeight(BuildContext context) {
  final theme = VitAppTheme.of(context).theme;
  final values = theme.values;
  final density = theme.visualDensity;

  if (density == VisualDensity.comfortable) {
    return values.buttonComfortableHeight;
  } else if (density == VisualDensity.compact) {
    return values.buttonCompactHeight;
  }
  return values.buttonStandardHeight;
}

EdgeInsets getCardPadding(BuildContext context) {
  final theme = VitAppTheme.of(context).theme;
  final values = theme.values;
  final density = theme.visualDensity;

  if (density == VisualDensity.comfortable) {
    return values.cardComfortablePadding;
  } else if (density == VisualDensity.compact) {
    return values.cardCompactPadding;
  }
  return values.cardStandardPadding;
}
```

These helper methods provide several benefits:

- **Code reusability** - Write the density logic once, use it everywhere
- **Consistency** - All components follow the same density logic
- **Maintainability** - Changes to density logic only need to be made in one place
- **Readability** - Cleaner widget code without nested ternary operators

Consider organizing these helpers in a dedicated utility file (e.g., `theme_helpers.dart`) for easy access throughout your application.

## Best Practices

Following these best practices ensures your values configuration creates a cohesive, usable, and maintainable design system.

### Consistency

Maintaining consistent spacing relationships throughout your application is fundamental to professional interface design:

- **Use the same density level throughout your app** - Mixing density levels creates visual inconsistency and a fragmented user experience. Choose one density that matches your primary use case and apply it consistently.

- **Don't mix density levels within a single screen** - Even if different screens use different densities (not recommended), individual screens should maintain consistent density. Mixing creates visual chaos and undermines the design system's purpose.

- **Let components use theme values instead of hardcoding** - Never hardcode padding, sizing, or spacing values in individual components. Always reference theme values to ensure consistency and make future adjustments easier.

- **Maintain proportional relationships** - When customizing values, ensure different components maintain harmonious size relationships. Buttons shouldn't suddenly be smaller than input fields, for example.

### Accessibility

Accessibility should be a primary consideration when choosing and customizing values:

- **Prefer `comfortable` or `standard` density for better accessibility** - Larger touch targets, generous spacing, and bigger text sizes make interfaces more accessible to users with motor impairments, vision limitations, or those using touch interfaces.

- **Use `compact` only when space is truly constrained** - Compact density should be reserved for desktop applications with mouse input, power-user interfaces, or data-dense displays where screen real estate is at a premium. Avoid using it as a default.

- **Ensure touch targets remain at least 44x44 points** - This is the minimum recommended touch target size for accessibility. Verify that your button heights and interactive elements meet this requirement, especially in compact density.

- **Test with actual users** - Different user groups have different needs. Older users, users with motor impairments, or touch-primary users may struggle with compact spacing that seems fine to developers.

- **Consider adjustable density** - For maximum accessibility, consider allowing users to choose their preferred density level within your app's settings.

### Responsive Design

Different devices and form factors may benefit from different density settings:

- **Consider using different densities for different screen sizes:**
  - **Mobile (< 600px)** - `standard` or `comfortable` - Touch interfaces benefit from generous spacing
  - **Tablet (600-1200px)** - `comfortable` - Larger screens can accommodate spacious layouts
  - **Desktop (> 1200px)** - `standard` - Balance between information density and usability with mouse input

- **Adapt to input method** - Touch-primary devices should use larger densities, while mouse-primary interfaces can use tighter spacing.

- **Consider orientation** - Landscape orientation provides more horizontal space but less vertical space, potentially warranting different density choices.

- **Test across devices** - What looks good on a desktop monitor may feel cramped on a phone. Always test your density choices on actual target devices.

### Custom Values

When creating custom value configurations, follow these principles:

- **Maintain proportional relationships** - If you reduce button height, proportionally reduce button padding, input padding, and related values. Inconsistent scaling creates visual disharmony.

- **Keep minimum touch target sizes for interactive elements** - Even with custom values, interactive elements should meet the 44x44pt minimum for touch accessibility.

- **Test your values on different screen sizes** - Custom values that work well on desktop might be unusable on mobile. Test across your target device spectrum.

- **Document your reasoning** - If you deviate significantly from defaults, document why. This helps future developers understand the decisions and maintains institutional knowledge.

- **Start from defaults** - Begin with default values and make incremental adjustments rather than starting from scratch. The defaults are carefully chosen and tested.

- **Consider all components** - When adjusting values, think about how changes affect all component types, not just the ones you're immediately working with.

## Example: Responsive Density

Adapting visual density based on screen size and device characteristics creates optimal experiences across different contexts. Here's how to implement responsive density:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        
        return VitApp(
          theme: VitTheme(
            visualDensity: isTablet 
              ? VisualDensity.comfortable 
              : VisualDensity.standard,
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}
```

This basic example switches between comfortable and standard density based on screen width. For more sophisticated responsive density:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        VisualDensity density;
        
        if (constraints.maxWidth < 600) {
          density = VisualDensity.standard;
        } else if (constraints.maxWidth < 1200) {
          density = VisualDensity.comfortable;
        } else {
          density = VisualDensity.standard;
        }
        
        return VitApp(
          theme: VitTheme(
            visualDensity: density,
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}
```

This advanced example implements a three-tier system:

- **Mobile (< 600px)** - Standard density for balanced touch usability
- **Tablet (600-1200px)** - Comfortable density to take advantage of larger screens
- **Desktop (> 1200px)** - Back to standard density for mouse-based interaction and information density

You can also consider additional factors:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context),
      child: Builder(
        builder: (context) {
          final size = MediaQuery.of(context).size;
          final platform = Theme.of(context).platform;
          
          VisualDensity density;
          
          if (platform == TargetPlatform.iOS || 
              platform == TargetPlatform.android) {
            density = size.width > 600 
              ? VisualDensity.comfortable 
              : VisualDensity.standard;
          } else {
            density = VisualDensity.standard;
          }
          
          return VitApp(
            theme: VitTheme(visualDensity: density),
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}
```

This approach considers both screen size and platform, recognizing that mobile touch interfaces have different needs than desktop pointer interfaces, regardless of screen size.

## Next Steps

- [Learn about internationalization](./i18n.md)
- [Explore theming options](./theming.md)
- [Browse components](../components/button.md)
