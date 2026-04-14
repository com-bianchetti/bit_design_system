import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitInput] with pre-defined properties,
/// validations and definitions for a password field.
class VitPasswordField extends StatefulWidget {
  /// The initial value of the password field.
  final String? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition and minimum length of 6 characters.
  final FormFieldValidator<String>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Password' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized password hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'password'.
  final String? id;

  /// Callback function invoked when the input value changes.
  final ValueChanged<String>? onChanged;

  /// Whether to show the visibility toggle icon button.
  ///
  /// Defaults to true.
  final bool showVisibilityToggle;

  /// Creates a [VitPasswordField].
  const VitPasswordField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.showVisibilityToggle = true,
  });

  @override
  State<VitPasswordField> createState() => _VitPasswordFieldState();
}

class _VitPasswordFieldState extends State<VitPasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitInput(
      id: widget.id ?? 'password',
      label: widget.label ?? strings.password,
      hintText: widget.hintText ?? strings.passwordHint,
      initialValue: widget.initialValue,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      trailing: widget.showVisibilityToggle
          ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: _toggleVisibility,
            )
          : null,
      validator:
          widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return strings.passwordError;
            }
            if (value.length < 6) {
              return strings.passwordMinLength;
            }
            return null;
          },
    );
  }
}
