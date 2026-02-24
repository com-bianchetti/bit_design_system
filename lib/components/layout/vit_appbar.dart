import 'package:vit_design_system/components/text/vit_text.dart';
import 'package:vit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A customizable app bar widget that provides consistent styling
/// and flexible behavior across the design system.
///
/// The [VitAppBar] is designed to be highly customizable while maintaining
/// design consistency. It can display a title, leading and trailing actions,
/// custom widgets, and automatically handles safe areas and borders.
///
/// ## Usage
///
/// ### Basic app bar with title and back button
///
/// ```dart
/// VitAppBar(
///   title: 'Page Title',
///   onLeadingPressed: () => Navigator.pop(context),
/// )
/// ```
///
/// ### App bar with custom actions
///
/// ```dart
/// VitAppBar(
///   title: 'Settings',
///   onLeadingPressed: () => Navigator.pop(context),
///   trailing: [
///     IconButton(
///       icon: Icon(Icons.search),
///       onPressed: () {},
///     ),
///     IconButton(
///       icon: Icon(Icons.more_vert),
///       onPressed: () {},
///     ),
///   ],
/// )
/// ```
///
/// ### App bar with custom leading widget
///
/// ```dart
/// VitAppBar(
///   leading: IconButton(
///     icon: Icon(Icons.menu),
///     onPressed: () {},
///   ),
///   title: 'Menu',
/// )
/// ```
///
/// ### App bar without border
///
/// ```dart
/// VitAppBar(
///   title: 'Clean Look',
///   showBorder: false,
/// )
/// ```
///
/// ## Customization
///
/// - Use [title] to set the app bar title text
/// - Use [titleWidget] for a completely custom title widget
/// - Use [leading] to provide a custom leading widget
/// - Use [onLeadingPressed] to show a default back button with custom action
/// - Use [leadingIcon] to customize the default leading icon
/// - Use [trailing] to add action buttons or widgets at the end
/// - Use [backgroundColor] to customize the background color
/// - Use [foregroundColor] to customize text and icon colors
/// - Use [showBorder] to toggle the bottom border
/// - Use [borderColor] and [borderWidth] to customize the border
/// - Use [padding] to adjust internal spacing
/// - Use [height] to set a specific height
/// - Use [centerTitle] to center the title text
/// - Use [elevation] to add shadow elevation
/// - Use [showLeading] to hide the leading widget
class VitAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The title text to display in the app bar.
  ///
  /// If both [title] and [titleWidget] are provided, [titleWidget] takes precedence.
  final String? title;

  /// Custom widget to display as the title.
  ///
  /// If provided, this takes precedence over [title].
  final Widget? titleWidget;

  /// Custom leading widget to display at the start of the app bar.
  ///
  /// If provided, this takes precedence over [onLeadingPressed].
  final Widget? leading;

  /// Callback invoked when the default leading button is pressed.
  ///
  /// When provided without [leading], displays a default back button.
  /// If both [leading] and [onLeadingPressed] are null, no leading widget is shown.
  final VoidCallback? onLeadingPressed;

  /// Icon to display in the default leading button.
  ///
  /// Defaults to [Icons.arrow_back].
  /// Only used when [onLeadingPressed] is provided and [leading] is null.
  final IconData leadingIcon;

  /// List of widgets to display at the end of the app bar.
  ///
  /// Typically used for action buttons like search, menu, or settings.
  final List<Widget>? trailing;

  /// Background color of the app bar.
  ///
  /// If null, uses the theme's background color.
  final Color? backgroundColor;

  /// Foreground color for text and icons.
  ///
  /// If null, uses the theme's text color.
  final Color? foregroundColor;

  /// Whether to show a bottom border.
  ///
  /// Defaults to true.
  final bool showBorder;

  /// Color of the bottom border.
  ///
  /// If null, uses the theme's border color.
  /// Only used when [showBorder] is true.
  final Color? borderColor;

  /// Width of the bottom border in logical pixels.
  ///
  /// Defaults to 1.0.
  /// Only used when [showBorder] is true.
  final double borderWidth;

  /// Explicit height for the app bar.
  ///
  /// If null, uses a default height that accounts for safe area.
  final double? height;

  /// Whether to center the title.
  ///
  /// Defaults to false, which aligns the title to the start.
  final bool centerTitle;

  /// Elevation of the app bar (shadow depth).
  ///
  /// If null or 0, no shadow is displayed.
  final double? elevation;

  /// Whether to show the leading widget.
  ///
  /// Defaults to true. Set to false to hide the leading widget entirely.
  final bool showLeading;

  /// Semantic label for the leading button for accessibility.
  ///
  /// If null and [onLeadingPressed] is provided, uses 'Back' as the default.
  final String? leadingSemanticLabel;

  /// Text style for the title.
  ///
  /// If null, uses the theme's title style with bold weight.
  final TextStyle? titleStyle;

  /// Spacing between the leading widget and title.
  ///
  /// Defaults to 16.0 logical pixels.
  final double leadingTitleSpacing;

  /// Whether to make the title bold.
  ///
  /// Defaults to true.
  final bool boldTitle;

  /// Optional widget to display at the bottom of the app bar.
  ///
  /// It must implement [PreferredSizeWidget]. Typically used for tabs
  /// or other fixed widgets right below the title layer.
  final PreferredSizeWidget? bottomWidget;

  /// Creates a [VitAppBar].
  ///
  /// At least one of [title] or [titleWidget] should be provided for best UX.
  const VitAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.leading,
    this.onLeadingPressed,
    this.leadingIcon = Icons.arrow_back,
    this.trailing,
    this.backgroundColor,
    this.foregroundColor,
    this.showBorder = true,
    this.borderColor,
    this.borderWidth = 1.0,
    this.height,
    this.centerTitle = false,
    this.elevation,
    this.showLeading = true,
    this.leadingSemanticLabel,
    this.titleStyle,
    this.leadingTitleSpacing = 16.0,
    this.boldTitle = true,
    this.bottomWidget,
  });

  @override
  Size get preferredSize {
    final baseHeight = height ?? kToolbarHeight;
    final bottomHeight = bottomWidget?.preferredSize.height ?? 0.0;
    return Size.fromHeight(baseHeight + bottomHeight);
  }

  Widget? _buildLeadingWidget(BuildContext context) {
    if (!showLeading) {
      return const SizedBox.shrink();
    }

    if (leading != null) {
      return leading;
    }

    if (onLeadingPressed != null) {
      return Semantics(
        label: leadingSemanticLabel ?? 'Back',
        button: true,
        child: IconButton(
          onPressed: onLeadingPressed,
          icon: Icon(
            leadingIcon,
            color: foregroundColor ?? context.theme.onBackrgroundColor,
          ),
        ),
      );
    }

    return null;
  }

  Widget? _buildTitleWidget(BuildContext context) {
    if (titleWidget != null) {
      return titleWidget;
    }

    if (title != null) {
      return VitTitle(
        title!,
        bold: boldTitle,
        style:
            titleStyle?.copyWith(color: foregroundColor) ??
            (foregroundColor != null
                ? TextStyle(color: foregroundColor)
                : null),
      );
    }

    return null;
  }

  List<Widget>? _buildTrailingWidgets() {
    if (trailing == null || trailing!.isEmpty) {
      return null;
    }

    return trailing;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final effectiveBackgroundColor = backgroundColor ?? theme.backgroundColor;
    final effectiveBorderColor = borderColor ?? theme.borderColor;

    return AppBar(
      leading: _buildLeadingWidget(context),
      automaticallyImplyLeading: false,
      title: _buildTitleWidget(context),
      leadingWidth: showLeading ? null : 0,
      centerTitle: centerTitle,
      actions: _buildTrailingWidgets(),
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: foregroundColor ?? theme.onBackrgroundColor,
      elevation: elevation ?? 0,
      shadowColor: elevation != null && elevation! > 0
          ? Colors.black.withValues(alpha: 0.1)
          : null,
      surfaceTintColor: Colors.transparent,
      titleSpacing: showLeading && (leading != null || onLeadingPressed != null)
          ? leadingTitleSpacing
          : NavigationToolbar.kMiddleSpacing,
      toolbarHeight: height ?? kToolbarHeight,
      bottom: bottomWidget,
      shape: showBorder
          ? Border(
              bottom: BorderSide(
                color: effectiveBorderColor,
                width: borderWidth,
              ),
            )
          : null,
    );
  }
}
