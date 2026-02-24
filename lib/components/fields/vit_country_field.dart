import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitSelect] with pre-defined properties,
/// validations and definitions for a country field.
class VitCountryField extends StatelessWidget {
  /// The initial value of the country field.
  final String? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition.
  final FormFieldValidator<String>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Country' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized country hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'country'.
  final String? id;

  /// Callback function invoked when the country selection changes.
  final ValueChanged<String?>? onChanged;

  /// A custom list of countries to use instead of the default list.
  final List<String>? customCountries;

  /// Creates a [VitCountryField].
  const VitCountryField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.customCountries,
  });

  static const List<String> defaultCountries = [
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
    'Spain',
    'Italy',
    'Brazil',
    'Mexico',
    'Argentina',
    'Japan',
    'China',
    'India',
    'South Korea',
    'Netherlands',
    'Belgium',
    'Switzerland',
    'Sweden',
    'Norway',
    'Denmark',
    'Finland',
    'Portugal',
    'Poland',
    'Austria',
    'Ireland',
    'New Zealand',
    'Singapore',
    'South Africa',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitSelect(
      id: id ?? 'country',
      label: label ?? strings.country,
      hintText: hintText ?? strings.countryHint,
      initialValue: initialValue,
      options: customCountries ?? defaultCountries,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
