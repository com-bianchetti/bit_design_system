import 'package:vit_design_system/vit_design_system.dart';
import 'package:vit_design_system/config/vit_values.dart';
import 'package:flutter/material.dart';

/// A loading overlay widget that displays a modal loading spinner that blocks user interaction.
///
/// [VitLoading] provides a non-dismissible modal overlay with a customizable loading spinner
/// that prevents navigation and user interaction until an async operation completes. The loading
/// spinner is centered on screen with a semi-transparent backdrop.
///
/// Features:
/// - Non-dismissible modal overlay that blocks navigation and interaction
/// - Centered loading spinner with customizable appearance
/// - Automatic dismissal when the provided Future completes
/// - Customizable spinner size, color, and stroke width
/// - Smooth fade transition animation
/// - Optional background color and opacity customization
/// - Can be used with any async operation
/// - Returns the result of the Future when complete
///
/// Example usages:
///
/// Basic loading with default spinner:
/// ```dart
/// final result = await VitLoading.show<String>(
///   context,
///   future: Future.delayed(
///     Duration(seconds: 2),
///     () => 'Operation completed',
///   ),
/// );
/// print(result);
/// ```
///
/// Loading with custom spinner size:
/// ```dart
/// await VitLoading.show(
///   context,
///   size: 60,
///   future: saveDataToServer(),
/// );
/// ```
///
/// Loading with custom spinner color:
/// ```dart
/// await VitLoading.show(
///   context,
///   color: Colors.blue,
///   future: fetchUserData(),
/// );
/// ```
///
/// Loading with custom stroke width:
/// ```dart
/// await VitLoading.show(
///   context,
///   strokeWidth: 6,
///   future: processImage(),
/// );
/// ```
///
/// Loading with custom background:
/// ```dart
/// await VitLoading.show(
///   context,
///   backgroundColor: Colors.black87,
///   future: uploadFile(),
/// );
/// ```
///
/// Loading with visual density customization:
/// ```dart
/// await VitLoading.show(
///   context,
///   visualDensity: VisualDensity.comfortable,
///   future: loadData(),
/// );
/// ```
///
/// See the constructor and parameter documentation for more customization options.
class VitLoading extends StatelessWidget {
  /// The size of the loading spinner.
  ///
  /// If null, uses the size based on [visualDensity] from theme values.
  /// - [VisualDensity.comfortable]: 60 pixels
  /// - [VisualDensity.standard]: 50 pixels
  /// - [VisualDensity.compact]: 40 pixels
  final double? size;

  /// The color of the loading spinner.
  ///
  /// If null, uses the theme's primary color.
  final Color? color;

  /// The width of the spinner's circular stroke.
  ///
  /// If null, uses the stroke width based on [visualDensity].
  /// - [VisualDensity.comfortable]: 5 pixels
  /// - [VisualDensity.standard]: 4 pixels
  /// - [VisualDensity.compact]: 3 pixels
  final double? strokeWidth;

  /// Visual density that controls the spinner's default size and stroke width.
  ///
  /// If null, uses the theme's visual density.
  /// - [VisualDensity.comfortable]: Larger spinner (60px, 5px stroke)
  /// - [VisualDensity.standard]: Standard spinner (50px, 4px stroke)
  /// - [VisualDensity.compact]: Smaller spinner (40px, 3px stroke)
  ///
  /// Only applies when [size] or [strokeWidth] are null.
  final VisualDensity? visualDensity;

  /// Background color of the modal overlay.
  ///
  /// Defaults to a semi-transparent black (Colors.black54).
  final Color? backgroundColor;

  /// Creates a [VitLoading] with configurable spinner appearance.
  ///
  /// All parameters are optional and have sensible defaults based on the theme.
  ///
  /// For most use cases, prefer using [VitLoading.show] to display the loading
  /// overlay modally rather than constructing it directly.
  const VitLoading({
    super.key,
    this.size,
    this.color,
    this.strokeWidth,
    this.visualDensity,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final effectiveVisualDensity = visualDensity ?? theme.visualDensity;

    final effectiveSize =
        size ?? _getDefaultSize(theme.values, effectiveVisualDensity);
    final effectiveStrokeWidth =
        strokeWidth ??
        _getDefaultStrokeWidth(theme.values, effectiveVisualDensity);
    final effectiveColor = color ?? theme.primaryColor;
    final effectiveBackgroundColor = backgroundColor ?? Colors.black54;

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: effectiveBackgroundColor,
      child: Center(
        child: SizedBox(
          width: effectiveSize,
          height: effectiveSize,
          child: CircularProgressIndicator(
            strokeWidth: effectiveStrokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
          ),
        ),
      ),
    );
  }

  double _getDefaultSize(VitValues values, VisualDensity density) {
    return switch (density) {
      VisualDensity.compact => values.loadingCompactSize,
      VisualDensity.comfortable => values.loadingComfortableSize,
      _ => values.loadingStandardSize,
    };
  }

  double _getDefaultStrokeWidth(VitValues values, VisualDensity density) {
    return switch (density) {
      VisualDensity.compact => values.loadingCompactStrokeWidth,
      VisualDensity.comfortable => values.loadingComfortableStrokeWidth,
      _ => values.loadingStandardStrokeWidth,
    };
  }

  /// Displays a non-dismissible loading overlay and waits for the provided Future to complete.
  ///
  /// The loading overlay appears with a centered spinner and blocks all user interaction
  /// and navigation. The overlay is automatically dismissed when [future] completes, and
  /// the result of the Future is returned.
  ///
  /// This is useful for operations that require blocking the UI until completion, such as:
  /// - Saving data to a server
  /// - Processing large files
  /// - Loading critical application data
  /// - Performing authentication
  ///
  /// Parameters:
  /// - [context]: The build context for showing the modal
  /// - [future]: Required async operation to wait for completion
  /// - [size]: Custom spinner size (default: based on visualDensity)
  /// - [color]: Custom spinner color (default: theme's primary color)
  /// - [strokeWidth]: Custom spinner stroke width (default: based on visualDensity)
  /// - [visualDensity]: Controls default size and stroke width
  /// - [backgroundColor]: Custom overlay background color (default: Colors.black54)
  ///
  /// Returns a [Future] that completes with the result of [future] when the operation
  /// finishes and the loading overlay is dismissed.
  ///
  /// Example:
  /// ```dart
  /// final userData = await VitLoading.show<User>(
  ///   context,
  ///   future: fetchUserData(),
  /// );
  /// print('User loaded: ${userData.name}');
  /// ```
  static Future<T?> show<T>({
    required BuildContext context,
    required Future<T> future,
    double? size,
    Color? color,
    double? strokeWidth,
    VisualDensity? visualDensity,
    Color? backgroundColor,
  }) async {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "",
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: VitLoading(
              size: size,
              color: color,
              strokeWidth: strokeWidth,
              visualDensity: visualDensity,
              backgroundColor: backgroundColor,
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: anim1, curve: Curves.easeInOut),
          child: child,
        );
      },
    );

    try {
      final result = await future;
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      } else {
        Future.delayed(const Duration(milliseconds: 2000), () {
          if (context.mounted) {
            Navigator.of(context, rootNavigator: true).pop();
          }
        });
      }
      return result;
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      } else {
        Future.delayed(const Duration(milliseconds: 2000), () {
          if (context.mounted) {
            Navigator.of(context, rootNavigator: true).pop();
          }
        });
      }
      rethrow;
    }
  }
}
