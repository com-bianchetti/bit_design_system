import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitSwitch] with pre-defined properties,
/// definitions for a newsletter field.
class VitNewsletterField extends StatelessWidget {
  /// The initial value of the newsletter field.
  final bool? initialValue;

  /// The title text displayed next to the switch.
  ///
  /// If not provided, defaults to the localized 'Newsletter' string.
  final String? title;

  /// The subtitle text displayed below the title.
  ///
  /// If not provided, defaults to the localized newsletter subtitle string.
  final String? subtitle;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'newsletter'.
  final String? id;

  /// Callback function invoked when the switch value changes.
  final ValueChanged<bool>? onChanged;

  /// Creates a [VitNewsletterField].
  const VitNewsletterField({
    super.key,
    this.initialValue,
    this.title,
    this.subtitle,
    this.id,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitSwitch(
      id: id ?? 'newsletter',
      value: initialValue ?? false,
      title: title ?? strings.newsletter,
      subtitle: subtitle ?? strings.newsletterSubtitle,
      onChanged: onChanged,
    );
  }
}
