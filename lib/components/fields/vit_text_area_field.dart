import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitInput] with pre-defined properties,
/// validations and definitions for a multi-line text area field.
class VitTextAreaField extends StatelessWidget {
  /// The initial value of the text area field.
  final String? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition.
  final FormFieldValidator<String>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Text Area' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized text area hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'textArea'.
  final String? id;

  /// Callback function invoked when the input value changes.
  final ValueChanged<String>? onChanged;

  /// The maximum number of lines to display.
  ///
  /// Defaults to 5.
  final int maxLines;

  /// The maximum number of characters allowed.
  ///
  /// If null, there is no limit.
  final int? maxLength;

  /// Creates a [VitTextAreaField].
  const VitTextAreaField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.maxLines = 5,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitInput(
      id: id ?? 'textArea',
      label: label ?? strings.textArea,
      hintText: hintText ?? strings.textAreaHint,
      initialValue: initialValue,
      maxLines: maxLines,
      maxLength: maxLength,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
