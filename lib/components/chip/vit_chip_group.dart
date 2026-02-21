import 'package:vit_design_system/components/chip/vit_chip.dart';
import 'package:vit_design_system/components/form/vit_form.dart';
import 'package:vit_design_system/components/text/vit_text.dart';
import 'package:vit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A widget that groups multiple [VitChip] widgets together.
///
/// [VitChipGroup] simplifies managing multiple related chip options by
/// automatically handling the group state and rendering all options.
/// Supports both single and multi-selection modes.
///
/// ## Usage
///
/// ### Single Selection Mode
///
/// ```dart
/// String? selectedTag;
///
/// VitChipGroup<String>(
///   value: selectedTag,
///   onChanged: (value) => setState(() => selectedTag = value),
///   options: const [
///     VitChipOption(value: 'flutter', label: 'Flutter'),
///     VitChipOption(value: 'dart', label: 'Dart'),
///     VitChipOption(value: 'mobile', label: 'Mobile'),
///   ],
/// )
/// ```
///
/// ### Multi-Selection Mode
///
/// ```dart
/// List<String> selectedTags = [];
///
/// VitChipGroup<String>(
///   values: selectedTags,
///   multiSelect: true,
///   onMultiChanged: (values) => setState(() => selectedTags = values),
///   options: const [
///     VitChipOption(value: 'flutter', label: 'Flutter'),
///     VitChipOption(value: 'dart', label: 'Dart'),
///     VitChipOption(value: 'mobile', label: 'Mobile'),
///   ],
/// )
/// ```
///
/// ### With Form Validation
///
/// ```dart
/// VitChipGroup<String>(
///   id: 'interests',
///   values: selectedInterests,
///   multiSelect: true,
///   onMultiChanged: (values) => setState(() => selectedInterests = values),
///   validator: (values) {
///     if (values == null || values.isEmpty) {
///       return 'Please select at least one interest';
///     }
///     return null;
///   },
///   options: const [
///     VitChipOption(value: 'tech', label: 'Technology'),
///     VitChipOption(value: 'sports', label: 'Sports'),
///     VitChipOption(value: 'music', label: 'Music'),
///   ],
/// )
/// ```
class VitChipGroup<T> extends StatefulWidget {
  /// The currently selected value (for single selection mode).
  ///
  /// When null, no option is selected.
  /// Only used when [multiSelect] is false.
  final T? value;

  /// The currently selected values (for multi-selection mode).
  ///
  /// When null or empty, no options are selected.
  /// Only used when [multiSelect] is true.
  final List<T>? values;

  /// Callback function invoked when the selection changes (single selection mode).
  ///
  /// Receives the value of the selected option.
  /// Only used when [multiSelect] is false.
  final ValueChanged<T?>? onChanged;

  /// Callback function invoked when the selection changes (multi-selection mode).
  ///
  /// Receives the list of selected values.
  /// Only used when [multiSelect] is true.
  final ValueChanged<List<T>>? onMultiChanged;

  /// List of chip options to display.
  final List<VitChipOption<T>> options;

  /// Whether to allow multiple selections.
  ///
  /// When true, multiple chips can be selected at once.
  /// When false, only one chip can be selected at a time.
  /// Defaults to false.
  final bool multiSelect;

  /// Background color for all chips when selected.
  ///
  /// If null, uses the theme's primary color.
  final Color? selectedColor;

  /// Background color for all chips when not selected.
  ///
  /// If null, uses the theme's card color.
  final Color? backgroundColor;

  /// Border color for all chips.
  ///
  /// If null, uses the theme's border color.
  final Color? borderColor;

  /// Text style for all chip labels.
  ///
  /// If null, uses the theme's body text style.
  final TextStyle? labelStyle;

  /// Text color for all chips when selected.
  ///
  /// If null, uses the theme's on-primary color.
  final Color? selectedLabelColor;

  /// Text color for all chips when not selected.
  ///
  /// If null, uses the theme's on-background color.
  final Color? labelColor;

  /// Visual density for all chips.
  ///
  /// If null, uses the theme's visual density.
  final VisualDensity? visualDensity;

  /// Border radius for all chips.
  ///
  /// If null, uses a circular border radius.
  final BorderRadius? borderRadius;

  /// Icon color for all chips.
  ///
  /// If null, uses the label color.
  final Color? iconColor;

  /// Whether the entire group is enabled.
  ///
  /// When false, all options are disabled regardless of their individual [enabled] state.
  final bool enabled;

  /// Spacing between chip options.
  ///
  /// Defaults to 8 logical pixels.
  final double spacing;

  /// Spacing between rows of chips.
  ///
  /// Defaults to 8 logical pixels.
  final double runSpacing;

  /// Alignment of the chips within the group.
  ///
  /// Defaults to [WrapAlignment.start].
  final WrapAlignment alignment;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the selected chip value(s) in the form data map.
  final String? id;

  /// Validator for the chip group.
  ///
  /// If provided, the validator will be called when the chip group is saved.
  /// For single selection mode, validates the single selected value.
  /// For multi-selection mode, validates the list of selected values.
  final FormFieldValidator<dynamic>? validator;

  /// Whether the chip background should be solid.
  ///
  /// When true, the chip background will be solid.
  /// When false, the chip background will be half transparent.
  /// Defaults to true.
  final bool solidBackground;

  /// Whether the chip group is required.
  ///
  /// When true, the chip group must have at least one option selected.
  /// Defaults to false.
  final bool required;

  /// Creates a [VitChipGroup].
  ///
  /// The [options] parameter is required and must contain at least one option.
  /// All other parameters are optional and have sensible defaults.
  const VitChipGroup({
    super.key,
    this.value,
    this.values,
    this.onChanged,
    this.onMultiChanged,
    required this.options,
    this.multiSelect = false,
    this.selectedColor,
    this.backgroundColor,
    this.borderColor,
    this.labelStyle,
    this.selectedLabelColor,
    this.labelColor,
    this.visualDensity,
    this.borderRadius,
    this.iconColor,
    this.enabled = true,
    this.spacing = 8,
    this.runSpacing = 8,
    this.alignment = WrapAlignment.start,
    this.id,
    this.validator,
    this.solidBackground = true,
    this.required = false,
  });

  @override
  State<VitChipGroup<T>> createState() => _VitChipGroupState<T>();
}

class _VitChipGroupState<T> extends State<VitChipGroup<T>> {
  T? _selectedValue;
  List<T> _selectedValues = [];
  FormFieldState<dynamic>? _formFieldState;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
    _selectedValues = widget.values != null ? List<T>.from(widget.values!) : [];
  }

  @override
  void didUpdateWidget(VitChipGroup<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _selectedValue = widget.value;
    }
    if (widget.values != oldWidget.values) {
      _selectedValues = widget.values != null
          ? List<T>.from(widget.values!)
          : [];
    }
  }

  void _handleSingleSelection(T value, bool selected) {
    setState(() {
      _selectedValue = selected ? value : null;
    });
    widget.onChanged?.call(_selectedValue);
    _formFieldState?.didChange(_selectedValue);
  }

  void _handleMultiSelection(T value, bool selected) {
    setState(() {
      if (selected) {
        if (!_selectedValues.contains(value)) {
          _selectedValues.add(value);
        }
      } else {
        _selectedValues.remove(value);
      }
    });
    widget.onMultiChanged?.call(_selectedValues);
    _formFieldState?.didChange(_selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    final chips = Wrap(
      spacing: widget.spacing,
      runSpacing: widget.runSpacing,
      alignment: widget.alignment,
      children: widget.options.map((option) {
        final isSelected = widget.multiSelect
            ? _selectedValues.contains(option.value)
            : _selectedValue == option.value;

        return VitChip(
          label: option.label,
          selected: isSelected,
          onSelected: widget.enabled
              ? (selected) {
                  if (widget.multiSelect) {
                    _handleMultiSelection(option.value, selected);
                  } else {
                    _handleSingleSelection(option.value, selected);
                  }
                }
              : null,
          selectedColor: widget.selectedColor,
          backgroundColor: widget.backgroundColor,
          borderColor: widget.borderColor,
          labelStyle: widget.labelStyle,
          selectedLabelColor: widget.selectedLabelColor,
          labelColor: widget.labelColor,
          avatar: option.avatar,
          icon: option.icon,
          iconColor: widget.iconColor ?? option.iconColor,
          iconSize: option.iconSize,
          showDeleteIcon: option.showDeleteIcon,
          onDeleted: option.onDeleted,
          deleteIcon: option.deleteIcon,
          deleteIconColor: option.deleteIconColor,
          visualDensity: widget.visualDensity,
          semanticLabel: option.semanticLabel,
          hint: option.hint,
          borderRadius: widget.borderRadius,
          padding: option.padding,
          elevation: option.elevation,
          enabled: widget.enabled && (option.enabled ?? true),
          value: option.value,
          solidBackground: widget.solidBackground,
        );
      }).toList(),
    );

    if (widget.id != null) {
      return FormField<dynamic>(
        initialValue: widget.multiSelect ? _selectedValues : _selectedValue,
        validator: (value) {
          if (widget.validator != null) {
            return widget.validator!(
              widget.multiSelect ? _selectedValues : _selectedValue,
            );
          }
          if (widget.required &&
              (widget.multiSelect
                  ? _selectedValues.isEmpty
                  : _selectedValue == null)) {
            return context.theme.bitStrings.selectAtLeastOneOption;
          }
          return null;
        },
        onSaved: (value) {
          final form = VitFormProvider.maybeOf(context);
          form?.save(
            widget.id!,
            widget.multiSelect ? _selectedValues : _selectedValue,
          );
        },
        builder: (field) {
          _formFieldState = field;

          if (widget.validator == null) {
            return chips;
          }

          final hasError =
              field.errorText != null && field.errorText!.isNotEmpty;
          final theme = context.theme;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              chips,
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

    return chips;
  }
}

/// Configuration for a single chip option in a [VitChipGroup].
///
/// Each [VitChipOption] represents one selectable choice in the chip group.
class VitChipOption<T> {
  /// The value represented by this option.
  ///
  /// This is the value that will be returned when the option is selected.
  final T value;

  /// The label text for this chip.
  final String label;

  /// Avatar widget displayed at the start of the chip.
  ///
  /// Typically a [CircleAvatar] widget.
  final Widget? avatar;

  /// Icon displayed at the start of the chip.
  ///
  /// Only shown if [avatar] is null.
  final IconData? icon;

  /// Color of the icon.
  ///
  /// If null, uses the group's icon color or label color.
  final Color? iconColor;

  /// Size of the icon.
  ///
  /// Defaults to 18.
  final double iconSize;

  /// Whether to show a delete icon at the end of the chip.
  ///
  /// When true, displays a delete icon that can be tapped to trigger [onDeleted].
  final bool showDeleteIcon;

  /// Callback function invoked when the delete icon is tapped.
  ///
  /// Only applies when [showDeleteIcon] is true.
  final VoidCallback? onDeleted;

  /// Custom delete icon widget.
  ///
  /// If null, uses the default close icon.
  final Widget? deleteIcon;

  /// Color of the delete icon.
  ///
  /// If null, uses the label color.
  final Color? deleteIconColor;

  /// Semantic label for accessibility.
  ///
  /// If null, uses the label as the semantic label.
  final String? semanticLabel;

  /// Accessibility hint for this option.
  final String? hint;

  /// Padding inside the chip.
  ///
  /// If null, uses padding based on visual density.
  final EdgeInsets? padding;

  /// Elevation of the chip.
  ///
  /// Defaults to 0.
  final double elevation;

  /// Whether this option is enabled.
  ///
  /// When false, this option will be disabled even if the group is enabled.
  final bool? enabled;

  /// Creates a [VitChipOption].
  ///
  /// The [value] and [label] parameters are required.
  /// All other parameters are optional.
  const VitChipOption({
    required this.value,
    required this.label,
    this.avatar,
    this.icon,
    this.iconColor,
    this.iconSize = 18,
    this.showDeleteIcon = false,
    this.onDeleted,
    this.deleteIcon,
    this.deleteIconColor,
    this.semanticLabel,
    this.hint,
    this.padding,
    this.elevation = 0,
    this.enabled,
  });
}
