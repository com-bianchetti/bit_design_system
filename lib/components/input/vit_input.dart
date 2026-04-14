import 'package:vit_design_system/components/form/vit_form.dart';
import 'package:vit_design_system/components/skeleton/vit_loading_scope.dart';
import 'package:vit_design_system/components/skeleton/vit_skeleton_shimmer.dart';
import 'package:vit_design_system/components/text/vit_text.dart';
import 'package:vit_design_system/config/vit_types.dart';
import 'package:vit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable text input widget that provides consistent styling.
///
/// The [VitInput] is a flexible text input component based on [TextFormField]
/// with border and background styling controlled by theme configuration.
///
/// ## Usage
///
/// ### Basic Input
///
/// ```dart
/// VitInput(
///   label: 'Email',
///   hintText: 'Enter your email',
///   onChanged: (value) {
///     print('Input changed to: $value');
///   },
/// )
/// ```
///
/// ### Input with Controller
///
/// ```dart
/// final controller = TextEditingController();
///
/// VitInput(
///   controller: controller,
///   label: 'Password',
///   obscureText: true,
///   trailing: Icon(Icons.visibility),
/// )
/// ```
///
/// ### Input with Validation
///
/// ```dart
/// VitInput(
///   label: 'Username',
///   validator: (value) {
///     if (value == null || value.isEmpty) {
///       return 'Please enter a username';
///     }
///     return null;
///   },
/// )
/// ```
///
/// ### Input with Leading and Trailing Widgets
///
/// ```dart
/// VitInput(
///   label: 'Search',
///   leading: Icon(Icons.search),
///   trailing: IconButton(
///     icon: Icon(Icons.clear),
///     onPressed: () => controller.clear(),
///   ),
/// )
/// ```
///
/// ## Customization
///
/// - Use [label] to add a floating or fixed label
/// - Use [hintText] for placeholder text
/// - Use [leading] and [trailing] for icons or widgets
/// - Use [validator] for form validation
/// - Use [obscureText] for password inputs
/// - Use [maxLines] for multiline inputs
/// - Use [enabled] to disable the input
class VitInput extends StatefulWidget {
  /// The controller for the text field.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? controller;

  /// The initial value of the text field.
  ///
  /// This is only used when [controller] is null.
  final String? initialValue;

  /// The label text displayed above or inside the input.
  final String? label;

  /// The hint text displayed when the input is empty.
  final String? hintText;

  /// The helper text displayed below the input.
  final String? helperText;

  /// The error text displayed below the input when validation fails.
  final String? errorText;

  /// Widget displayed before the input field.
  final Widget? leading;

  /// Widget displayed after the input field.
  final Widget? trailing;

  /// Callback function invoked when the input value changes.
  final ValueChanged<String>? onChanged;

  /// Callback function invoked when the input is submitted.
  final ValueChanged<String>? onSubmitted;

  /// Validator function for form validation.
  ///
  /// Returns an error message if validation fails, or null if valid.
  final FormFieldValidator<String>? validator;

  /// Whether to obscure the text (for passwords).
  final bool obscureText;

  /// The keyboard type for the input.
  final TextInputType? keyboardType;

  /// The text capitalization behavior.
  final TextCapitalization textCapitalization;

  /// The maximum number of lines for the input.
  ///
  /// If null, defaults to 1 (single line).
  /// Set to null explicitly for unlimited lines.
  final int? maxLines;

  /// The minimum number of lines for the input.
  final int? minLines;

  /// The maximum length of the input.
  final int? maxLength;

  /// Whether to show the character counter.
  final bool showCounter;

  /// Whether the input is enabled.
  final bool enabled;

  /// Whether the input is read-only.
  final bool readOnly;

  /// Whether to autofocus the input.
  final bool autofocus;

  /// The text style for the input.
  final TextStyle? style;

  /// The text style for the label.
  final TextStyle? labelStyle;

  /// The text style for the hint.
  final TextStyle? hintStyle;

  /// The text style for the error text.
  final TextStyle? errorStyle;

  /// The text style for the helper text.
  final TextStyle? helperStyle;

  /// The background color of the input.
  ///
  /// If null, uses the theme's card color when [showBackground] is true.
  final Color? backgroundColor;

  /// The border color of the input.
  ///
  /// If null, uses the theme's border color.
  final Color? borderColor;

  /// The focused border color of the input.
  ///
  /// If null, uses the theme's primary color.
  final Color? focusedBorderColor;

  /// The error border color of the input.
  ///
  /// If null, uses the theme's error color.
  final Color? errorBorderColor;

  /// The border radius of the input.
  ///
  /// If null, uses the theme's border radius.
  final BorderRadius? borderRadius;

  /// The content padding of the input.
  ///
  /// Defaults to symmetric horizontal padding of 16 and vertical padding of 12.
  final EdgeInsets? contentPadding;

  /// The text alignment of the input.
  final TextAlign textAlign;

  /// The input formatters for the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// The focus node for the input.
  final FocusNode? focusNode;

  /// The text input action.
  final TextInputAction? textInputAction;

  /// Callback invoked when editing is complete.
  final VoidCallback? onEditingComplete;

  /// Callback invoked when the input is tapped.
  final VoidCallback? onTap;

  /// Whether to enable suggestions.
  final bool enableSuggestions;

  /// Whether to enable autocorrect.
  final bool autocorrect;

  /// The cursor color.
  final Color? cursorColor;

  /// The cursor width.
  final double cursorWidth;

  /// The cursor height.
  final double? cursorHeight;

  /// The cursor radius.
  final Radius? cursorRadius;

  /// Semantic label for accessibility.
  final String? semanticLabel;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map.
  final String? id;

  /// The input mode.
  ///
  /// If null, uses the theme's input mode.
  /// Input mode determines whether the label is displayed
  /// above, inside or not displayed at all.
  final VitInputMode? inputMode;

  /// The style for the input label.
  ///
  /// If null, uses the theme's input label style.
  /// Only applies when [inputMode] is [VitInputMode.fixedLabel].
  final TextStyle? inputLabelStyle;

  /// The visual density of the input.
  ///
  /// If null, uses the theme's visual density.
  final VisualDensity? visualDensity;

  /// Whether to enable interactive selection.
  final bool enableInteractiveSelection;

  /// Whether the input is in a skeleton loading state.
  ///
  /// When true, the input displays a shimmer skeleton effect while
  /// preserving its original layout and dimensions.
  ///
  /// This property also responds to [VitLoadingScope]. If a [VitLoadingScope]
  /// ancestor has [loading] set to true, this input will show skeleton
  /// loading even if [isLoading] is false.
  ///
  /// Defaults to false.
  final bool? isLoading;

  /// Creates a [VitInput].
  ///
  /// All parameters are optional and have sensible defaults.
  const VitInput({
    super.key,
    this.controller,
    this.initialValue,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.leading,
    this.trailing,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.showCounter = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.helperStyle,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderRadius,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.focusNode,
    this.textInputAction,
    this.onEditingComplete,
    this.onTap,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.semanticLabel,
    this.id,
    this.inputMode,
    this.inputLabelStyle,
    this.visualDensity,
    this.enableInteractiveSelection = true,
    this.isLoading,
  });

  @override
  State<VitInput> createState() => _VitInputState();
}

class _VitInputState extends State<VitInput> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _registerWithForm();
  }

  void _registerWithForm() {
    final form = VitFormProvider.maybeOf(context);
    final pageIndex = VitFormPageScope.of(context);
    if (form != null && pageIndex != null && widget.id != null) {
      form.registerFocus(_focusNode, pageIndex);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final configuration = theme.configuration;
    final effectiveLoading =
        widget.isLoading ?? VitLoadingScope.isLoading(context);

    if (effectiveLoading) {
      final effectiveBorderRadius = widget.borderRadius ?? theme.borderRadius;
      final effectiveContentPadding = switch (widget.visualDensity ??
          theme.visualDensity) {
        VisualDensity.compact => theme.values.inputCompactPadding,
        VisualDensity.standard => theme.values.inputStandardPadding,
        VisualDensity.comfortable => theme.values.inputComfortablePadding,
        _ => theme.values.inputStandardPadding,
      };
      final effectiveInputMode = widget.inputMode ?? configuration.inputMode;

      final skeletonInput = VitSkeletonShimmer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null &&
                effectiveInputMode == VitInputMode.fixedLabel)
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 6),
                child: Container(
                  height: 16,
                  width: 80,
                  decoration: BoxDecoration(
                    color: theme.skeletonBaseColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            Container(
              height: 48,
              padding: widget.contentPadding ?? effectiveContentPadding,
              decoration: BoxDecoration(
                color: theme.skeletonBaseColor,
                borderRadius: effectiveBorderRadius,
                border: configuration.showInputBorder
                    ? Border.all(
                        color: theme.skeletonBaseColor,
                        width: 1.0,
                      )
                    : null,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 16,
                  width: 150,
                  decoration: BoxDecoration(
                    color: theme.skeletonHighlightColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      if (widget.semanticLabel != null) {
        return Semantics(
          label: widget.semanticLabel,
          excludeSemantics: true,
          child: skeletonInput,
        );
      }

      return skeletonInput;
    }

    final effectiveInputMode = widget.inputMode ?? configuration.inputMode;
    final effectiveBorderRadius = widget.borderRadius ?? theme.borderRadius;
    final effectiveBorderColor = widget.borderColor ?? theme.borderColor;
    final effectiveFocusedBorderColor =
        widget.focusedBorderColor ?? theme.primaryColor;
    final effectiveErrorBorderColor =
        widget.errorBorderColor ?? theme.errorColor;
    final effectiveBackgroundColor =
        widget.backgroundColor ??
        (configuration.showInputBackground
            ? theme.cardColor
            : Colors.transparent);
    final effectiveCursorColor = widget.cursorColor ?? theme.primaryColor;

    final effectiveContentPadding = switch (widget.visualDensity ??
        theme.visualDensity) {
      VisualDensity.compact => theme.values.inputCompactPadding,
      VisualDensity.standard => theme.values.inputStandardPadding,
      VisualDensity.comfortable => theme.values.inputComfortablePadding,
      _ => theme.values.inputStandardPadding,
    };

    final effectiveStyle =
        widget.style ??
        theme.body.copyWith(
          color: widget.enabled
              ? theme.onBackrgroundColor
              : theme.disabledColor,
        );

    final effectiveLabelStyle =
        widget.labelStyle ??
        theme.body.copyWith(
          color: widget.errorText != null
              ? effectiveErrorBorderColor
              : _isFocused
              ? effectiveFocusedBorderColor
              : (widget.enabled
                    ? theme.onBackgroundVariantColor
                    : theme.disabledColor),
        );

    final effectiveHintStyle =
        widget.hintStyle ??
        theme.body.copyWith(
          color: theme.onBackgroundVariantColor,
        );

    final effectiveErrorStyle =
        widget.errorStyle ??
        theme.bodySmall.copyWith(
          color: effectiveErrorBorderColor,
        );

    final effectiveHelperStyle =
        widget.helperStyle ??
        theme.bodySmall.copyWith(
          color: theme.onBackgroundVariantColor,
        );

    final borderSide = BorderSide(
      color: effectiveBorderColor,
      width: 1.0,
    );

    final focusedBorderSide = BorderSide(
      color: effectiveFocusedBorderColor,
      width: 2.0,
    );

    final errorBorderSide = BorderSide(
      color: effectiveErrorBorderColor,
      width: 1.0,
    );

    final focusedErrorBorderSide = BorderSide(
      color: effectiveErrorBorderColor,
      width: 2.0,
    );

    final showBorder = configuration.showInputBorder;

    final decoration = InputDecoration(
      labelText:
          widget.label != null &&
              effectiveInputMode == VitInputMode.floatingLabel
          ? widget.label
          : null,
      hintText: widget.hintText,
      helperText: widget.helperText,
      errorText: widget.errorText,
      prefixIcon: widget.leading,
      suffixIcon: widget.trailing,
      filled: true,
      fillColor: effectiveBackgroundColor,
      labelStyle: effectiveLabelStyle,
      hintStyle: effectiveHintStyle,
      errorStyle: effectiveErrorStyle,
      helperStyle: effectiveHelperStyle,
      contentPadding: widget.contentPadding ?? effectiveContentPadding,
      counterText: widget.showCounter ? null : '',
      border: showBorder
          ? OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: borderSide,
            )
          : OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: BorderSide.none,
            ),
      enabledBorder: showBorder
          ? OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: borderSide,
            )
          : OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: BorderSide.none,
            ),
      focusedBorder: showBorder
          ? OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: focusedBorderSide,
            )
          : OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: BorderSide.none,
            ),
      errorBorder: showBorder
          ? OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: errorBorderSide,
            )
          : OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: BorderSide.none,
            ),
      focusedErrorBorder: showBorder
          ? OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: focusedErrorBorderSide,
            )
          : OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: BorderSide.none,
            ),
      disabledBorder: showBorder
          ? OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: BorderSide(
                color: theme.disabledColor,
                width: 1.0,
              ),
            )
          : OutlineInputBorder(
              borderRadius: effectiveBorderRadius,
              borderSide: BorderSide.none,
            ),
    );

    Widget textField = TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      decoration: decoration,
      style: effectiveStyle,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      textAlign: widget.textAlign,
      inputFormatters: widget.inputFormatters,
      focusNode: _focusNode,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      validator: widget.validator,
      onSaved: (value) {
        if (widget.id != null) {
          final form = VitFormProvider.maybeOf(context);
          form?.save(widget.id!, value ?? '');
        }
      },
      enableSuggestions: widget.enableSuggestions,
      autocorrect: widget.autocorrect,
      cursorColor: effectiveCursorColor,
      cursorWidth: widget.cursorWidth,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      enableInteractiveSelection: widget.enableInteractiveSelection,
    );

    if (widget.label != null && effectiveInputMode == VitInputMode.fixedLabel) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 6),
            child: VitText(
              widget.label!,
              style:
                  widget.inputLabelStyle ??
                  configuration.inputLabelStyle ??
                  theme.body.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          textField,
        ],
      );
    }

    if (widget.semanticLabel != null) {
      return Semantics(
        label: widget.semanticLabel,
        child: textField,
      );
    }

    return textField;
  }
}
