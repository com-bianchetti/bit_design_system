import 'package:vit_design_system/config/vit_types.dart';
import 'package:flutter/material.dart';

class VitConfiguration {
  final bool showSwitchItemBorder;
  final bool showSwitchItemBackground;
  final bool showCheckboxItemBorder;
  final bool showCheckboxItemBackground;
  final bool showRadioItemBorder;
  final bool showRadioItemBackground;
  final bool showSliderItemBorder;
  final bool showSliderItemBackground;
  final bool showInputBorder;
  final bool showInputBackground;
  final bool showCardBorder;
  final VitCheckboxShape checkboxShape;
  final VitInputMode inputMode;
  final TextStyle? inputLabelStyle;
  final Widget? formBackArrowIcon;

  const VitConfiguration({
    this.showSwitchItemBorder = true,
    this.showSwitchItemBackground = true,
    this.showCheckboxItemBorder = true,
    this.showCheckboxItemBackground = true,
    this.showRadioItemBorder = true,
    this.showRadioItemBackground = true,
    this.showSliderItemBorder = true,
    this.showSliderItemBackground = true,
    this.showInputBorder = true,
    this.showInputBackground = true,
    this.showCardBorder = true,
    this.checkboxShape = VitCheckboxShape.square,
    this.inputMode = VitInputMode.floatingLabel,
    this.inputLabelStyle,
    this.formBackArrowIcon,
  });
}
