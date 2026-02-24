import 'package:flutter/material.dart';

class VitFormPage {
  final String? title;
  final String? subtitle;
  final List<Widget> children;
  final IconData? icon;
  final String? buttonText;
  final String? continueButtonText;
  final String? backButtonText;
  final bool Function()? customValidator;
  final double? spacing;
  final bool scrollable;

  const VitFormPage({
    this.title,
    this.subtitle,
    this.icon,
    this.buttonText,
    this.continueButtonText,
    this.backButtonText,
    this.customValidator,
    this.children = const [],
    this.spacing,
    this.scrollable = true,
  });
}
