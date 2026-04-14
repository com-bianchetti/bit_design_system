import 'package:vit_design_system/components/card/vit_card.dart';
import 'package:vit_design_system/components/skeleton/vit_loading_scope.dart';
import 'package:vit_design_system/components/skeleton/vit_skeleton_shimmer.dart';
import 'package:vit_design_system/components/text/vit_text.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:vit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A card component that displays an item with an icon, title, subtitle, and trailing widget.
///
/// The [VitItemCard] provides a structured layout for list items or
/// grid items that need to show a standard set of information.
class VitItemCard extends StatelessWidget {
  /// The main title text of the card.
  final String title;

  /// The subtitle text displayed below the title.
  final String? subtitle;

  /// The icon or widget to display on the leading edge of the card.
  final Widget? icon;

  /// The widget to display on the trailing edge of the card.
  final Widget? trailing;

  /// Background color of the card.
  final Color? backgroundColor;

  /// The visual variant of the card.
  final VitCardVariant variant;

  /// Border radius for the card corners.
  final BorderRadius? borderRadius;

  /// Padding inside the card.
  final EdgeInsetsGeometry? padding;

  /// Margin around the card.
  final EdgeInsetsGeometry? margin;

  /// Whether to show a border around the card.
  final bool? showBorder;

  /// Color of the card border.
  final Color? borderColor;

  /// Callback function invoked when the card is tapped.
  final VoidCallback? onTap;

  /// Elevation of the card (shadow depth).
  final double elevation;

  /// Visual density that controls the card's default padding.
  final VisualDensity? visualDensity;

  /// Whether the card is in a skeleton loading state.
  final bool isLoading;

  /// Creates a [VitItemCard].
  const VitItemCard({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.trailing,
    this.backgroundColor,
    this.variant = VitCardVariant.standard,
    this.elevation = 0,
    this.borderRadius,
    this.padding,
    this.margin,
    this.showBorder,
    this.borderColor,
    this.onTap,
    this.visualDensity,
    this.isLoading = false,
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
        margin: margin,
        child: VitSkeletonShimmer(
          child: Material(
            elevation: elevation,
            borderRadius: effectiveBorderRadius,
            color: theme.skeletonBaseColor,
            clipBehavior: Clip.antiAlias,
            child: Container(
              padding: effectivePadding,
              decoration: BoxDecoration(
                borderRadius: effectiveBorderRadius,
                border: (showBorder ?? theme.configuration.showCardBorder)
                    ? Border.all(
                        color: theme.borderColor,
                        width: 1.0,
                      )
                    : null,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: theme.skeletonHighlightColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 16,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: theme.skeletonHighlightColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 8),
                          Container(
                            height: 14,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: theme.skeletonHighlightColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null) ...[
                    const SizedBox(width: 16),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: theme.skeletonHighlightColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      );
    }

    return VitCard(
      backgroundColor: effectiveBackgroundColor,
      variant: variant,
      elevation: elevation,
      borderRadius: effectiveBorderRadius,
      padding: effectivePadding,
      margin: margin,
      showBorder: showBorder,
      borderColor: effectiveBorderColor,
      visualDensity: effectiveVisualDensity,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 16),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                VitText(
                  title,
                  bold: true,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  VitText(
                    subtitle!,
                    style: theme.bodySmall.copyWith(
                      color: theme.onBackgroundVariantColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 16),
            trailing!,
          ],
        ],
      ),
    );
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
