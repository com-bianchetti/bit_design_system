import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A convenience wrapper of [VitInput] with pre-defined properties,
/// validations and definitions for a currency field.
class VitCurrencyField extends StatelessWidget {
  /// The initial value of the currency field.
  final String? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition.
  final FormFieldValidator<String>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Currency' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized currency hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'currency'.
  final String? id;

  /// Callback function invoked when the input value changes.
  final ValueChanged<String>? onChanged;

  /// The currency symbol to display as a prefix.
  ///
  /// Defaults to '$'.
  final String currencySymbol;

  /// Creates a [VitCurrencyField].
  const VitCurrencyField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.currencySymbol = '\$',
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitInput(
      id: id ?? 'currency',
      label: label ?? strings.currency,
      hintText: hintText ?? strings.currencyHint,
      initialValue: initialValue,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Text(
          currencySymbol,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return strings.required;
            }
            return null;
          },
    );
  }
}
