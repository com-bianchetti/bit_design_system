import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitDate] with pre-defined properties,
/// validations and definitions for a birthday field.
class VitBirthdayField extends StatelessWidget {
  /// The initial value of the birthday field.
  final DateTime? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition.
  final FormFieldValidator<VitDateData>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Birthday' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized birthday hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'birthday'.
  final String? id;

  /// Callback function invoked when the date value changes.
  final ValueChanged<DateTime?>? onChanged;

  /// The minimum age required for the birthday selection.
  ///
  /// Defaults to 13.
  final int minAge;

  /// Creates a [VitBirthdayField].
  const VitBirthdayField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.minAge = 13,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    final now = DateTime.now();
    final maxDate = DateTime(now.year - minAge, now.month, now.day);
    final minDate = DateTime(now.year - 120, now.month, now.day);

    return VitDate(
      id: id ?? 'birthday',
      label: label ?? strings.birthday,
      hintText: hintText ?? strings.birthdayHint,
      initialValue: initialValue ?? DateTime(2000, 1, 1),
      selectDate: true,
      maxDate: maxDate,
      minDate: minDate,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
