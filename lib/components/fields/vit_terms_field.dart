import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitCheckbox] with pre-defined properties,
/// validations and definitions for a terms and conditions field.
class VitTermsField extends StatelessWidget {
  /// The initial value of the terms field.
  final bool? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking that the value is true (accepted).
  final FormFieldValidator<bool>? validator;

  /// The title text displayed next to the checkbox.
  ///
  /// If not provided, defaults to the localized 'Accept Terms' string.
  final String? title;

  /// The subtitle text displayed below the title.
  ///
  /// If not provided, defaults to the localized terms subtitle string.
  final String? subtitle;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'acceptTerms'.
  final String? id;

  /// Callback function invoked when the checkbox value changes.
  final ValueChanged<bool>? onChanged;

  /// Creates a [VitTermsField].
  const VitTermsField({
    super.key,
    this.initialValue,
    this.validator,
    this.title,
    this.subtitle,
    this.id,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitCheckbox(
      id: id ?? 'acceptTerms',
      value: initialValue ?? false,
      title: title ?? strings.acceptTerms,
      subtitle: subtitle ?? strings.acceptTermsSubtitle,
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || !value) {
              return strings.acceptTermsError;
            }
            return null;
          },
    );
  }
}
