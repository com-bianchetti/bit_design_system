import 'package:vit_design_system/vit_design_system.dart';
import 'package:vit_design_system/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A convenience wrapper of [VitInput] with pre-defined properties,
/// validations and definitions for a number field.
class VitNumberField extends StatelessWidget {
  /// The initial value of the number field.
  final String? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition and valid integer format.
  final FormFieldValidator<String>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Number' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized number hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'number'.
  final String? id;

  /// Callback function invoked when the input value changes.
  final ValueChanged<String>? onChanged;

  /// Creates a [VitNumberField].
  const VitNumberField({
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
      id: id ?? 'number',
      label: label ?? strings.number,
      hintText: hintText ?? strings.numberHint,
      initialValue: initialValue,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return strings.required;
            }
            if (!isInt(value)) {
              return strings.numberHint;
            }
            return null;
          },
    );
  }
}
