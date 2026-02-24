import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitDate] with pre-defined properties,
/// validations and definitions for a date range field.
class VitDateRangeField extends StatelessWidget {
  /// The initial start date of the date range field.
  final DateTime? initialRangeStart;

  /// The initial end date of the date range field.
  final DateTime? initialRangeEnd;

  /// Validator function for form validation.
  ///
  /// If not provided, defaults to checking for required condition.
  final FormFieldValidator<VitDateData>? validator;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Date Range' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized date range hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'dateRange'.
  final String? id;

  /// Callback function invoked when the date range selection changes.
  final void Function(DateTime? start, DateTime? end)? onRangeChanged;

  /// Creates a [VitDateRangeField].
  const VitDateRangeField({
    super.key,
    this.initialRangeStart,
    this.initialRangeEnd,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onRangeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitDate(
      id: id ?? 'dateRange',
      label: label ?? strings.dateRange,
      hintText: hintText ?? strings.dateRangeHint,
      initialRangeStart: initialRangeStart,
      initialRangeEnd: initialRangeEnd,
      rangeSelection: true,
      onRangeChanged: onRangeChanged,
      validator: validator,
    );
  }
}
