import 'package:vit_design_system/vit_design_system.dart';
import 'package:vit_design_system/utils/validators.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitInput] with pre-defined properties,
/// validations and definitions for an email field.
class VitEmailField extends StatelessWidget {
  /// The initial value of the email field.
  final String? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition and valid email format.
  final FormFieldValidator<String>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Email' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized email hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'email'.
  final String? id;

  /// Creates a [VitEmailField].
  const VitEmailField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitInput(
      id: id ?? 'email',
      label: label ?? strings.email,
      hintText: hintText ?? strings.emailHint,
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      validator:
          validator ??
          (value) {
            if (value == null) {
              return strings.required;
            }
            if (!isEmail(value)) {
              return strings.emailError;
            }
            return null;
          },
    );
  }
}
