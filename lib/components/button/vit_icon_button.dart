import 'package:vit_design_system/components/skeleton/vit_loading_scope.dart';
import 'package:vit_design_system/components/skeleton/vit_skeleton_shimmer.dart';
import 'package:vit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A customizable icon button widget that provides consistent styling
/// and interactive behavior across the design system.
///
/// The [VitIconButton] automatically handles press animations, sizing, and
/// accessibility features. It adapts to its parent layout and provides
/// flexible customization options for colors, dimensions, and behavior.
///
/// ## Usage
///
/// ```dart
/// VitIconButton(
///   icon: Icon(Icons.add),
///   onPressed: () {
///     print('Button pressed');
///   },
/// )
/// ```
///
/// ## Customization
///
/// - Use [backgroundColor] and [iconColor] to customize colors
/// - Use [size] to set a specific dimension
/// - Use [padding] to adjust internal spacing
/// - Use [borderRadius] to customize corner rounding
/// - Use [visualDensity] to control button size based on theme values
/// - Use [darkenFactor] to adjust the press animation intensity
class VitIconButton extends StatefulWidget {
  /// The icon to display on the button.
  ///
  /// This is the primary visual element shown to the user.
  final Widget icon;

  /// Callback function invoked when the button is pressed.
  ///
  /// This is called after the press animation completes.
  final VoidCallback onPressed;

  /// Whether the button is disabled.
  ///
  /// When true, the button should not respond to user interactions.
  /// Defaults to false.
  final bool isDisabled;

  /// Whether the button is in a skeleton loading state.
  ///
  /// When true, the button displays a shimmer skeleton effect while
  /// preserving its original layout and dimensions.
  ///
  /// This property also responds to [VitLoadingScope]. If a [VitLoadingScope]
  /// ancestor has [loading] set to true, this button will show skeleton
  /// loading even if [isLoading] is false.
  ///
  /// Defaults to false.
  final bool isLoading;

  /// Factor used to darken the button color when pressed.
  ///
  /// A value of 0.0 means no darkening, 1.0 means completely black.
  /// Defaults to 0.2.
  final double darkenFactor;

  /// Background color of the button.
  ///
  /// If null, uses a transparent or themed color based on context.
  final Color? backgroundColor;

  /// Foreground color of the icon.
  ///
  /// If null, uses the theme's on-primary color or on-background.
  final Color? iconColor;

  /// Explicit size for the button (both width and height).
  ///
  /// If null, the size is determined by [visualDensity].
  final double? size;

  /// Internal padding for the icon content.
  ///
  /// Defaults to EdgeInsets.zero.
  final EdgeInsetsGeometry padding;

  /// Visual density that controls the button's size.
  ///
  /// If null, uses the theme's visual density.
  final VisualDensity? visualDensity;

  /// Border radius for the button's corners.
  ///
  /// If null, uses the theme's border radius.
  final BorderRadius? borderRadius;

  /// Semantic label for accessibility.
  ///
  /// If null, uses tooltip or default accessible name.
  final String? semanticLabel;

  /// Accessibility hint describing what happens when the button is pressed.
  final String? hint;

  /// Tooltip text to show on long press or hover.
  final String? tooltip;

  /// Border color of the button.
  ///
  /// If null, does not show a border.
  final Color? borderColor;

  /// Border width of the button.
  ///
  /// Defaults to 1.0.
  final double borderWidth;

  /// Disabled background color of the button.
  ///
  /// If null, uses the theme's disabled color.
  final Color? disabledColor;

  /// Disabled color of the icon.
  ///
  /// If null, uses the theme's disabled color variant.
  final Color? disabledIconColor;

  /// Creates a [VitIconButton].
  ///
  /// The [icon] and [onPressed] parameters are required.
  const VitIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.darkenFactor = 0.2,
    this.backgroundColor,
    this.iconColor,
    this.size,
    this.padding = EdgeInsets.zero,
    this.visualDensity,
    this.borderRadius,
    this.semanticLabel,
    this.hint,
    this.tooltip,
    this.borderColor,
    this.borderWidth = 1.0,
    this.disabledColor,
    this.disabledIconColor,
  });

  @override
  State<VitIconButton> createState() => _VitIconButtonState();
}

class _VitIconButtonState extends State<VitIconButton> {
  final debounceDuration = const Duration(milliseconds: 500);
  int lastTimeClicked = 0;
  bool _isPressed = false;

  Color _getDarkerColor(Color color, double factor) {
    if (color == Colors.transparent) return Colors.black.withAlpha(26);
    int r = ((color.r * 255.0).round().clamp(0, 255) * (1 - factor))
        .round()
        .clamp(0, 255);
    int g = ((color.g * 255.0).round().clamp(0, 255) * (1 - factor))
        .round()
        .clamp(0, 255);
    int b = ((color.b * 255.0).round().clamp(0, 255) * (1 - factor))
        .round()
        .clamp(0, 255);
    return Color.fromARGB((color.a * 255.0).round().clamp(0, 255), r, g, b);
  }

  void _onTapDown(TapDownDetails _) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails _) {
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          _isPressed = false;
        });
      }
    });

    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - lastTimeClicked < debounceDuration.inMilliseconds) {
      return;
    }
    lastTimeClicked = now;
    widget.onPressed();
  }

  void _onTapCancel() {
    if (mounted) {
      setState(() {
        _isPressed = false;
      });
    }
  }

  double _getSize(VisualDensity density, BuildContext context) {
    if (widget.size != null) {
      return widget.size!;
    }

    final values = context.theme.values;
    return switch (density) {
      VisualDensity.comfortable => values.iconButtonComfortableSize,
      VisualDensity.standard => values.iconButtonStandardSize,
      VisualDensity.compact => values.iconButtonCompactSize,
      _ => values.iconButtonStandardSize,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final effectiveLoading =
        widget.isLoading || VitLoadingScope.isLoading(context);

    if (effectiveLoading) {
      final visualDensity = widget.visualDensity ?? theme.visualDensity;
      final size = _getSize(visualDensity, context);
      final borderRadius = widget.borderRadius ?? theme.borderRadius;

      return VitSkeletonShimmer(
        child: Container(
          width: size,
          height: size,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: theme.skeletonBaseColor,
            borderRadius: borderRadius,
            border: widget.borderColor != null
                ? Border.all(
                    color: theme.skeletonBaseColor,
                    width: widget.borderWidth,
                  )
                : null,
          ),
          child: Center(
            child: Opacity(
              opacity: 0,
              child: widget.icon,
            ),
          ),
        ),
      );
    }

    final baseColor = widget.backgroundColor ?? theme.primaryColor;
    final currentColor = widget.isDisabled
        ? widget.disabledColor ?? theme.disabledColor
        : _isPressed
        ? _getDarkerColor(baseColor, widget.darkenFactor)
        : baseColor;
    final visualDensity = widget.visualDensity ?? theme.visualDensity;
    final size = _getSize(visualDensity, context);
    final borderRadius =
        widget.borderRadius ??
        (context.theme.values.iconButtonGlobalRadius ?? theme.borderRadius);

    final child = Semantics(
      label: widget.semanticLabel ?? widget.tooltip,
      button: true,
      hint: widget.hint,
      excludeSemantics: true,
      child: GestureDetector(
        onTapDown: widget.isDisabled ? null : _onTapDown,
        onTapUp: widget.isDisabled ? null : _onTapUp,
        onTapCancel: widget.isDisabled ? null : _onTapCancel,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
          width: size,
          height: size,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: currentColor,
            borderRadius: borderRadius,
            border: widget.borderColor != null
                ? Border.all(
                    color: widget.borderColor!,
                    width: widget.borderWidth,
                  )
                : null,
          ),
          child: Center(
            child: IconTheme(
              data: IconThemeData(
                color: widget.isDisabled
                    ? widget.disabledIconColor ?? theme.cardVariantColor
                    : widget.iconColor ?? theme.onPrimaryColor,
              ),
              child: widget.icon,
            ),
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      return Tooltip(
        message: widget.tooltip!,
        child: child,
      );
    }

    return child;
  }
}
