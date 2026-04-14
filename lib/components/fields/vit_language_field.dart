import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitSelect] with pre-defined properties,
/// validations and definitions for a language field.
class VitLanguageField extends StatelessWidget {
  /// The initial value of the language field.
  final String? initialValue;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition.
  final FormFieldValidator<String>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Language' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized language hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'language'.
  final String? id;

  /// Callback function invoked when the language selection changes.
  final ValueChanged<String?>? onChanged;

  /// A custom list of languages to use instead of the default list.
  final List<String>? customLanguages;

  /// Creates a [VitLanguageField].
  const VitLanguageField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.customLanguages,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;

    List<String> defaultLanguages = [
      strings.languageEnglish,
      strings.languageSpanish,
      strings.languageFrench,
      strings.languageGerman,
      strings.languageItalian,
      strings.languagePortuguese,
      strings.languageRussian,
      strings.languageChinese,
      strings.languageJapanese,
      strings.languageKorean,
      strings.languageArabic,
      strings.languageHindi,
      strings.languageDutch,
      strings.languageSwedish,
      strings.languageNorwegian,
      strings.languageDanish,
      strings.languageFinnish,
      strings.languagePolish,
      strings.languageTurkish,
      strings.languageGreek,
      strings.languageOther,
    ];

    return VitSelect(
      id: id ?? 'language',
      label: label ?? strings.language,
      hintText: hintText ?? strings.languageHint,
      initialValue: initialValue,
      options: customLanguages ?? defaultLanguages,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
