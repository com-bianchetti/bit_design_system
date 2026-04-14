import 'package:vit_design_system/components/text/vit_text.dart';
import 'package:flutter/material.dart';

import 'vit_form_controller.dart';
import 'vit_form_footer.dart';
import 'vit_form_modal.dart';
import 'vit_form_page.dart';
import 'vit_form_provider.dart';

export 'vit_form_controller.dart';
export 'vit_form_page.dart';
export 'vit_form_provider.dart';

class VitForm extends StatefulWidget {
  final bool autoFocus;
  final List<VitFormPage> pages;
  final Function(Map<String, dynamic>) onComplete;
  final int initialPage;
  final bool showPageIndicator;
  final ScrollPhysics? scrollPhysics;
  final Function(int)? onPageChanged;
  final bool Function(int)? canGoBack;
  final bool validateOnPageChange;
  final String? continueButtonText;
  final String? finishButtonText;
  final String? backButtonText;
  final bool showBackButton;
  final bool isModal;

  const VitForm({
    super.key,
    this.autoFocus = true,
    this.pages = const [],
    required this.onComplete,
    this.initialPage = 0,
    this.showPageIndicator = false,
    this.scrollPhysics,
    this.onPageChanged,
    this.canGoBack,
    this.validateOnPageChange = true,
    this.continueButtonText,
    this.finishButtonText,
    this.backButtonText,
    this.showBackButton = true,
    this.isModal = false,
  });

  static Future<Map<String, dynamic>?> show(
    BuildContext context, {
    required List<VitFormPage> pages,
    bool autoFocus = true,
    int initialPage = 0,
    bool showPageIndicator = false,
    ScrollPhysics? scrollPhysics,
    Function(int)? onPageChanged,
    bool Function(int)? canGoBack,
    bool validateOnPageChange = true,
    String? continueButtonText,
    String? finishButtonText,
    String? backButtonText,
    bool showBackButton = true,
    EdgeInsets contentPadding = const EdgeInsets.all(16),
  }) {
    return VitFormModal.show(
      context,
      pages: pages,
      autoFocus: autoFocus,
      initialPage: initialPage,
      showPageIndicator: showPageIndicator,
      scrollPhysics: scrollPhysics,
      onPageChanged: onPageChanged,
      canGoBack: canGoBack,
      validateOnPageChange: validateOnPageChange,
      continueButtonText: continueButtonText,
      finishButtonText: finishButtonText,
      backButtonText: backButtonText,
      showBackButton: showBackButton,
      contentPadding: contentPadding,
    );
  }

  @override
  State<VitForm> createState() => _VitFormState();
}

class _VitFormState extends State<VitForm> with SingleTickerProviderStateMixin {
  late final VitFormController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VitFormController(
      pages: widget.pages,
      autoFocus: widget.autoFocus,
      initialPage: widget.initialPage,
      scrollPhysics: widget.scrollPhysics,
      onPageChanged: widget.onPageChanged,
      canGoBack: widget.canGoBack,
      validateOnPageChange: widget.validateOnPageChange,
      continueButtonText: widget.continueButtonText,
      finishButtonText: widget.finishButtonText,
      backButtonText: widget.backButtonText,
      showBackButton: widget.showBackButton,
    );
    _controller.initializeTabController(this);
    _controller.addListener(_onControllerChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.autoFocus) {
        _controller.focusFirstInput(_controller.currentPage);
      }
    });
  }

  void _onControllerChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_controller.validateCurrentPage()) {
      return;
    }
    _controller.saveCurrentPageData();
    widget.onComplete(_controller.formData);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return VitFormProvider(
      save: _controller.saveFormData,
      formData: _controller.formData,
      registerFocus: _controller.registerFocus,
      currentPage: _controller.currentPage,
      totalPages: _controller.totalPages,
      validateCurrentPage: _controller.validateCurrentPage,
      nextPage: _controller.nextPage,
      previousPage: _controller.previousPage,
      jumpToPage: _controller.jumpToPage,
      isFirstPage: () => _controller.isFirstPage,
      isLastPage: () => _controller.isLastPage,
      submit: _submit,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _controller.tabController,
              physics:
                  widget.scrollPhysics ?? const NeverScrollableScrollPhysics(),
              children: widget.pages.asMap().entries.map((entry) {
                final index = entry.key;
                final page = entry.value;

                final child = Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (page.title != null) ...[
                      VitTitle(
                        page.title!,
                        bold: true,
                      ),
                      const SizedBox(height: 8),
                    ],
                    if (page.subtitle != null) ...[
                      VitText(
                        page.subtitle!,
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                    ],
                    if (page.spacing != null)
                      ...List.generate(
                        page.children.length,
                        (childIndex) {
                          if (childIndex == page.children.length - 1) {
                            return page.children[childIndex];
                          }
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: page.spacing!,
                            ),
                            child: page.children[childIndex],
                          );
                        },
                      )
                    else
                      ...page.children,
                    const SizedBox(height: 24),
                  ],
                );

                return _VitFormPageKeepAlive(
                  child: VitFormPageScope(
                    pageIndex: index,
                    child: Form(
                      key: _controller.formKeys[index],
                      child: page.scrollable
                          ? SingleChildScrollView(
                              padding: const EdgeInsets.all(16),
                              child: child,
                            )
                          : Padding(
                              padding: const EdgeInsets.all(16),
                              child: child,
                            ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          VitFormFooter(
            showBackButton: widget.showBackButton,
            isFirstPage: _controller.isFirstPage,
            isLastPage: _controller.isLastPage,
            backButtonText: _controller.getBackButtonText(),
            continueButtonText: _controller.getContinueButtonText(),
            onBack: _controller.previousPage,
            onContinue: _controller.isLastPage ? _submit : _controller.nextPage,
          ),
        ],
      ),
    );
  }
}

class _VitFormPageKeepAlive extends StatefulWidget {
  final Widget child;

  const _VitFormPageKeepAlive({required this.child});

  @override
  State<_VitFormPageKeepAlive> createState() => _VitFormPageKeepAliveState();
}

class _VitFormPageKeepAliveState extends State<_VitFormPageKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
