import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A convenience wrapper of [VitInput] with pre-defined properties,
/// validations and definitions for a percentage field.
class VitPercentageField extends StatelessWidget {
  /// The initial value of the percentage field.
  final String? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition and valid percentage range (0-100).
  final FormFieldValidator<String>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Percentage' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized percentage hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'percentage'.
  final String? id;

  /// Callback function invoked when the input value changes.
  final ValueChanged<String>? onChanged;

  /// Creates a [VitPercentageField].
  const VitPercentageField({
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
      id: id ?? 'percentage',
      label: label ?? strings.percentage,
      hintText: hintText ?? strings.percentageHint,
      initialValue: initialValue,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      trailing: const Padding(
        padding: EdgeInsets.only(right: 12),
        child: Text(
          '%',
          style: TextStyle(fontSize: 16),
        ),
      ),
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return strings.required;
            }
            final numValue = double.tryParse(value);
            if (numValue == null || numValue < 0 || numValue > 100) {
              return strings.percentageError;
            }
            return null;
          },
    );
  }
}
