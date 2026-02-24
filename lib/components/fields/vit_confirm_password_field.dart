import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitInput] with pre-defined properties,
/// validations and definitions for a confirm password field.
class VitConfirmPasswordField extends StatefulWidget {
  /// The initial value of the confirm password field.
  final String? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition and matching the password field.
  final FormFieldValidator<String>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Confirm Password' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized confirm password hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'confirmPassword'.
  final String? id;

  /// The unique identifier of the target password field to compare with.
  ///
  /// Defaults to 'password'.
  final String passwordFieldId;

  /// Callback function invoked when the input value changes.
  final ValueChanged<String>? onChanged;

  /// Whether to show the visibility toggle icon button.
  ///
  /// Defaults to true.
  final bool showVisibilityToggle;

  /// Creates a [VitConfirmPasswordField].
  const VitConfirmPasswordField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.passwordFieldId = 'password',
    this.onChanged,
    this.showVisibilityToggle = true,
  });

  @override
  State<VitConfirmPasswordField> createState() =>
      _VitConfirmPasswordFieldState();
}

class _VitConfirmPasswordFieldState extends State<VitConfirmPasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    final form = VitFormProvider.maybeOf(context);

    return VitInput(
      id: widget.id ?? 'confirmPassword',
      label: widget.label ?? strings.confirmPassword,
      hintText: widget.hintText ?? strings.confirmPasswordHint,
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
            if (form != null) {
              final passwordValue = form.formData[widget.passwordFieldId];
              if (passwordValue != null && value != passwordValue) {
                return strings.confirmPasswordError;
              }
            }
            return null;
          },
    );
  }
}
