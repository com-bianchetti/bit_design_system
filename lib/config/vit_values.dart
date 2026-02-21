import 'package:flutter/material.dart';

class VitValues {
  final double buttonComfortableHeight;
  final double buttonStandardHeight;
  final double buttonCompactHeight;
  final double avatarCompactRadius;
  final double avatarComfortableRadius;
  final double avatarStandardRadius;
  final double rawInputComfortableFontSize;
  final double rawInputStandardFontSize;
  final double rawInputCompactFontSize;
  final double popoverBorderRadius;
  final EdgeInsetsGeometry badgeCountComfortablePadding;
  final EdgeInsetsGeometry badgeComfortablePadding;
  final EdgeInsetsGeometry badgeCountStandardPadding;
  final EdgeInsetsGeometry badgeStandardPadding;
  final EdgeInsetsGeometry badgeCountCompactPadding;
  final EdgeInsetsGeometry badgeCompactPadding;
  final EdgeInsetsGeometry inputComfortablePadding;
  final EdgeInsetsGeometry inputStandardPadding;
  final EdgeInsetsGeometry inputCompactPadding;
  final EdgeInsetsGeometry selectItemComfortablePadding;
  final EdgeInsetsGeometry selectItemStandardPadding;
  final EdgeInsetsGeometry selectItemCompactPadding;
  final EdgeInsetsGeometry chipComfortablePadding;
  final EdgeInsetsGeometry chipStandardPadding;
  final EdgeInsetsGeometry chipCompactPadding;
  final EdgeInsetsGeometry accordionHeaderComfortablePadding;
  final EdgeInsetsGeometry accordionHeaderStandardPadding;
  final EdgeInsetsGeometry accordionHeaderCompactPadding;
  final EdgeInsetsGeometry accordionBodyComfortablePadding;
  final EdgeInsetsGeometry accordionBodyStandardPadding;
  final EdgeInsetsGeometry accordionBodyCompactPadding;
  final EdgeInsetsGeometry toastComfortablePadding;
  final EdgeInsetsGeometry toastStandardPadding;
  final EdgeInsetsGeometry toastCompactPadding;
  final EdgeInsetsGeometry toastComfortableMargin;
  final EdgeInsetsGeometry toastStandardMargin;
  final EdgeInsetsGeometry toastCompactMargin;
  final EdgeInsetsGeometry cardComfortablePadding;
  final EdgeInsetsGeometry cardStandardPadding;
  final EdgeInsetsGeometry cardCompactPadding;
  final double loadingComfortableSize;
  final double loadingStandardSize;
  final double loadingCompactSize;
  final double loadingComfortableStrokeWidth;
  final double loadingStandardStrokeWidth;
  final double loadingCompactStrokeWidth;
  final double iconButtonComfortableSize;
  final double iconButtonStandardSize;
  final double iconButtonCompactSize;
  final BorderRadius? iconButtonGlobalRadius;

  const VitValues({
    this.buttonComfortableHeight = 65,
    this.buttonStandardHeight = 50,
    this.buttonCompactHeight = 40,
    this.avatarCompactRadius = 18,
    this.avatarComfortableRadius = 26,
    this.avatarStandardRadius = 24,
    this.badgeCountComfortablePadding = const EdgeInsets.all(4),
    this.badgeComfortablePadding = const EdgeInsets.all(6),
    this.badgeCountStandardPadding = const EdgeInsets.all(4),
    this.badgeStandardPadding = const EdgeInsets.all(4),
    this.badgeCountCompactPadding = const EdgeInsets.all(4),
    this.badgeCompactPadding = const EdgeInsets.all(2),
    this.rawInputComfortableFontSize = 28,
    this.rawInputStandardFontSize = 24,
    this.rawInputCompactFontSize = 21,
    this.popoverBorderRadius = 25,
    this.iconButtonGlobalRadius,
    this.inputComfortablePadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 26,
    ),
    this.inputStandardPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 21,
    ),
    this.inputCompactPadding = const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 16,
    ),
    this.selectItemComfortablePadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 20,
    ),
    this.selectItemStandardPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 18,
    ),
    this.selectItemCompactPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
    this.chipComfortablePadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    this.chipStandardPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    this.chipCompactPadding = const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 6,
    ),
    this.accordionHeaderComfortablePadding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    this.accordionHeaderStandardPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    this.accordionHeaderCompactPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.accordionBodyComfortablePadding = const EdgeInsets.all(20),
    this.accordionBodyStandardPadding = const EdgeInsets.all(16),
    this.accordionBodyCompactPadding = const EdgeInsets.all(12),
    this.toastComfortablePadding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 16,
    ),
    this.toastStandardPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.toastCompactPadding = const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 10,
    ),
    this.toastComfortableMargin = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    this.toastStandardMargin = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    this.toastCompactMargin = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12,
    ),
    this.cardComfortablePadding = const EdgeInsets.all(24),
    this.cardStandardPadding = const EdgeInsets.all(16),
    this.cardCompactPadding = const EdgeInsets.all(12),
    this.loadingComfortableSize = 60,
    this.loadingStandardSize = 50,
    this.loadingCompactSize = 40,
    this.loadingComfortableStrokeWidth = 5,
    this.loadingStandardStrokeWidth = 4,
    this.loadingCompactStrokeWidth = 3,
    this.iconButtonComfortableSize = 65,
    this.iconButtonStandardSize = 50,
    this.iconButtonCompactSize = 40,
  });
}
