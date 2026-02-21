import 'package:flutter/material.dart';

import 'package:vit_design_system/components/button/vit_button.dart';
import 'package:vit_design_system/components/form/vit_form.dart';
import 'package:vit_design_system/components/input/vit_input.dart';
import 'package:vit_design_system/components/popover/vit_popover.dart';
import 'package:vit_design_system/components/skeleton/vit_loading_scope.dart';
import 'package:vit_design_system/components/text/vit_text.dart';
import 'package:vit_design_system/config/vit_types.dart';
import 'package:vit_design_system/utils/extensions.dart';

/// The modes available for [VitTime] picker.
///
/// [amPm] displays a 12-hour format with AM/PM selection.
/// [twentyFourHour] displays a 24-hour format.
enum VitTimeMode {
  amPm,
  twentyFourHour,
}

/// Data class representing the selected time for form validation and data collection.
class VitTimeData {
  final TimeOfDay? time;

  const VitTimeData({this.time});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VitTimeData &&
          runtimeType == other.runtimeType &&
          time == other.time;

  @override
  int get hashCode => time.hashCode;

  @override
  String toString() {
    return 'VitTimeData(time: $time)';
  }
}

/// A customizable time picker widget that provides consistent styling.
///
/// The [VitTime] is a flexible time picker component that combines a [VitInput]
/// with a [VitPopover] to display scrolling wheels for time selection.
///
/// ## Usage
///
/// ### Basic Time Picker
///
/// ```dart
/// VitTime(
///   label: 'Alarm Time',
///   hintText: 'Select alarm time',
///   onChanged: (time) {
///     print('Selected: $time');
///   },
/// )
/// ```
///
/// ### 24-Hour Format
///
/// ```dart
/// VitTime(
///   label: 'Meeting Time',
///   mode: VitTimeMode.twentyFourHour,
///   initialValue: TimeOfDay(hour: 14, minute: 30),
///   onChanged: (time) {
///     print('Selected: $time');
///   },
/// )
/// ```
///
/// ### Controlled Value
///
/// ```dart
/// TimeOfDay? selectedTime = TimeOfDay.now();
///
/// VitTime(
///   label: 'Event Time',
///   value: selectedTime,
///   onChanged: (time) {
///     setState(() {
///       selectedTime = time;
///     });
///   },
/// )
/// ```
///
/// ## Customization
///
/// - Use [label] to add a floating or fixed label
/// - Use [hintText] for placeholder text
/// - Use [leading] for icons or widgets
/// - Use [value] for controlled state
/// - Use [initialValue] for uncontrolled initial state
/// - Use [enabled] to disable the picker
/// - Use [mode] to choose between 12-hour and 24-hour formats
/// - Use [confirmButtonText] to customize the button text inside the dialog
class VitTime extends StatefulWidget {
  final TimeOfDay? value;
  final TimeOfDay? initialValue;
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? leading;
  final ValueChanged<TimeOfDay?>? onChanged;
  final FormFieldValidator<VitTimeData>? validator;
  final bool enabled;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final TextStyle? helperStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? contentPadding;
  final String? semanticLabel;
  final VitInputMode? inputMode;
  final TextStyle? inputLabelStyle;
  final VisualDensity? visualDensity;
  final IconData trailingIcon;
  final double popoverBorderRadius;

  /// The text for the confirm button in the time picker popover.
  ///
  /// If null, uses the value from VitStrings.
  final String? confirmButtonText;

  /// The color of the selected time in the time picker popover.
  final Color? selectedColor;

  /// The mode of the time picker.
  /// VitTimeMode.amPm: 12-hour format with AM/PM selection.
  /// VitTimeMode.twentyFourHour: 24-hour format.
  final VitTimeMode mode;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the time in the form data map.
  final String? id;

  /// Whether the time picker is in a skeleton loading state.
  ///
  /// When true, the time picker displays a shimmer skeleton effect while
  /// preserving its original layout and dimensions.
  ///
  /// This property also responds to [VitLoadingScope]. If a [VitLoadingScope]
  /// ancestor has [loading] set to true, this time picker will show skeleton
  /// loading even if [isLoading] is false.
  ///
  /// Defaults to false.
  final bool isLoading;

  const VitTime({
    super.key,
    this.value,
    this.initialValue,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.leading,
    this.onChanged,
    this.validator,
    this.enabled = true,
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
    this.semanticLabel,
    this.inputMode,
    this.inputLabelStyle,
    this.visualDensity,
    this.trailingIcon = Icons.access_time,
    this.popoverBorderRadius = 25,
    this.confirmButtonText,
    this.selectedColor,
    this.mode = VitTimeMode.twentyFourHour,
    this.id,
    this.isLoading = false,
  });

  @override
  State<VitTime> createState() => _VitTimeState();
}

class _VitTimeState extends State<VitTime> {
  late TimeOfDay? _selectedTime;
  final TextEditingController _displayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.value ?? widget.initialValue;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateDisplayText();
  }

  @override
  void didUpdateWidget(VitTime oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _selectedTime = widget.value;
      _updateDisplayText();
    }
  }

  @override
  void dispose() {
    _displayController.dispose();
    super.dispose();
  }

  void _updateDisplayText() {
    if (_selectedTime != null) {
      if (widget.mode == VitTimeMode.amPm) {
        final loc = MaterialLocalizations.of(context);
        _displayController.text = loc.formatTimeOfDay(
          _selectedTime!,
          alwaysUse24HourFormat: false,
        );
      } else {
        final hour = _selectedTime!.hour.toString().padLeft(2, '0');
        final minute = _selectedTime!.minute.toString().padLeft(2, '0');
        _displayController.text = '$hour:$minute';
      }
    } else {
      _displayController.text = '';
    }
  }

  void _handleTimeConfirmed(TimeOfDay time) {
    setState(() {
      _selectedTime = time;
      _updateDisplayText();
    });
    widget.onChanged?.call(time);
    Navigator.of(context).pop();
  }

  Future<void> _showTimePicker() async {
    if (!widget.enabled) return;

    final strings = context.theme.bitStrings;

    await VitPopover.show(
      context,
      title: widget.label != null ? Text(widget.label!) : null,
      content: _VitTimeSelector(
        initialTime: _selectedTime ?? TimeOfDay.now(),
        onConfirm: _handleTimeConfirmed,
        mode: widget.mode,
        selectedColor: widget.selectedColor,
        confirmButtonText: widget.confirmButtonText ?? strings.confirm,
      ),
      borderRadius: widget.popoverBorderRadius,
      isDismissible: true,
      fixedFooter: true,
      contentPadding: EdgeInsets.zero,
    );
  }

  VitTimeData _buildTimeData() {
    return VitTimeData(time: _selectedTime);
  }

  String? _validateTime(String? _) {
    if (widget.validator != null) {
      return widget.validator!(_buildTimeData());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveLoading =
        widget.isLoading || VitLoadingScope.isLoading(context);

    final input = VitInput(
      controller: _displayController,
      label: widget.label,
      hintText: widget.hintText,
      helperText: widget.helperText,
      errorText: widget.errorText,
      leading: widget.leading,
      trailing: Icon(
        widget.trailingIcon,
        color: widget.enabled
            ? context.theme.onBackgroundVariantColor
            : context.theme.disabledColor,
      ),
      enabled: widget.enabled,
      readOnly: true,
      autocorrect: false,
      enableInteractiveSelection: false,
      style: widget.style,
      labelStyle: widget.labelStyle,
      hintStyle: widget.hintStyle,
      errorStyle: widget.errorStyle,
      helperStyle: widget.helperStyle,
      backgroundColor: widget.backgroundColor,
      borderColor: widget.borderColor,
      focusedBorderColor: widget.focusedBorderColor,
      errorBorderColor: widget.errorBorderColor,
      borderRadius: widget.borderRadius,
      contentPadding: widget.contentPadding,
      semanticLabel: widget.semanticLabel,
      inputMode: widget.inputMode,
      inputLabelStyle: widget.inputLabelStyle,
      visualDensity: widget.visualDensity,
      validator: _validateTime,
      onTap: _showTimePicker,
      isLoading: effectiveLoading,
    );

    if (widget.id != null) {
      return FormField<TimeOfDay>(
        initialValue: _selectedTime,
        onSaved: (value) {
          final form = VitFormProvider.maybeOf(context);
          form?.save(widget.id!, _selectedTime);
        },
        builder: (field) => input,
      );
    }

    return input;
  }
}

class _VitTimeSelector extends StatefulWidget {
  final TimeOfDay initialTime;
  final ValueChanged<TimeOfDay> onConfirm;
  final VitTimeMode mode;
  final Color? selectedColor;
  final String confirmButtonText;

  const _VitTimeSelector({
    required this.initialTime,
    required this.onConfirm,
    required this.mode,
    this.selectedColor,
    required this.confirmButtonText,
  });

  @override
  State<_VitTimeSelector> createState() => _VitTimeSelectorState();
}

class _VitTimeSelectorState extends State<_VitTimeSelector> {
  late int _selectedHour;
  late int _selectedMinute;
  late bool _isAm;

  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late FixedExtentScrollController _amPmController;

  static const double _itemExtent = 45.0;

  @override
  void initState() {
    super.initState();
    _selectedHour = widget.initialTime.hour;
    _selectedMinute = widget.initialTime.minute;

    if (widget.mode == VitTimeMode.amPm) {
      _isAm = _selectedHour < 12;
      int displayHour = _selectedHour % 12;
      if (displayHour == 0) displayHour = 12;

      _hourController = FixedExtentScrollController(
        initialItem: displayHour - 1,
      );
      _amPmController = FixedExtentScrollController(initialItem: _isAm ? 0 : 1);
    } else {
      _hourController = FixedExtentScrollController(initialItem: _selectedHour);
    }

    _minuteController = FixedExtentScrollController(
      initialItem: _selectedMinute,
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    if (widget.mode == VitTimeMode.amPm) {
      _amPmController.dispose();
    }
    super.dispose();
  }

  void _handleConfirm() {
    int finalHour = _selectedHour;

    if (widget.mode == VitTimeMode.amPm) {
      if (_isAm) {
        if (finalHour == 12) finalHour = 0;
      } else {
        if (finalHour != 12) finalHour += 12;
      }
    }

    widget.onConfirm(TimeOfDay(hour: finalHour, minute: _selectedMinute));
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final effectiveSelectedColor = widget.selectedColor ?? theme.primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: _itemExtent,
                  decoration: BoxDecoration(
                    color: effectiveSelectedColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildWheel(
                        controller: _hourController,
                        itemCount: widget.mode == VitTimeMode.amPm ? 12 : 24,
                        onChanged: (index) {
                          setState(() {
                            if (widget.mode == VitTimeMode.amPm) {
                              _selectedHour = index + 1;
                            } else {
                              _selectedHour = index;
                            }
                          });
                        },
                        itemBuilder: (context, index) {
                          int value = widget.mode == VitTimeMode.amPm
                              ? index + 1
                              : index;
                          return _buildWheelItem(
                            value.toString().padLeft(2, '0'),
                          );
                        },
                      ),
                    ),
                    const VitText(
                      ':',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: _buildWheel(
                        controller: _minuteController,
                        itemCount: 60,
                        onChanged: (index) {
                          setState(() {
                            _selectedMinute = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return _buildWheelItem(
                            index.toString().padLeft(2, '0'),
                          );
                        },
                      ),
                    ),
                    if (widget.mode == VitTimeMode.amPm)
                      Expanded(
                        child: _buildWheel(
                          controller: _amPmController,
                          itemCount: 2,
                          onChanged: (index) {
                            setState(() {
                              _isAm = index == 0;
                            });
                          },
                          itemBuilder: (context, index) {
                            return _buildWheelItem(index == 0 ? 'AM' : 'PM');
                          },
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: VitButton(
              onPressed: _handleConfirm,
              text: widget.confirmButtonText,
              backgroundColor: theme.primaryColor,
              foregroundColor: theme.onPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWheel({
    required FixedExtentScrollController controller,
    required int itemCount,
    required ValueChanged<int> onChanged,
    required IndexedWidgetBuilder itemBuilder,
  }) {
    return ListWheelScrollView.useDelegate(
      controller: controller,
      itemExtent: _itemExtent,
      perspective: 0.005,
      diameterRatio: 1.2,
      physics: const FixedExtentScrollPhysics(),
      onSelectedItemChanged: onChanged,
      childDelegate: ListWheelChildBuilderDelegate(
        builder: itemBuilder,
        childCount: itemCount,
      ),
    );
  }

  Widget _buildWheelItem(String text) {
    return Center(
      child: VitText(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
