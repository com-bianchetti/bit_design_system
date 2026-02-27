import 'package:vit_design_system/vit_design_system.dart';
import 'package:vit_design_system/components/button/vit_button_dock.dart';
import 'package:flutter/material.dart';

/// A centered dialog widget that displays modal content with a constrained width on larger screens.
///
/// [VitDialog] provides a flexible and customizable container for displaying modal content that automatically
/// centers on screen and adapts to different screen sizes. On mobile devices (width < 600px), it takes up 90%
/// of the screen width, while on larger screens it defaults to a maximum width of 600px. The dialog appears
/// with smooth fade and scale animations for a polished user experience.
///
/// Features:
/// - Centered positioning on screen with responsive width constraints
/// - Automatic width adaptation for mobile and desktop displays
/// - Optional header with title and action buttons or custom header widget
/// - Scrollable content area with customizable padding for long content
/// - Optional footer with custom content or default confirm/cancel buttons
/// - Built-in default footer with configurable button text and callbacks
/// - Dismissible via barrier tap or programmatically
/// - Smooth fade and scale transition animations
/// - Integrates with scroll controllers for advanced scroll management
/// - Supports custom headers and footers for flexible layouts
/// - Returns typed results via Future for handling user actions
///
/// Example usages:
///
/// Quick success dialog:
/// ```dart
/// VitDialog.success(
///   context,
///   message: 'Your changes have been saved successfully.',
/// )
/// ```
///
/// Quick error dialog:
/// ```dart
/// VitDialog.error(
///   context,
///   message: 'Failed to save your changes. Please try again.',
/// )
/// ```
///
/// Quick confirmation dialog:
/// ```dart
/// final result = await VitDialog.confirm(
///   context,
///   message: 'Are you sure you want to delete this item?',
///   onConfirm: () {
///     print('User confirmed');
///   },
/// );
/// ```
///
/// Basic dialog with title and content:
/// ```dart
/// VitDialog.show(
///   context,
///   title: Text('Notification'),
///   content: Text('Your changes have been saved successfully.'),
/// )
/// ```
///
/// Dialog with default footer buttons:
/// ```dart
/// final result = await VitDialog.show<bool>(
///   context,
///   title: Text('Confirm Delete'),
///   showDefaultFooter: true,
///   onConfirm: () {
///     print('User confirmed');
///   },
///   onCancel: () {
///     print('User cancelled');
///   },
///   content: Text('Are you sure you want to delete this item?'),
/// );
/// if (result == true) {
///   print('User clicked confirm');
/// }
/// ```
///
/// Dialog with custom footer:
/// ```dart
/// VitDialog.show(
///   context,
///   title: Text('Choose Action'),
///   content: Text('Select one of the options below'),
///   footer: VitButtonContainer(
///     top: [
///       VitButton(
///         text: 'Primary',
///         onPressed: () => Navigator.pop(context),
///       ),
///     ],
///     middle: [
///       VitSecondaryButton(
///         text: 'Secondary',
///         onPressed: () => Navigator.pop(context),
///       ),
///     ],
///     bottom: [
///       VitOutlinedButton(
///         text: 'Cancel',
///         onPressed: () => Navigator.pop(context),
///       ),
///     ],
///   ),
/// )
/// ```
///
/// Dialog with scrollable long content:
/// ```dart
/// VitDialog.show(
///   context,
///   title: Text('Terms and Conditions'),
///   maxHeight: 500,
///   content: Column(
///     children: [
///       Text('Very long terms and conditions text...'),
///       Text('More content...'),
///       Text('Even more content...'),
///     ],
///   ),
///   showDefaultFooter: true,
///   onConfirm: () {},
///   confirmText: 'I Accept',
/// )
/// ```
///
/// Non-dismissible dialog for critical actions:
/// ```dart
/// VitDialog.show(
///   context,
///   title: Text('Critical Warning'),
///   content: Text('This action cannot be undone.'),
///   isDismissible: false,
///   showDefaultFooter: true,
///   onConfirm: () {
///     performCriticalAction();
///   },
///   confirmText: 'I Understand',
/// )
/// ```
///
/// Custom width dialog:
/// ```dart
/// VitDialog.show(
///   context,
///   title: Text('Narrow Dialog'),
///   maxWidth: 400,
///   content: Text('This dialog has a custom width.'),
/// )
/// ```
///
/// Dialog without header:
/// ```dart
/// VitDialog.show(
///   context,
///   showCloseButton: false,
///   content: Column(
///     children: [
///       Icon(Icons.check_circle, size: 64, color: Colors.green),
///       SizedBox(height: 16),
///       Text('Success!', style: TextStyle(fontSize: 24)),
///       SizedBox(height: 8),
///       Text('Your operation completed successfully.'),
///     ],
///   ),
///   showDefaultFooter: true,
///   onConfirm: () {},
///   confirmText: 'Got it',
/// )
/// ```
///
/// See the constructor and parameter documentation for more customization options.
class VitDialog extends StatefulWidget {
  /// Optional custom widget rendered at the top of the dialog.
  ///
  /// When provided, this widget replaces the default header and is displayed
  /// above the content. Commonly used for custom headers with specific styling
  /// or complex layouts. If null, a default header with [title] and [actions]
  /// is shown instead.
  final Widget? header;

  /// Optional custom widget rendered at the bottom of the dialog.
  ///
  /// Used for action buttons, summaries, or persistent controls. When provided,
  /// it replaces the default footer. The footer is always positioned below the
  /// scrollable content area. Padding is controlled by [footerPadding].
  final Widget? footer;

  /// The main content displayed inside the dialog body.
  ///
  /// This is the primary scrollable area of the dialog. The content is wrapped
  /// in a scrollable view with padding controlled by [contentPadding]. This
  /// parameter is required.
  final Widget content;

  /// Optional scroll controller for the dialog's scrollable content.
  ///
  /// Allows external control of scrolling behavior and position. If null,
  /// an internal controller is used. Useful for implementing scroll-to-top
  /// functionality or synchronizing scroll states.
  final ScrollController? scrollController;

  /// The title widget displayed in the default header when [header] is null.
  ///
  /// Typically a [Text] widget, but can be any widget. The alignment is
  /// controlled by [centerTitle]. If both [header] and [title] are null,
  /// only action buttons are shown in the header.
  final Widget? title;

  /// Whether to center the [title] inside the default header.
  ///
  /// When true, the title is centered horizontally. When false, it aligns
  /// to the start (left in LTR layouts). Defaults to true. Only applies
  /// when [header] is null.
  final bool centerTitle;

  /// Whether to display the default close button in the header.
  ///
  /// Only applies when [header] is null and [actions] is null. The close button
  /// is an X icon that dismisses the dialog when tapped. Defaults to true.
  final bool showCloseButton;

  /// Custom action widgets placed in the header when [header] is null.
  ///
  /// These widgets are displayed on the trailing side of the default header.
  /// Common use cases include share buttons, edit buttons, or other contextual
  /// actions. If provided, [showCloseButton] is ignored.
  final List<Widget>? actions;

  /// Padding applied around the [content] area.
  ///
  /// Controls the internal spacing around the main content. Defaults to
  /// symmetric padding of 24 horizontal and 20 vertical pixels. This does
  /// not affect [header] or [footer] padding.
  final EdgeInsets contentPadding;

  /// Padding applied around the [footer] when it is displayed.
  ///
  /// Controls spacing around the footer widget. Defaults to symmetric padding
  /// of 24 horizontal and 16 vertical pixels. Applied to both custom and
  /// default footers.
  final EdgeInsets footerPadding;

  /// Padding applied around the default header.
  ///
  /// Controls spacing around the header content including title and actions.
  /// Defaults to symmetric padding of 24 horizontal and 16 vertical pixels.
  /// Only applies when using the default header (when [header] is null).
  final EdgeInsets headerPadding;

  /// Whether the [footer] stays pinned at the bottom of the dialog.
  ///
  /// Currently always true in the implementation. The footer is always
  /// positioned below the scrollable content. Defaults to true.
  final bool fixedFooter;

  /// Whether tapping outside the dialog dismisses it.
  ///
  /// When true, tapping the barrier (darkened area outside the dialog) closes
  /// the dialog. When false, the dialog must be dismissed programmatically or
  /// via action buttons. Defaults to true.
  final bool isDismissible;

  /// Maximum width constraint for the dialog.
  ///
  /// On screens wider than 600px, defaults to 600 pixels. On smaller screens,
  /// defaults to 90% of the screen width. Set this to customize the dialog
  /// width for specific use cases.
  final double? maxWidth;

  /// Maximum height constraint for the dialog.
  ///
  /// Defaults to 80% of the screen height. The content area will scroll if
  /// it exceeds this height. Set this to customize the maximum height for
  /// specific content requirements.
  final double? maxHeight;

  /// Custom border radius applied to the dialog container.
  ///
  /// Overrides the default rounded corners from the theme. Useful for
  /// creating custom dialog styles or matching specific design requirements.
  /// If null, uses the theme's border radius.
  final BorderRadiusGeometry? borderRadius;

  /// Callback executed when the confirm button in the default footer is pressed.
  ///
  /// Only used when [showDefaultFooter] is true. The callback is executed
  /// before the dialog is dismissed with a result of `true`. Use this to
  /// perform actions or validations before closing.
  final VoidCallback? onConfirm;

  /// Callback executed when the cancel button in the default footer is pressed.
  ///
  /// Only used when [showDefaultFooter] is true. The callback is executed
  /// before the dialog is dismissed with a result of `false`. Use this to
  /// perform cleanup or reset actions before closing.
  final VoidCallback? onCancel;

  /// Custom text for the confirm button in the default footer.
  ///
  /// Defaults to 'Confirm'. Only used when [showDefaultFooter] is true and
  /// [onConfirm] is provided. Allows localization or context-specific labels
  /// like 'OK', 'Save', 'Submit', etc.
  final String? confirmText;

  /// Custom text for the cancel button in the default footer.
  ///
  /// Defaults to 'Cancel'. Only used when [showDefaultFooter] is true and
  /// [onCancel] is provided. Allows localization or context-specific labels
  /// like 'Dismiss', 'Close', 'Back', etc.
  final String? cancelText;

  /// Custom background color for the confirm button in the default footer.
  ///
  /// Only used when [showDefaultFooter] is true and [onConfirm] is provided.
  final Color? buttonBackground;

  /// Whether to show the default footer with confirm and cancel buttons.
  ///
  /// When true, displays a footer with confirm and/or cancel buttons based
  /// on the provided [onConfirm] and [onCancel] callbacks. Buttons are
  /// organized using [VitButtonContainer]. Defaults to false. If [footer]
  /// is provided, this setting is ignored.
  final bool showDefaultFooter;

  /// Creates a [VitDialog] with configurable layout, content, and behavior options.
  ///
  /// The [content] parameter is required and represents the main body of the dialog.
  /// All other parameters are optional and provide fine-grained control over the
  /// dialog's appearance and behavior.
  ///
  /// For most use cases, prefer using [VitDialog.show] to display the dialog modally
  /// rather than constructing it directly.
  ///
  /// See class documentation and individual parameter documentation for detailed
  /// information about each configuration option.
  const VitDialog({
    super.key,
    this.header,
    this.footer,
    required this.content,
    this.scrollController,
    this.title,
    this.centerTitle = true,
    this.showCloseButton = true,
    this.actions,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 20,
    ),
    this.footerPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    this.headerPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    this.fixedFooter = true,
    this.isDismissible = true,
    this.maxWidth,
    this.maxHeight,
    this.borderRadius,
    this.onConfirm,
    this.onCancel,
    this.confirmText,
    this.cancelText,
    this.buttonBackground,
    this.showDefaultFooter = false,
  });

  @override
  State<VitDialog> createState() => _VitDialogState();

  /// Displays the dialog modally, centered on screen with responsive width constraints.
  ///
  /// The dialog appears centered on screen with a fade and scale animation. On mobile
  /// devices (width < 600px), it takes up 90% of the screen width. On larger screens,
  /// it defaults to a maximum width of 600px (customizable via [maxWidth]). The dialog
  /// height is constrained to 80% of the screen height (customizable via [maxHeight]),
  /// with the content area becoming scrollable when content exceeds this height.
  ///
  /// The dialog is rendered with a semi-transparent black barrier that can dismiss the
  /// dialog when tapped if [isDismissible] is true. Smooth fade and scale transitions
  /// provide a polished appearance on show and dismiss.
  ///
  /// Parameters:
  /// - [context]: The build context for showing the modal
  /// - [content]: Required main content widget
  /// - [header]: Optional custom header widget (replaces default header)
  /// - [footer]: Optional footer widget for actions or summaries
  /// - [title]: Title shown in default header when header is null
  /// - [centerTitle]: Center the title in header (default: true)
  /// - [showCloseButton]: Show default X button in header (default: true)
  /// - [actions]: Custom action buttons in default header
  /// - [scrollController]: Optional external scroll controller
  /// - [contentPadding]: Padding around content (default: 24h, 20v)
  /// - [footerPadding]: Padding around footer (default: 24h, 16v)
  /// - [headerPadding]: Padding around header (default: 24h, 16v)
  /// - [fixedFooter]: Keep footer pinned at bottom (default: true)
  /// - [isDismissible]: Allow dismissal by tapping outside (default: true)
  /// - [maxWidth]: Maximum width constraint (default: 600px on desktop, 90% on mobile)
  /// - [maxHeight]: Maximum height constraint (default: 80% of screen height)
  /// - [borderRadius]: Custom border radius (default: theme border radius)
  /// - [showDefaultFooter]: Show default confirm/cancel footer (default: false)
  /// - [onConfirm]: Callback for confirm button in default footer
  /// - [onCancel]: Callback for cancel button in default footer
  /// - [confirmText]: Custom text for confirm button (default: 'Confirm')
  /// - [cancelText]: Custom text for cancel button (default: 'Cancel')
  ///
  /// Returns a [Future] that completes when the dialog is dismissed, with an
  /// optional result value of type [T] that can be passed via Navigator.pop(context, result).
  /// When using the default footer, the result is `true` for confirm and `false` for cancel.
  static Future<T?> show<T>(
    BuildContext context, {
    Widget? header,
    Widget? footer,
    required Widget content,
    ScrollController? scrollController,
    Widget? title,
    bool centerTitle = true,
    bool showCloseButton = true,
    List<Widget>? actions,
    EdgeInsets contentPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 20,
    ),
    EdgeInsets footerPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    EdgeInsets headerPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    bool fixedFooter = true,
    bool isDismissible = true,
    double? maxWidth,
    double? maxHeight,
    BorderRadiusGeometry? borderRadius,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String? confirmText,
    String? cancelText,
    Color? buttonBackground,
    bool showDefaultFooter = false,
  }) async {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: isDismissible,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: VitDialog(
              header: header,
              footer: footer,
              content: content,
              scrollController: scrollController,
              title: title,
              centerTitle: centerTitle,
              showCloseButton: showCloseButton,
              actions: actions,
              contentPadding: contentPadding,
              footerPadding: footerPadding,
              headerPadding: headerPadding,
              fixedFooter: fixedFooter,
              isDismissible: isDismissible,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              borderRadius: borderRadius,
              onConfirm: onConfirm,
              onCancel: onCancel,
              confirmText: confirmText,
              cancelText: cancelText,
              buttonBackground: buttonBackground,
              showDefaultFooter: showDefaultFooter,
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: anim1, curve: Curves.easeInOut),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(parent: anim1, curve: Curves.easeInOut),
            ),
            child: child,
          ),
        );
      },
    );
  }

  /// Displays a success dialog with a check icon, title, and message.
  ///
  /// This is a convenience method for showing success messages with consistent styling.
  /// The dialog includes a green check circle icon, customizable title and message,
  /// and a single confirmation button.
  ///
  /// Parameters:
  /// - [context]: The build context for showing the modal
  /// - [title]: The success title text (default: 'Success!')
  /// - [message]: The success message text (required)
  /// - [buttonText]: Custom text for the confirmation button (default: 'Got it')
  /// - [onConfirm]: Optional callback executed when the button is pressed
  /// - [isDismissible]: Allow dismissal by tapping outside (default: true)
  /// - [maxWidth]: Maximum width constraint (default: 600px on desktop, 90% on mobile)
  ///
  /// Returns a [Future] that completes when the dialog is dismissed.
  ///
  /// Example:
  /// ```dart
  /// VitDialog.success(
  ///   context,
  ///   message: 'Your changes have been saved successfully.',
  /// );
  /// ```
  static Future<T?> success<T>(
    BuildContext context, {
    String title = 'Success!',
    required String message,
    String buttonText = 'Got it',
    Color? buttonBackground,
    VoidCallback? onConfirm,
    bool isDismissible = true,
    double? maxWidth,
  }) {
    return show<T>(
      context,
      showCloseButton: false,
      showDefaultFooter: true,
      onConfirm: onConfirm,
      confirmText: buttonText,
      buttonBackground: buttonBackground,
      isDismissible: isDismissible,
      maxWidth: maxWidth,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 64,
            color: context.theme.successColor,
          ),
          const SizedBox(height: 16),
          VitTitle(title),
          const SizedBox(height: 16),
          VitText(
            message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Displays an error dialog with an error icon, title, and message.
  ///
  /// This is a convenience method for showing error messages with consistent styling.
  /// The dialog includes a red error icon, customizable title and message,
  /// and a single confirmation button.
  ///
  /// Parameters:
  /// - [context]: The build context for showing the modal
  /// - [title]: The error title text (default: 'Error')
  /// - [message]: The error message text (required)
  /// - [buttonText]: Custom text for the confirmation button (default: 'Got it')
  /// - [onConfirm]: Optional callback executed when the button is pressed
  /// - [isDismissible]: Allow dismissal by tapping outside (default: true)
  /// - [maxWidth]: Maximum width constraint (default: 600px on desktop, 90% on mobile)
  ///
  /// Returns a [Future] that completes when the dialog is dismissed.
  ///
  /// Example:
  /// ```dart
  /// VitDialog.error(
  ///   context,
  ///   message: 'Failed to save your changes. Please try again.',
  /// );
  /// ```
  static Future<T?> error<T>(
    BuildContext context, {
    String title = 'Error',
    required String message,
    String buttonText = 'Got it',
    Color? buttonBackground,
    VoidCallback? onConfirm,
    bool isDismissible = true,
    double? maxWidth,
  }) {
    return show<T>(
      context,
      showCloseButton: false,
      showDefaultFooter: true,
      onConfirm: onConfirm,
      confirmText: buttonText,
      buttonBackground: buttonBackground,
      isDismissible: isDismissible,
      maxWidth: maxWidth,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: context.theme.errorColor,
          ),
          const SizedBox(height: 16),
          VitTitle(title),
          const SizedBox(height: 16),
          VitText(
            message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Displays a confirmation dialog with title, message, and confirm/cancel buttons.
  ///
  /// This is a convenience method for showing confirmation prompts with consistent styling.
  /// The dialog includes a customizable title and message, with both confirm and cancel buttons.
  ///
  /// Parameters:
  /// - [context]: The build context for showing the modal
  /// - [title]: The confirmation title text (default: 'Confirm Action')
  /// - [message]: The confirmation message text (required)
  /// - [confirmText]: Custom text for the confirm button (default: 'Confirm')
  /// - [cancelText]: Custom text for the cancel button (default: 'Cancel')
  /// - [onConfirm]: Optional callback executed when the confirm button is pressed
  /// - [onCancel]: Optional callback executed when the cancel button is pressed
  /// - [isDismissible]: Allow dismissal by tapping outside (default: true)
  /// - [maxWidth]: Maximum width constraint (default: 600px on desktop, 90% on mobile)
  ///
  /// Returns a [Future<bool?>] that completes with `true` when confirm is pressed,
  /// `false` when cancel is pressed, or `null` when dismissed.
  ///
  /// Example:
  /// ```dart
  /// final result = await VitDialog.confirm(
  ///   context,
  ///   message: 'Are you sure you want to delete this item?',
  ///   onConfirm: () {
  ///     deleteItem();
  ///   },
  /// );
  /// if (result == true) {
  ///   print('User confirmed');
  /// }
  /// ```
  static Future<bool?> confirm(
    BuildContext context, {
    String title = 'Confirm Action',
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    Color? buttonBackground,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool isDismissible = true,
    double? maxWidth,
  }) {
    return show<bool>(
      context,
      title: VitTitle(title),
      showDefaultFooter: true,
      onConfirm: onConfirm,
      onCancel: onCancel,
      confirmText: confirmText,
      cancelText: cancelText,
      buttonBackground: buttonBackground,
      isDismissible: isDismissible,
      maxWidth: maxWidth,
      content: VitText(message),
    );
  }
}

class _VitDialogState extends State<VitDialog> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  Widget _buildDefaultHeader() {
    return Container(
      padding: widget.headerPadding,
      decoration: BoxDecoration(
        color: context.theme.backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: context.theme.borderColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          if (widget.title != null)
            Expanded(
              child: widget.centerTitle
                  ? Center(child: widget.title!)
                  : widget.title!,
            ),
          if (widget.actions != null) ...widget.actions!,
          if (widget.showCloseButton && widget.actions == null)
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }

  Widget _buildDefaultFooter() {
    return Container(
      padding: widget.footerPadding,
      decoration: BoxDecoration(
        color: context.theme.backgroundColor,
        border: Border(
          top: BorderSide(
            color: context.theme.borderColor,
            width: 1,
          ),
        ),
      ),
      child: VitButtonContainer(
        middle: [
          if (widget.onCancel != null)
            VitOutlinedButton(
              text: widget.cancelText ?? 'Cancel',
              onPressed: () {
                widget.onCancel?.call();
                Navigator.pop(context, false);
              },
            ),
          if (widget.onConfirm != null)
            VitButton(
              text: widget.confirmText ?? 'Confirm',
              backgroundColor: widget.buttonBackground,
              onPressed: () {
                widget.onConfirm?.call();
                Navigator.pop(context, true);
              },
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final isSmallScreen = screenSize.width < 600;

    final dialogMaxWidth =
        widget.maxWidth ?? (isSmallScreen ? screenSize.width * 0.9 : 600.0);
    final dialogMaxHeight = widget.maxHeight ?? screenSize.height * 0.8;

    final effectiveBorderRadius =
        widget.borderRadius ?? context.theme.borderRadius;

    Widget dialogContent = Container(
      constraints: BoxConstraints(
        maxWidth: dialogMaxWidth,
        maxHeight: dialogMaxHeight,
      ),
      decoration: BoxDecoration(
        color: context.theme.backgroundColor,
        borderRadius: effectiveBorderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.header != null)
              widget.header!
            else if (widget.title != null ||
                widget.showCloseButton ||
                widget.actions != null)
              _buildDefaultHeader(),

            Flexible(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: widget.contentPadding,
                  child: widget.content,
                ),
              ),
            ),

            if (widget.footer != null)
              Padding(
                padding: widget.footerPadding,
                child: widget.footer!,
              )
            else if (widget.showDefaultFooter &&
                (widget.onConfirm != null || widget.onCancel != null))
              _buildDefaultFooter(),
          ],
        ),
      ),
    );

    return dialogContent;
  }
}
