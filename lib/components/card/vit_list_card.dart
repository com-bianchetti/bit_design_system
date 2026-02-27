import 'package:vit_design_system/components/card/vit_card.dart';
import 'package:vit_design_system/components/form/vit_form.dart';
import 'package:vit_design_system/components/skeleton/vit_loading_scope.dart';
import 'package:vit_design_system/components/skeleton/vit_skeleton_shimmer.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:vit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A highly flexible and customizable list-style card widget based on ListTile.
///
/// The [VitListCard] combines the structure of [ListTile] with card styling,
/// providing a consistent way to display list items with leading icons/images,
/// titles, subtitles, and trailing widgets within a card container.
///
/// ## Usage
///
/// ### Basic List Card
///
/// ```dart
/// VitListCard(
///   title: Text('Title'),
///   subtitle: Text('Subtitle'),
/// )
/// ```
///
/// ### List Card with Icon
///
/// ```dart
/// VitListCard(
///   leading: Icon(Icons.person),
///   title: Text('John Doe'),
///   subtitle: Text('Software Engineer'),
/// )
/// ```
///
/// ### Interactive List Card
///
/// ```dart
/// VitListCard(
///   title: Text('Settings'),
///   trailing: Icon(Icons.chevron_right),
///   onTap: () {
///     Navigator.push(...);
///   },
/// )
/// ```
///
/// ### List Card with Avatar
///
/// ```dart
/// VitListCard(
///   leading: CircleAvatar(
///     backgroundImage: NetworkImage('avatar.jpg'),
///   ),
///   title: Text('Jane Smith'),
///   subtitle: Text('Online'),
///   trailing: Icon(Icons.message),
/// )
/// ```
///
/// ## Customization
///
/// - Use [leading] to add icons, avatars, or custom widgets at the start
/// - Use [title] and [subtitle] for primary and secondary text
/// - Use [trailing] to add icons, badges, or custom widgets at the end
/// - Use [backgroundColor] to customize the card background color
/// - Use [elevation] to add shadow depth
/// - Use [borderRadius] to customize corner rounding
/// - Use [contentPadding] to control internal spacing of the ListTile
/// - Use [showBorder] to toggle border visibility
/// - Use [onTap], [onLongPress] for interactions
/// - Use [visualDensity] to control size variants
/// - Use [variant] to use different background color presets
class VitListCard extends StatelessWidget {
  /// The primary content of the list tile.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// A widget to display before the title.
  ///
  /// Typically an [Icon], [CircleAvatar], or [Image] widget.
  final Widget? leading;

  /// A widget to display after the title.
  ///
  /// Typically an [Icon] or small text widget.
  final Widget? trailing;

  /// A widget to display below the title, subtitle, leading and trailing.
  ///
  /// Makes the card possibly growing in height but show more flexible content.
  final Widget? bottomWidget;

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

  /// The internal padding of the ListTile content.
  ///
  /// If null, uses padding based on [visualDensity] from theme values.
  final EdgeInsetsGeometry? contentPadding;

  /// Margin around the card.
  ///
  /// Defaults to zero margin.
  final EdgeInsetsGeometry? margin;

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

  /// Whether this list tile is interactive.
  ///
  /// If false, the tile will not respond to touch events.
  /// Defaults to true if [onTap] or [onLongPress] is provided.
  final bool? enabled;

  /// Whether this list tile is part of a vertically dense list.
  ///
  /// If true, reduces the vertical size of the ListTile.
  /// Defaults to false.
  final bool dense;

  /// Whether the title and subtitle are wrapped with three lines of text.
  ///
  /// When true, allows up to three lines for title and subtitle.
  /// Defaults to false.
  final bool isThreeLine;

  /// Whether this list tile is selected.
  ///
  /// When true, applies selection styling to the tile.
  /// Defaults to false.
  final bool selected;

  /// The color for the tile's Material when it has the input focus.
  final Color? focusColor;

  /// The color for the tile's Material when a pointer is hovering over it.
  final Color? hoverColor;

  /// The color of the tile when the tile is selected.
  final Color? selectedTileColor;

  /// The tile's internal padding when selected.
  final EdgeInsetsGeometry? selectedPadding;

  /// Defines the color used for icons and text when the list tile is selected.
  final Color? selectedColor;

  /// The color of the leading icon when the tile is enabled.
  final Color? iconColor;

  /// The color of the leading and trailing icons when the tile is selected.
  final Color? selectedIconColor;

  /// The color of the title text when the tile is enabled.
  final Color? textColor;

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
  /// Only applies when [contentPadding] is null.
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

  /// Shadow color for the elevation.
  ///
  /// If null, uses default shadow color.
  final Color? shadowColor;

  /// Surface tint color for Material 3 elevation.
  ///
  /// If null, uses default surface tint.
  final Color? surfaceTintColor;

  /// The shape of the card's Material.
  ///
  /// If null, uses [RoundedRectangleBorder] with [borderRadius].
  final ShapeBorder? shape;

  /// Defines the title's [TextStyle].
  final TextStyle? titleTextStyle;

  /// Defines the subtitle's [TextStyle].
  final TextStyle? subtitleTextStyle;

  /// Defines the leading widget's size.
  ///
  /// Defaults to 40.0 for normal tiles and 36.0 for dense tiles.
  final double? leadingSize;

  /// Defines the trailing widget's size.
  ///
  /// Defaults to 24.0.
  final double? trailingSize;

  /// The horizontal gap between the titles and the leading/trailing widgets.
  final double? horizontalTitleGap;

  /// The minimum padding on the top and bottom of the title and subtitle widgets.
  final double? minVerticalPadding;

  /// The minimum height of the tile.
  final double? minTileHeight;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id can be used to identify the card.
  final String? id;

  /// Creates a [VitListCard].
  ///
  /// At least one of [title], [subtitle], [leading], or [trailing] should be provided.
  const VitListCard({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.bottomWidget,
    this.backgroundColor,
    this.variant = VitCardVariant.standard,
    this.elevation = 0,
    this.borderRadius,
    this.contentPadding,
    this.margin,
    this.showBorder,
    this.borderColor,
    this.borderWidth = 1.0,
    this.onTap,
    this.onLongPress,
    this.enabled,
    this.dense = false,
    this.isThreeLine = false,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.selectedTileColor,
    this.selectedPadding,
    this.selectedColor,
    this.iconColor,
    this.selectedIconColor,
    this.textColor,
    this.clipBehavior = Clip.antiAlias,
    this.visualDensity,
    this.semanticLabel,
    this.isLoading = false,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.leadingSize,
    this.trailingSize,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minTileHeight,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final effectiveVisualDensity = visualDensity ?? theme.visualDensity;
    final effectiveLoading = isLoading || VitLoadingScope.isLoading(context);

    final effectiveBorderRadius = borderRadius ?? theme.borderRadius;
    final effectiveBackgroundColor = backgroundColor ?? _getVariantColor(theme);
    final effectiveBorderColor = borderColor ?? theme.borderColor;
    final effectiveContentPadding =
        contentPadding ?? _getDefaultPadding(theme, effectiveVisualDensity);

    if (effectiveLoading) {
      return Container(
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
              padding: effectiveContentPadding,
              decoration: BoxDecoration(
                borderRadius: effectiveBorderRadius,
                border: (showBorder ?? theme.configuration.showCardBorder)
                    ? Border.all(
                        color: theme.skeletonBaseColor,
                        width: borderWidth,
                      )
                    : null,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      if (leading != null) ...[
                        Container(
                          width: leadingSize ?? (dense ? 36 : 40),
                          height: leadingSize ?? (dense ? 36 : 40),
                          decoration: BoxDecoration(
                            color: theme.skeletonHighlightColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: horizontalTitleGap ?? 16),
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
                              SizedBox(height: 8),
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
                        SizedBox(width: horizontalTitleGap ?? 16),
                        Container(
                          width: trailingSize ?? 24,
                          height: trailingSize ?? 24,
                          decoration: BoxDecoration(
                            color: theme.skeletonHighlightColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (bottomWidget != null) ...[
                    SizedBox(height: 16),
                    Container(
                      height: 48,
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
          ),
        ),
      );
    }

    Widget listTile = ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      contentPadding: effectiveContentPadding,
      enabled: enabled ?? (onTap != null || onLongPress != null),
      dense: dense,
      isThreeLine: isThreeLine,
      selected: selected,
      onTap: onTap,
      onLongPress: onLongPress,
      focusColor: focusColor,
      hoverColor: hoverColor,
      selectedTileColor: selectedTileColor,
      selectedColor: selectedColor,
      iconColor: iconColor,
      textColor: textColor,
      titleTextStyle: titleTextStyle,
      subtitleTextStyle: subtitleTextStyle,
      leadingAndTrailingTextStyle: titleTextStyle,
      horizontalTitleGap: horizontalTitleGap,
      minVerticalPadding: minVerticalPadding,
      minTileHeight: minTileHeight,
      visualDensity: effectiveVisualDensity,
    );

    if (bottomWidget != null) {
      listTile = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          listTile,
          bottomWidget!,
        ],
      );
    }

    final effectiveShape =
        shape ??
        RoundedRectangleBorder(
          borderRadius: effectiveBorderRadius,
          side: (showBorder ?? theme.configuration.showCardBorder)
              ? BorderSide(
                  color: effectiveBorderColor,
                  width: borderWidth,
                )
              : BorderSide.none,
        );

    Widget card = Material(
      elevation: elevation,
      shape: effectiveShape,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      color: effectiveBackgroundColor,
      clipBehavior: clipBehavior,
      child: listTile,
    );

    if (semanticLabel != null) {
      card = Semantics(
        label: semanticLabel,
        button: onTap != null || onLongPress != null,
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
