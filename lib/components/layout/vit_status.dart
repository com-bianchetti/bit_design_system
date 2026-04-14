import 'package:flutter/material.dart';
import 'package:vit_design_system/vit_design_system.dart';

/// A component that acts as a customizable status message view.
///
/// Most commonly used for empty states, error screens, success messages,
/// or general full-page blocking notifications.
///
/// It displays a structured vertically-aligned layout with an icon,
/// a title, a brief text description, a primary action button, and an optional
/// secondary action button side-by-side or stacked (if constrained).
///
/// The design inherits predefined styles and responsive colors from the `VitTheme`.
class VitStatus extends StatelessWidget {
  /// The icon widget positioned at the top of the status.
  ///
  /// It can be a simple [Icon], an illustration widget, or an image.
  final Widget icon;

  /// The main heading title conveying the status intent.
  final String title;

  /// A descriptive text explaining the status or context to the user.
  final String text;

  /// Text label for the primary action button.
  final String actionText;

  /// Callback executed when the primary action button is pressed.
  final VoidCallback onActionPressed;

  /// Optional text label for the secondary action button.
  ///
  /// If provided, a secondary button will be rendered adjacent to the primary action.
  final String? secondaryActionText;

  /// Optional callback executed when the secondary action button is pressed.
  final VoidCallback? onSecondaryActionPressed;

  /// The main alignment of the children within the status column.
  ///
  /// Defaults to [MainAxisAlignment.center].
  final MainAxisAlignment mainAxisAlignment;

  /// Custom color for the title text.
  ///
  /// Defaults to [VitTheme.onBackrgroundColor].
  final Color? titleColor;

  /// Custom color for the description text.
  ///
  /// Defaults to [VitTheme.onBackgroundVariantColor].
  final Color? textColor;

  /// Text style for the [title].
  ///
  /// Defaults to [VitTheme.titleBig].
  final TextStyle? titleStyle;

  /// Text style for the [text].
  ///
  /// Defaults to [VitTheme.body].
  final TextStyle? textStyle;

  /// Determines if the action buttons should expand taking maximum available width.
  ///
  /// Defaults to `false`, wrapping the content.
  final bool expandButtons;

  /// Creates a [VitStatus] widget.
  const VitStatus({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
    required this.actionText,
    required this.onActionPressed,
    this.secondaryActionText,
    this.onSecondaryActionPressed,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.titleColor,
    this.textColor,
    this.titleStyle,
    this.textStyle,
    this.expandButtons = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    final Widget actionButtons = expandButtons
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (secondaryActionText != null) ...[
                VitSecondaryButton(
                  text: secondaryActionText!,
                  onPressed: onSecondaryActionPressed ?? () {},
                ),
                const SizedBox(width: 16),
              ],
              VitButton(
                text: actionText,
                onPressed: onActionPressed,
              ),
            ],
          )
        : Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              if (secondaryActionText != null)
                VitSecondaryButton(
                  text: secondaryActionText!,
                  onPressed: onSecondaryActionPressed ?? () {},
                ),
              VitButton(
                text: actionText,
                onPressed: onActionPressed,
              ),
            ],
          );

    return LayoutBuilder(
      builder: (context, constraints) {
        // If max width is extremely small, we might want to stack the buttons.
        // But for now we stick to a horizontal row.
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 24),
              VitText(
                title,
                textAlign: TextAlign.center,
                style: (titleStyle ?? theme.titleBig).copyWith(
                  color: titleColor ?? theme.onBackrgroundColor,
                ),
              ),
              const SizedBox(height: 8),
              VitText(
                text,
                textAlign: TextAlign.center,
                style: (textStyle ?? theme.body).copyWith(
                  color: textColor ?? theme.onBackgroundVariantColor,
                ),
              ),
              const SizedBox(height: 32),
              actionButtons,
            ],
          ),
        );
      },
    );
  }
}
