import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A convenience wrapper of [VitInput] with pre-defined properties,
/// validations and definitions for a search field.
class VitSearchField extends StatefulWidget {
  /// The initial value of the search field.
  final String? initialValue;

  /// The label text displayed above or inside the input.
  ///
  /// If not provided, defaults to the localized 'Search' string.
  final String? label;

  /// The hint text displayed when the input is empty.
  ///
  /// If not provided, defaults to the localized search hint string.
  final String? hintText;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the input's value in the form data map. Defaults to 'search'.
  final String? id;

  /// Callback function invoked when the input value changes.
  final ValueChanged<String>? onChanged;

  /// Callback function invoked when the search field is cleared.
  final VoidCallback? onClear;

  /// The controller for the text field.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? controller;

  /// Whether to autofocus the search input.
  ///
  /// Defaults to false.
  final bool autofocus;

  /// Whether the search field is in a skeleton loading state.
  ///
  /// Defaults to false.
  final bool isLoading;

  /// Creates a [VitSearchField].
  const VitSearchField({
    super.key,
    this.initialValue,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.onClear,
    this.controller,
    this.autofocus = false,
    this.isLoading = false,
  });

  @override
  State<VitSearchField> createState() => _VitSearchFieldState();
}

class _VitSearchFieldState extends State<VitSearchField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
  }

  void _handleClear() {
    _controller.clear();
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitInput(
      id: widget.id ?? 'search',
      controller: _controller,
      label: widget.label ?? strings.search,
      hintText: widget.hintText ?? strings.searchHint,
      leading: const Icon(Icons.search),
      autofocus: widget.autofocus,
      isLoading: widget.isLoading,
      trailing: _hasText
          ? IconButton(
              icon: const Icon(Icons.clear),
              onPressed: _handleClear,
            )
          : null,
      onChanged: widget.onChanged,
    );
  }
}
