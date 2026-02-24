import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitInput] with pre-defined properties,
/// validations and definitions for a phone field.
class VitPhoneField extends StatelessWidget {
  /// The initial value of the phone field.
  final String? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition and a minimum of 10 digits.
  final FormFieldValidator<String>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Phone' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized phone hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'phone'.
  final String? id;

  /// Callback function invoked when the input value changes.
  final ValueChanged<String>? onChanged;

  /// Creates a [VitPhoneField].
  const VitPhoneField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitInput(
      id: id ?? 'phone',
      label: label ?? strings.phone,
      hintText: hintText ?? strings.phoneHint,
      initialValue: initialValue,
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return strings.required;
            }
            if (value.replaceAll(RegExp(r'[\s\-\(\)\+]'), '').length < 10) {
              return strings.phoneError;
            }
            return null;
          },
    );
  }
}
