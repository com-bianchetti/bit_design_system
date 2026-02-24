import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A currency field with a large raw input and a virtual numeric keyboard.
///
/// Designed to be used for money transfer amounts or any place where a
/// prominent numeric entry is required. It automatically formats the input
/// with the currency symbol and decimal separators as the user types on
/// the virtual keyboard.
class VitCurrencyField extends StatefulWidget {
  /// The initial value of the currency field.
  final String? initialValue;

  /// Validator function for form validation.
  final FormFieldValidator<String>? validator;

  /// Unique identifier for form data collection.
  final String? id;

  /// Callback function invoked when the input value changes.
  final ValueChanged<String>? onChanged;

  /// The currency symbol to display as a prefix.
  /// Defaults to '$'.
  final String currencySymbol;

  /// The character used to separate decimal part from integer part.
  /// Defaults to ','.
  final String decimalSeparator;

  /// The character used to separate thousands.
  /// Defaults to '.'.
  final String thousandSeparator;

  /// The color of the virtual keyboard buttons.
  /// If null, defaults to [VitTheme.cardColor].
  final Color? keyButtonColor;

  /// The color of the text on the virtual keyboard buttons.
  /// If null, defaults to [VitTheme.onBackrgroundColor].
  final Color? keyTextColor;

  /// The border radius of the virtual keyboard buttons.
  /// If null, defaults to 12.0.
  final double? keyRadius;

  /// The height of each keyboard row.
  /// Defaults to 64.0.
  final double keyHeight;

  /// An optional subtitle or label to show below the currency amount.
  /// E.g. "Balance: $10,000".
  final String? subtitle;

  /// The font size for the large numeric input.
  /// Defaults to 48.0.
  final double inputFontSize;

  /// Use this property to set a fixed height if the widget is placed
  /// inside an unbounded container (like a ListView).
  /// If this widget is placed in a bounded container (like an Expanded or fixed height Container),
  /// it will automatically expand to fill the space and pin the keyboard to the bottom.
  final double defaultUnboundedHeight;

  /// Optional header widget to display above the currency amount.
  final Widget? header;

  /// Whether the widget should expand to fill the available space.
  final bool expand;

  /// Creates a [VitCurrencyField].
  const VitCurrencyField({
    super.key,
    this.initialValue,
    this.validator,
    this.id,
    this.onChanged,
    this.currencySymbol = '\$',
    this.decimalSeparator = ',',
    this.thousandSeparator = '.',
    this.keyButtonColor,
    this.keyTextColor,
    this.keyRadius,
    this.keyHeight = 64.0,
    this.subtitle,
    this.inputFontSize = 48.0,
    this.defaultUnboundedHeight = 500.0,
    this.header,
    this.expand = true,
  });

  @override
  State<VitCurrencyField> createState() => _VitCurrencyFieldState();
}

class _VitCurrencyFieldState extends State<VitCurrencyField> {
  late final TextEditingController _controller;
  int _cents = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      final cleanText = widget.initialValue!.replaceAll(RegExp(r'[^\d]'), '');
      if (cleanText.isNotEmpty) {
        _cents = int.parse(cleanText);
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _updateDisplay();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleKeyPress(String key) {
    setState(() {
      if (key == 'backspace') {
        _cents = _cents ~/ 10;
      } else if (key == '000') {
        _cents = _cents * 1000;
      } else {
        final num = int.tryParse(key);
        if (num != null) {
          _cents = (_cents * 10) + num;
        }
      }
    });
    _updateDisplay();
  }

  void _updateDisplay() {
    final decimalValue = _cents / 100;
    final parts = decimalValue.toStringAsFixed(2).split('.');
    final integerPart = parts[0];
    final decimalPart = parts[1];

    final buffer = StringBuffer();
    final length = integerPart.length;
    for (int i = 0; i < length; i++) {
      if (i > 0 && (length - i) % 3 == 0) {
        buffer.write(widget.thousandSeparator);
      }
      buffer.write(integerPart[i]);
    }

    final formattedInteger = buffer.toString();
    final displayText =
        '${widget.currencySymbol}$formattedInteger${widget.decimalSeparator}$decimalPart';
    _controller.text = displayText;

    final stringValue = decimalValue.toString();
    if (widget.id != null) {
      final form = VitFormProvider.maybeOf(context);
      form?.save(widget.id!, stringValue);
    }
    widget.onChanged?.call(stringValue);
  }

  @override
  Widget build(BuildContext context) {
    final child = LayoutBuilder(
      builder: (context, constraints) {
        final isUnbounded = constraints.maxHeight == double.infinity;

        final content = Column(
          children: [
            if (widget.header != null) ...[
              widget.header!,
              const SizedBox(height: 16),
            ],
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: VitRawInput(
                      controller: _controller,
                      readOnly: true,
                      textAlign: TextAlign.center,
                      fontSize: widget.inputFontSize,
                      fontWeight: FontWeight.bold,
                      id: widget.id != null ? '${widget.id}_raw' : null,
                      validator: widget.validator,
                    ),
                  ),
                  if (widget.subtitle != null) ...[
                    const SizedBox(height: 8),
                    VitText(
                      widget.subtitle!,
                      style: context.theme.body.copyWith(
                        color: context.theme.onBackgroundVariantColor,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            _buildKeyboard(context),
          ],
        );

        if (isUnbounded) {
          return SizedBox(
            height: widget.defaultUnboundedHeight,
            child: content,
          );
        }

        return content;
      },
    );

    if (widget.expand) {
      return Expanded(child: child);
    }
    return child;
  }

  Widget _buildKeyboard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [_key('1'), _key('2'), _key('3')]),
          const SizedBox(height: 8),
          Row(children: [_key('4'), _key('5'), _key('6')]),
          const SizedBox(height: 8),
          Row(children: [_key('7'), _key('8'), _key('9')]),
          const SizedBox(height: 8),
          Row(
            children: [_key('000', fontSize: 20), _key('0'), _backspaceKey()],
          ),
        ],
      ),
    );
  }

  Widget _key(String text, {double fontSize = 28}) {
    final theme = context.theme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Material(
          color: widget.keyButtonColor ?? theme.cardColor,
          borderRadius: BorderRadius.circular(widget.keyRadius ?? 12),
          child: InkWell(
            borderRadius: BorderRadius.circular(widget.keyRadius ?? 12),
            onTap: () => _handleKeyPress(text),
            child: Container(
              height: widget.keyHeight,
              alignment: Alignment.center,
              child: VitText(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: widget.keyTextColor ?? theme.onBackrgroundColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _backspaceKey() {
    final theme = context.theme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Material(
          color: widget.keyButtonColor ?? theme.cardColor,
          borderRadius: BorderRadius.circular(widget.keyRadius ?? 12),
          child: InkWell(
            borderRadius: BorderRadius.circular(widget.keyRadius ?? 12),
            onTap: () => _handleKeyPress('backspace'),
            child: Container(
              height: widget.keyHeight,
              alignment: Alignment.center,
              child: Icon(
                Icons.backspace_outlined,
                color: widget.keyTextColor ?? theme.onBackrgroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
