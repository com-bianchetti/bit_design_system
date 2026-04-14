import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitSelect] with pre-defined properties,
/// validations and definitions for a gender field.
class VitGenderField extends StatelessWidget {
  /// The initial value of the gender field.
  final String? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition.
  final FormFieldValidator<String>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Gender' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized gender hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'gender'.
  final String? id;

  /// Callback function invoked when the gender selection changes.
  final ValueChanged<String?>? onChanged;

  /// A custom list of gender options to use instead of the default list.
  final List<String>? customOptions;

  /// Creates a [VitGenderField].
  const VitGenderField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.customOptions,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    final options =
        customOptions ??
        [
          strings.male,
          strings.female,
          strings.other,
          strings.preferNotToSay,
        ];

    return VitSelect(
      id: id ?? 'gender',
      label: label ?? strings.gender,
      hintText: hintText ?? strings.genderHint,
      initialValue: initialValue,
      options: options,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
