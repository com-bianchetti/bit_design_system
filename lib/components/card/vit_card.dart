import 'package:vit_design_system/components/form/vit_form.dart';
import 'package:vit_design_system/components/skeleton/vit_loading_scope.dart';
import 'package:vit_design_system/components/skeleton/vit_skeleton_shimmer.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:vit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A highly flexible and customizable card widget that provides consistent styling.
///
/// The [VitCard] is a versatile container widget that can be used to group
/// related content, display information in a structured way, or create
/// interactive elements with rich visual customization options.
///
/// ## Usage
///
/// ### Basic Card
///
/// ```dart
/// VitCard(
///   child: Text('Card content'),
/// )
/// ```
///
/// ### Card with Padding
///
/// ```dart
/// VitCard(
///   padding: EdgeInsets.all(24),
///   child: Column(
///     children: [
///       Text('Title'),
///       Text('Content'),
///     ],
///   ),
/// )
/// ```
///
/// ### Card with Custom Colors
///
/// ```dart
/// VitCard(
///   backgroundColor: Colors.blue,
///   child: Text('Custom card'),
/// )
/// ```
///
/// ### Elevated Card
///
/// ```dart
/// VitCard(
///   elevation: 4,
///   child: Text('Elevated card'),
/// )
/// ```
///
/// ### Interactive Card
///
/// ```dart
/// VitCard(
///   onTap: () {
///     print('Card tapped');
///   },
///   child: Text('Tap me'),
/// )
/// ```
///
/// ### Card with Border
///
/// ```dart
/// VitCard(
///   showBorder: true,
///   borderColor: Colors.grey,
///   borderWidth: 2,
///   child: Text('Bordered card'),
/// )
/// ```
///
/// ## Customization
///
/// - Use [backgroundColor] to customize the card background color
/// - Use [elevation] to add shadow depth
/// - Use [borderRadius] to customize corner rounding
/// - Use [padding] to control internal spacing
/// - Use [margin] to control external spacing
/// - Use [width] and [height] to control dimensions
/// - Use [showBorder] to toggle border visibility
/// - Use [borderColor] and [borderWidth] to customize borders
/// - Use [onTap], [onLongPress], [onDoubleTap] for interactions
/// - Use [clipBehavior] to control content clipping
/// - Use [visualDensity] to control size variants
/// - Use [variant] to use different background color presets
class VitCard extends StatelessWidget {
  /// The widget to display inside the card.
  final Widget child;

  /// Background color of the card.
  ///
  /// If null, uses the theme's card color or variant based on [variant].
  final Color? backgroundColor;

  /// The visual variant of the card.
  ///
  /// - [VitCardVariant.standard]: Uses theme's cardColor
  /// - [VitCardVariant.elevated]: Uses theme's elevatedCardColor
  /// - [VitCardVariant.variant]: Uses theme's cardVariantColor
  /// - [VitCardVariant.elevatedVariant]: Uses theme's elevatedCardVariantColor
  ///
  /// Defaults to [VitCardVariant.standard].
  final VitCardVariant variant;

  /// Elevation of the card (shadow depth).
  ///
  /// Defaults to 0.
  final double elevation;

  /// Border radius for the card corners.
  ///
  /// If null, uses the theme's border radius.
  final BorderRadius? borderRadius;

  /// Padding inside the card.
  ///
  /// If null, uses padding based on [visualDensity] from theme values.
  final EdgeInsetsGeometry? padding;

  /// Margin around the card.
  ///
  /// Defaults to zero margin.
  final EdgeInsetsGeometry? margin;

  /// Width of the card.
  ///
  /// If null, the card will expand to fill available width.
  final double? width;

  /// Height of the card.
  ///
  /// If null, the card will size based on its child.
  final double? height;

  /// Whether to show a border around the card.
  ///
  /// Defaults to theme's showCardBorder configuration.
  final bool? showBorder;

  /// Color of the card border.
  ///
  /// If null, uses the theme's border color.
  /// Only applies when [showBorder] is true.
  final Color? borderColor;

  /// Width of the card border.
  ///
  /// Defaults to 1.0.
  /// Only applies when [showBorder] is true.
  final double borderWidth;

  /// Callback function invoked when the card is tapped.
  ///
  /// When provided, the card becomes interactive with ink splash effect.
  final VoidCallback? onTap;

  /// Callback function invoked when the card is long pressed.
  final VoidCallback? onLongPress;

  /// Callback function invoked when the card is double tapped.
  final VoidCallback? onDoubleTap;

  /// Defines how the card's content should be clipped.
  ///
  /// Defaults to [Clip.antiAlias].
  final Clip clipBehavior;

  /// Visual density that controls the card's default padding.
  ///
  /// If null, uses the theme's visual density.
  /// - [VisualDensity.comfortable]: Larger padding
  /// - [VisualDensity.standard]: Standard padding
  /// - [VisualDensity.compact]: Smaller padding
  ///
  /// Only applies when [padding] is null.
  final VisualDensity? visualDensity;

  /// Semantic label for accessibility.
  ///
  /// Provides a description for screen readers.
  final String? semanticLabel;

  /// Whether the card is in a skeleton loading state.
  ///
  /// When true, the card displays a shimmer skeleton effect while
  /// preserving its original layout and dimensions.
  ///
  /// This property also responds to [VitLoadingScope]. If a [VitLoadingScope]
  /// ancestor has [loading] set to true, this card will show skeleton
  /// loading even if [isLoading] is false.
  ///
  /// Defaults to false.
  final bool isLoading;

  /// Custom gradient for the card background.
  ///
  /// When provided, takes precedence over [backgroundColor].
  final Gradient? gradient;

  /// Shadow color for the elevation.
  ///
  /// If null, uses default shadow color.
  final Color? shadowColor;

  /// Surface tint color for Material 3 elevation.
  ///
  /// If null, uses default surface tint.
  final Color? surfaceTintColor;

  /// Alignment of the child within the card.
  ///
  /// If null, uses [Alignment.center].
  final AlignmentGeometry? alignment;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id can be used to identify the card.
  final String? id;

  /// Creates a [VitCard].
  ///
  /// The [child] parameter is required.
  /// All other parameters are optional and have sensible defaults.
  const VitCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.variant = VitCardVariant.standard,
    this.elevation = 0,
    this.borderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.showBorder,
    this.borderColor,
    this.borderWidth = 1.0,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.clipBehavior = Clip.antiAlias,
    this.visualDensity,
    this.semanticLabel,
    this.isLoading = false,
    this.gradient,
    this.shadowColor,
    this.surfaceTintColor,
    this.alignment,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final effectiveVisualDensity = visualDensity ?? theme.visualDensity;
    final effectiveLoading = isLoading || VitLoadingScope.isLoading(context);

    final effectivePadding =
        padding ?? _getDefaultPadding(theme, effectiveVisualDensity);
    final effectiveBorderRadius = borderRadius ?? theme.borderRadius;
    final effectiveBackgroundColor = backgroundColor ?? _getVariantColor(theme);
    final effectiveBorderColor = borderColor ?? theme.borderColor;

    if (effectiveLoading) {
      return Container(
        width: width,
        height: height,
        margin: margin,
        child: VitSkeletonShimmer(
          child: Material(
            elevation: elevation,
            borderRadius: effectiveBorderRadius,
            shadowColor: shadowColor,
            surfaceTintColor: surfaceTintColor,
            color: theme.skeletonBaseColor,
            clipBehavior: clipBehavior,
            child: Container(
              width: width,
              height: height,
              padding: effectivePadding,
              decoration: BoxDecoration(
                borderRadius: effectiveBorderRadius,
                border: (showBorder ?? theme.configuration.showCardBorder)
                    ? Border.all(
                        color: theme.borderColor,
                        width: borderWidth,
                      )
                    : null,
              ),
              alignment: alignment,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.skeletonHighlightColor,
                  borderRadius: effectiveBorderRadius,
                ),
              ),
            ),
          ),
        ),
      );
    }

    final isInteractive =
        onTap != null || onLongPress != null || onDoubleTap != null;

    Widget cardContent = Container(
      width: width,
      height: height,
      padding: effectivePadding,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: effectiveBorderRadius,
        border: (showBorder ?? theme.configuration.showCardBorder)
            ? Border.all(
                color: effectiveBorderColor,
                width: borderWidth,
              )
            : null,
      ),
      alignment: alignment,
      child: child,
    );

    if (isInteractive) {
      cardContent = InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        borderRadius: effectiveBorderRadius,
        child: Container(
          width: width,
          height: height,
          padding: effectivePadding,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: effectiveBorderRadius,
            border: (showBorder ?? theme.configuration.showCardBorder)
                ? Border.all(
                    color: effectiveBorderColor,
                    width: borderWidth,
                  )
                : null,
          ),
          alignment: alignment,
          child: child,
        ),
      );
    }

    Widget card = Material(
      elevation: elevation,
      borderRadius: effectiveBorderRadius,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      color: gradient == null ? effectiveBackgroundColor : Colors.transparent,
      clipBehavior: clipBehavior,
      child: cardContent,
    );

    if (semanticLabel != null) {
      card = Semantics(
        label: semanticLabel,
        button: isInteractive,
        container: true,
        child: card,
      );
    }

    if (margin != null) {
      card = Padding(
        padding: margin!,
        child: card,
      );
    }

    if (id != null) {
      return FormField<String>(
        initialValue: id,
        onSaved: (value) {
          final form = VitFormProvider.maybeOf(context);
          form?.save(id!, id!);
        },
        builder: (field) => card,
      );
    }

    return card;
  }

  EdgeInsetsGeometry _getDefaultPadding(VitTheme theme, VisualDensity density) {
    return switch (density) {
      VisualDensity.compact => theme.values.cardCompactPadding,
      VisualDensity.comfortable => theme.values.cardComfortablePadding,
      _ => theme.values.cardStandardPadding,
    };
  }

  Color _getVariantColor(VitTheme theme) {
    return switch (variant) {
      VitCardVariant.standard => theme.cardColor,
      VitCardVariant.elevated => theme.elevatedCardColor,
      VitCardVariant.variant => theme.cardVariantColor,
      VitCardVariant.elevatedVariant => theme.elevatedCardVariantColor,
    };
  }
}

/// Defines the visual variant of a [VitCard].
enum VitCardVariant {
  /// Uses the theme's standard card color.
  standard,

  /// Uses the theme's elevated card color.
  elevated,

  /// Uses the theme's card variant color.
  variant,

  /// Uses the theme's elevated card variant color.
  elevatedVariant,
}
