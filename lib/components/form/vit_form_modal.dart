import 'package:vit_design_system/components/modal/vit_modal.dart';
import 'package:vit_design_system/components/progress/vit_progress.dart';
import 'package:vit_design_system/components/text/vit_text.dart';
import 'package:vit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'vit_form_controller.dart';
import 'vit_form_footer.dart';
import 'vit_form_page.dart';
import 'vit_form_provider.dart';

class VitFormModal {
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
    EdgeInsets contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
  }) async {
    final controller = VitFormController(
      pages: pages,
      autoFocus: autoFocus,
      initialPage: initialPage,
      scrollPhysics: scrollPhysics,
      onPageChanged: onPageChanged,
      canGoBack: canGoBack,
      validateOnPageChange: validateOnPageChange,
      continueButtonText: continueButtonText,
      finishButtonText: finishButtonText,
      backButtonText: backButtonText,
      showBackButton: showBackButton,
    );

    final result = await VitModal.show(
      context,
      useScroll: false,
      header: _VitFormModalHeader(
        controller: controller,
        showPageIndicator: showPageIndicator,
      ),
      content: _VitFormModalContent(
        controller: controller,
        contentPadding: contentPadding,
      ),
      footer: _VitFormModalFooter(
        controller: controller,
      ),
    );

    controller.dispose();
    return result;
  }
}

class _VitFormModalHeader extends StatelessWidget {
  final VitFormController controller;
  final bool showPageIndicator;

  const _VitFormModalHeader({
    required this.controller,
    required this.showPageIndicator,
  });

  void _handleBackButton(BuildContext context) {
    Navigator.pop(context, null);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final currentPage = controller.currentFormPage;

        return SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: context.theme.backgroundColor,
                  border: showPageIndicator
                      ? null
                      : Border(
                          bottom: BorderSide(
                            color: context.theme.borderColor,
                            width: 1,
                          ),
                        ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Material(
                          color: context.theme.backgroundColor,
                          child: IconButton(
                            onPressed: () => _handleBackButton(context),
                            icon:
                                context.theme.configuration.formBackArrowIcon ??
                                const Icon(Icons.arrow_back),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        if (currentPage.title != null)
                          Expanded(
                            child: VitTitleSmall(
                              currentPage.title!,
                              bold: true,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (showPageIndicator)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: VitProgress(
                    key: Key('progress_${controller.currentPage}'),
                    value: (controller.currentPage + 1) / controller.totalPages,
                    minHeight: 4,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _VitFormModalContent extends StatefulWidget {
  final VitFormController controller;
  final EdgeInsets contentPadding;

  const _VitFormModalContent({
    required this.controller,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
  });

  @override
  State<_VitFormModalContent> createState() => _VitFormModalContentState();
}

class _VitFormModalContentState extends State<_VitFormModalContent>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.controller.initializeTabController(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.controller.autoFocus) {
        widget.controller.focusFirstInput(widget.controller.currentPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) {
        return VitFormProvider(
          save: widget.controller.saveFormData,
          formData: widget.controller.formData,
          registerFocus: widget.controller.registerFocus,
          currentPage: widget.controller.currentPage,
          totalPages: widget.controller.totalPages,
          validateCurrentPage: widget.controller.validateCurrentPage,
          nextPage: widget.controller.nextPage,
          previousPage: widget.controller.previousPage,
          jumpToPage: widget.controller.jumpToPage,
          isFirstPage: () => widget.controller.isFirstPage,
          isLastPage: () => widget.controller.isLastPage,
          submit: () {},
          child: Expanded(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).width > 600
                  ? MediaQuery.sizeOf(context).height * 0.55
                  : null,
              child: TabBarView(
                controller: widget.controller.tabController,
                physics:
                    widget.controller.scrollPhysics ??
                    const NeverScrollableScrollPhysics(),
                children: widget.controller.pages.asMap().entries.map((entry) {
                  final index = entry.key;
                  final page = entry.value;

                  return _VitFormPageKeepAlive(
                    child: VitFormPageScope(
                      pageIndex: index,
                      child: Form(
                        key: widget.controller.formKeys[index],
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: widget.contentPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (page.subtitle != null) ...[
                                VitText(
                                  page.subtitle!,
                                ),
                                const SizedBox(height: 24),
                              ],
                              if (page.spacing != null)
                                ...List.generate(
                                  page.children.length,
                                  (childIndex) {
                                    if (childIndex ==
                                        page.children.length - 1) {
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
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _VitFormModalFooter extends StatelessWidget {
  final VitFormController controller;

  const _VitFormModalFooter({
    required this.controller,
  });

  void _handleSubmit(BuildContext context) {
    if (!controller.validateCurrentPage()) {
      return;
    }
    controller.saveCurrentPageData();
    Navigator.of(context).pop(controller.formData);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return VitFormFooter(
          showBackButton: controller.showBackButton,
          isFirstPage: controller.isFirstPage,
          isLastPage: controller.isLastPage,
          backButtonText: controller.getBackButtonText(),
          continueButtonText: controller.getContinueButtonText(),
          onBack: controller.previousPage,
          onContinue: controller.isLastPage
              ? () => _handleSubmit(context)
              : controller.nextPage,
          showShadow: false,
        );
      },
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
