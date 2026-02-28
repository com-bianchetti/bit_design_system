import 'package:vit_design_system/components/form/vit_form.dart';
import 'package:vit_design_system/components/skeleton/vit_loading_scope.dart';
import 'package:vit_design_system/components/skeleton/vit_skeleton_shimmer.dart';
import 'package:vit_design_system/components/text/vit_text.dart';
import 'package:vit_design_system/config/vit_types.dart';
import 'package:vit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A customizable checkbox widget that provides consistent styling.
///
/// The [VitCheckbox] can be rendered as a standalone checkbox or as part of a list item
/// with title, subtitle, and configurable positioning.
///
/// ## Usage
///
/// ### Standalone Checkbox
///
/// ```dart
/// VitCheckbox(
///   value: true,
///   onChanged: (value) {
///     print('Checkbox changed to: $value');
///   },
/// )
/// ```
///
/// ### Checkbox in List Item
///
/// ```dart
/// VitCheckbox(
///   value: true,
///   onChanged: (value) {
///     print('Checkbox changed to: $value');
///   },
///   title: 'Accept Terms',
///   subtitle: 'I agree to the terms and conditions',
/// )
/// ```
///
/// ### Checkbox with Custom Position
///
/// ```dart
/// VitCheckbox(
///   value: false,
///   onChanged: (value) => setState(() => isAccepted = value),
///   title: 'Subscribe',
///   subtitle: 'Receive newsletter updates',
///   checkboxPosition: VitCheckboxPosition.left,
/// )
/// ```
///
/// ## Customization
///
/// - Use [activeColor] to customize the active state color
/// - Use [checkColor] to customize the check mark color
/// - Use [title] to add a primary label in list mode
/// - Use [subtitle] to add a secondary label in list mode
/// - Use [checkboxPosition] to place the checkbox on left or right side
/// - Use [visualDensity] to control the list item height
/// - Use [semanticLabel] for accessibility
enum VitCheckboxPosition {
  left,
  right,
}

class VitCheckbox extends StatefulWidget {
  /// Current state of the checkbox.
  ///
  /// When true, the checkbox is checked.
  final bool? value;

  /// Callback function invoked when the checkbox state changes.
  ///
  /// Receives the new boolean value of the checkbox.
  final ValueChanged<bool>? onChanged;

  /// Active color of the checkbox when checked.
  ///
  /// If null, uses the theme's primary color.
  final Color? activeColor;

  /// Color of the check mark.
  ///
  /// If null, uses white color.
  final Color? checkColor;

  /// Title text for list item mode.
  ///
  /// When provided, the checkbox will be rendered as part of a list item
  /// with this text as the primary label.
  final String? title;

  /// Subtitle text for list item mode.
  ///
  /// Optional secondary text displayed below the title.
  /// Only shown when [title] is also provided.
  final String? subtitle;

  /// Text style for the title.
  ///
  /// If null, uses the theme's body text style with bold weight.
  final TextStyle? titleStyle;

  /// Text style for the subtitle.
  ///
  /// If null, uses the theme's body small text style.
  final TextStyle? subtitleStyle;

  /// Position of the checkbox in list item mode.
  ///
  /// Determines whether the checkbox appears on the left or right side
  /// of the list item. Defaults to [VitCheckboxPosition.right].
  /// Only applies when [title] is provided.
  final VitCheckboxPosition checkboxPosition;

  /// Visual density that controls the list item's height.
  ///
  /// If null, uses the theme's visual density.
  /// - [VisualDensity.comfortable]: 65 logical pixels
  /// - [VisualDensity.standard]: 50 logical pixels
  /// - [VisualDensity.compact]: 40 logical pixels
  /// Only applies when [title] is provided.
  final VisualDensity? visualDensity;

  /// Semantic label for accessibility.
  ///
  /// If null and [title] is provided, uses the title as the semantic label.
  final String? semanticLabel;

  /// Accessibility hint describing what happens when the checkbox is toggled.
  final String? hint;

  /// Background color of the list item.
  ///
  /// If null, uses the theme's card color.
  /// Only applies when [title] is provided.
  final Color? backgroundColor;

  /// Border radius for the list item.
  ///
  /// If null, uses the theme's border radius.
  /// Only applies when [title] is provided.
  final BorderRadius? borderRadius;

  /// The shape of the checkbox.
  ///
  /// If null, uses the theme configuration's checkboxShape.
  /// Supports [VitCheckboxShape.square], [VitCheckboxShape.circle], and [VitCheckboxShape.convex].
  final VitCheckboxShape? shape;

  /// The size of the checkbox independently of the visual density.
  ///
  /// If provided, this value overrides the size calculated from [visualDensity].
  /// By default, the size is calculated from the theme's values configuration:
  /// - [VisualDensity.comfortable]: [VitValues.checkboxComfortableSize]
  /// - [VisualDensity.standard]: [VitValues.checkboxStandardSize]
  /// - [VisualDensity.compact]: [VitValues.checkboxCompactSize]
  final double? checkboxSize;

  /// Padding around the list item content.
  ///
  /// Defaults to symmetric horizontal padding of 16 and vertical padding of 12.
  /// Only applies when [title] is provided.
  final EdgeInsets padding;

  /// Icon to display on the checkbox.
  ///
  /// If null, does not show any icon.
  final Widget? icon;

  /// Color of the icon.
  ///
  /// If null, uses the theme's on-background variant color.
  final Color? iconColor;

  /// Whether the checkbox is enabled.
  final bool enabled;

  /// Whether the checkbox should render as tristate.
  ///
  /// If true, the checkbox can have three states: checked, unchecked, and indeterminate (null).
  final bool tristate;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the checkbox's value in the form data map.
  final String? id;

  /// Validator for the checkbox.
  ///
  /// If provided, the validator will be called when the checkbox is saved.
  final FormFieldValidator<bool>? validator;

  /// Whether the checkbox is in a skeleton loading state.
  ///
  /// When true, the checkbox displays a shimmer skeleton effect while
  /// preserving its original layout and dimensions.
  ///
  /// This property also responds to [VitLoadingScope]. If a [VitLoadingScope]
  /// ancestor has [loading] set to true, this checkbox will show skeleton
  /// loading even if [isLoading] is false.
  ///
  /// Defaults to false.
  final bool isLoading;

  /// Creates a [VitCheckbox].
  ///
  /// The [value] parameter is required.
  /// The [onChanged] parameter is required for the checkbox to be interactive.
  /// All other parameters are optional and have sensible defaults.
  const VitCheckbox({
    super.key,
    this.value,
    this.onChanged,
    this.activeColor,
    this.checkColor,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.checkboxPosition = VitCheckboxPosition.right,
    this.visualDensity,
    this.semanticLabel,
    this.hint,
    this.backgroundColor,
    this.borderRadius,
    this.shape,
    this.checkboxSize,
    this.icon,
    this.iconColor,
    this.enabled = true,
    this.tristate = false,
    this.id,
    this.validator,
    this.isLoading = false,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
  });

  @override
  State<VitCheckbox> createState() => _VitCheckboxState();
}

class _VitCheckboxState extends State<VitCheckbox> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? false;
  }

  Widget _buildCheckbox(BuildContext context) {
    final theme = context.theme;

    final effectiveShape = widget.shape ?? theme.configuration.checkboxShape;
    final OutlinedBorder checkboxShape = switch (effectiveShape) {
      VitCheckboxShape.circle => const CircleBorder(),
      VitCheckboxShape.convex => const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      VitCheckboxShape.square => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    };

    final visualDensity = widget.visualDensity ?? theme.visualDensity;
    final defaultSize = switch (visualDensity) {
      VisualDensity.comfortable => theme.values.checkboxComfortableSize,
      VisualDensity.standard => theme.values.checkboxStandardSize,
      VisualDensity.compact => theme.values.checkboxCompactSize,
      _ => theme.values.checkboxStandardSize,
    };

    final effectiveSize = widget.checkboxSize ?? defaultSize;
    // Native Checkbox has a fixed size of 18.0
    final scale = effectiveSize / 18.0;

    return Semantics(
      label: widget.semanticLabel ?? widget.title ?? 'Checkbox',
      checked: widget.value ?? _value,
      hint: widget.hint,
      excludeSemantics: true,
      child: Transform.scale(
        scale: scale,
        child: Checkbox(
          value: widget.onChanged != null ? widget.value ?? _value : _value,
          onChanged: widget.enabled
              ? (widget.onChanged != null
                    ? (value) => widget.onChanged!(value ?? false)
                    : (value) {
                        setState(() {
                          _value = value ?? false;
                        });
                      })
              : null,
          activeColor: widget.activeColor ?? theme.primaryColor,
          checkColor: widget.checkColor ?? Colors.white,
          tristate: widget.tristate,
          shape: checkboxShape,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final effectiveLoading =
        widget.isLoading || VitLoadingScope.isLoading(context);

    if (effectiveLoading) {
      if (widget.title == null) {
        return VitSkeletonShimmer(
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: theme.skeletonBaseColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }

      final visualDensity = widget.visualDensity ?? theme.visualDensity;
      final borderRadius = widget.borderRadius ?? theme.borderRadius;
      final height = switch (visualDensity) {
        VisualDensity.comfortable => 65.0,
        VisualDensity.standard => 50.0,
        VisualDensity.compact => 40.0,
        _ => 50.0,
      };

      return VitSkeletonShimmer(
        child: Container(
          height: height,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: theme.skeletonBaseColor,
            borderRadius: borderRadius,
          ),
          child: Row(
            children: [
              if (widget.checkboxPosition == VitCheckboxPosition.left) ...[
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16,
                      width: 120,
                      decoration: BoxDecoration(
                        color: theme.skeletonHighlightColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    if (widget.subtitle != null) ...[
                      const SizedBox(height: 4),
                      Container(
                        height: 14,
                        width: 180,
                        decoration: BoxDecoration(
                          color: theme.skeletonHighlightColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (widget.checkboxPosition == VitCheckboxPosition.right) ...[
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
      );
    }

    final checkbox = _buildCheckboxWidget(context, theme);

    if (widget.id != null) {
      return FormField<bool>(
        initialValue: _value,
        validator: widget.validator,
        onSaved: (value) {
          final form = VitFormProvider.maybeOf(context);
          form?.save(widget.id!, _value);
        },
        builder: (field) {
          final hasError =
              field.errorText != null && field.errorText!.isNotEmpty;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              checkbox,
              if (hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: VitText(
                    field.errorText!,
                    style: theme.bodySmall.copyWith(
                      color: theme.errorColor,
                    ),
                  ),
                ),
            ],
          );
        },
      );
    }

    return checkbox;
  }

  Widget _buildCheckboxWidget(BuildContext context, theme) {
    if (widget.title == null) {
      return _buildCheckbox(context);
    }

    final visualDensity = widget.visualDensity ?? theme.visualDensity;
    final borderRadius = widget.borderRadius ?? theme.borderRadius;
    final showBorder = theme.configuration.showCheckboxItemBorder;
    final showBackground = theme.configuration.showCheckboxItemBackground;

    final checkboxWidget = _buildCheckbox(context);

    final titleWidget = VitText(
      widget.title!,
      bold: widget.titleStyle == null ? true : null,
      style: visualDensity == VisualDensity.compact
          ? theme.bodySmall.copyWith(
              fontWeight: widget.titleStyle == null ? FontWeight.bold : null,
              color: widget.enabled
                  ? theme.onBackrgroundColor
                  : theme.disabledColor,
            )
          : theme.body.copyWith(
              fontWeight: widget.titleStyle == null ? FontWeight.bold : null,
              color: widget.enabled
                  ? theme.onBackrgroundColor
                  : theme.disabledColor,
            ),
    );

    final subtitleWidget = widget.subtitle != null
        ? VitTextSmall(
            widget.subtitle!,
            style: TextStyle(
              color: theme.onBackgroundVariantColor,
            ).merge(widget.subtitleStyle),
          )
        : null;

    return Container(
      decoration: BoxDecoration(
        color:
            widget.backgroundColor ??
            (showBackground ? theme.cardColor : theme.backgroundColor),
        borderRadius: showBorder ? borderRadius : null,
        border: showBorder ? Border.all(color: theme.borderColor) : null,
      ),
      child: MergeSemantics(
        child: ListTileTheme.merge(
          selectedColor: widget.activeColor ?? theme.primaryColor,
          visualDensity: visualDensity,
          contentPadding: widget.padding,
          iconColor: widget.iconColor ?? theme.onBackgroundVariantColor,
          child: ListTile(
            leading: widget.checkboxPosition == VitCheckboxPosition.left
                ? checkboxWidget
                : widget.icon,
            title: titleWidget,
            subtitle: subtitleWidget,
            trailing: widget.checkboxPosition == VitCheckboxPosition.right
                ? checkboxWidget
                : widget.icon,
            visualDensity: visualDensity,
            dense: visualDensity == VisualDensity.compact,
            enabled: widget.enabled,
            onTap: widget.onChanged != null
                ? () {
                    if (widget.value == null) {
                      setState(() {
                        _value = !_value;
                      });
                    }

                    widget.onChanged!(
                      widget.value != null ? !widget.value! : !_value,
                    );
                  }
                : () {
                    setState(() {
                      _value = !_value;
                    });
                  },
          ),
        ),
      ),
    );
  }
}
