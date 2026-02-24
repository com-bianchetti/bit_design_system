import 'package:flutter/material.dart';
import 'package:vit_design_system/utils/extensions.dart';

/// A customizable tab bar widget that provides a segmented control style.
///
/// The [VitTabBar] displays a row of tabs with a pill-shaped indicator
/// for the selected tab. It adapts to the design system's theme and visual
/// density automatically.
///
/// ## Usage
///
/// ```dart
/// VitTabBar(
///   controller: _tabController,
///   tabs: [
///     Tab(text: 'Charities'),
///     Tab(text: 'Contribution'),
///   ],
/// )
/// ```
class VitTabBar extends StatelessWidget {
  /// Typically a list of two or more [Tab] widgets.
  final List<Widget> tabs;

  /// This widget's selection and animation state.
  final TabController? controller;

  /// An optional callback that's called when the [TabBar] is tapped.
  final ValueChanged<int>? onTap;

  /// Whether this tab bar can be scrolled horizontally.
  final bool isScrollable;

  /// The alignment of the tabs.
  final TabAlignment? tabAlignment;

  /// Background color of the tab bar container.
  ///
  /// If null, uses the theme's elevated card color.
  final Color? backgroundColor;

  /// Color of the active tab indicator pill.
  ///
  /// If null, uses the theme's card color.
  final Color? indicatorColor;

  /// Color of the selected tab label.
  ///
  /// If null, uses the theme's onBackground color.
  final Color? labelColor;

  /// Color of unselected tab labels.
  ///
  /// If null, uses the theme's onBackgroundVariant color.
  final Color? unselectedLabelColor;

  /// Padding around the entire tab bar.
  ///
  /// If null, uses visual density padding from values.
  final EdgeInsetsGeometry? padding;

  /// Padding applied to each tab label.
  final EdgeInsetsGeometry? labelPadding;

  /// Border radius of the tab bar container.
  ///
  /// If null, uses theme's border radius.
  final BorderRadius? borderRadius;

  /// Border radius of the indicator.
  ///
  /// If null, uses theme's border radius.
  final BorderRadius? indicatorRadius;

  /// Shadow for the indicator.
  final List<BoxShadow>? indicatorShadow;

  /// Height of the TabBar container.
  final double? height;

  /// Visual density used to calculate padding if not provided.
  final VisualDensity? visualDensity;

  /// Creates a [VitTabBar].
  const VitTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.onTap,
    this.isScrollable = false,
    this.tabAlignment,
    this.backgroundColor,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.padding,
    this.labelPadding,
    this.borderRadius,
    this.indicatorRadius,
    this.indicatorShadow,
    this.height,
    this.visualDensity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    final effectiveBackgroundColor = backgroundColor ?? theme.cardColor;
    final effectiveIndicatorColor = indicatorColor ?? theme.elevatedCardColor;
    final effectiveLabelColor = labelColor ?? theme.onBackrgroundColor;
    final effectiveUnselectedLabelColor =
        unselectedLabelColor ?? theme.onBackgroundVariantColor;

    final effectiveVisualDensity = visualDensity ?? theme.visualDensity;

    EdgeInsetsGeometry effectivePadding =
        padding ?? theme.values.tabBarStandardPadding;
    if (padding == null) {
      if (effectiveVisualDensity == VisualDensity.compact) {
        effectivePadding = theme.values.tabBarCompactPadding;
      } else if (effectiveVisualDensity == VisualDensity.comfortable) {
        effectivePadding = theme.values.tabBarComfortablePadding;
      }
    }

    final effectiveBorderRadius =
        borderRadius ?? (theme.values.tabBarGlobalRadius ?? theme.borderRadius);
    final effectiveIndicatorRadius =
        indicatorRadius ??
        (theme.values.tabBarGlobalRadius ?? theme.borderRadius);

    final effectiveShadow =
        indicatorShadow ??
        [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ];

    return Container(
      height: height,
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: effectiveBorderRadius,
      ),
      child: TabBar(
        controller: controller,
        onTap: onTap,
        isScrollable: isScrollable,
        tabAlignment: tabAlignment,
        indicator: BoxDecoration(
          color: effectiveIndicatorColor,
          borderRadius: effectiveIndicatorRadius,
          boxShadow: effectiveShadow,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: effectiveLabelColor,
        unselectedLabelColor: effectiveUnselectedLabelColor,
        labelStyle: theme.bodySmall.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: theme.bodySmall,
        labelPadding: labelPadding,
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            return Colors.transparent;
          },
        ),
        tabs: tabs,
      ),
    );
  }
}

/// A convenience widget that integrates a [VitTabBar] with a [TabBarView].
///
/// This widget automatically wraps its children in an [Expanded] layout, allowing
/// the individual views inside the [TabBarView] to dictate their independent scrolling
/// sizes without requiring a hardcoded height on the parent.
///
/// It uses a [DefaultTabController] internally if [controller] is not provided.
class VitTabBarView extends StatelessWidget {
  /// The collection of tabs to display at the top.
  final List<Widget> tabs;

  /// The collection of views to display corresponding to each tab.
  final List<Widget> children;

  /// Optional TabController. If null, a DefaultTabController will be instantiated.
  final TabController? controller;

  /// The initial active tab index (applicable only when [controller] is null).
  final int initialIndex;

  /// Callback generated when a tab is tapped.
  final ValueChanged<int>? onTap;

  /// Whether the TabBar component itself is scrollable horizontally.
  final bool isScrollable;

  /// Same alignment configurations as [VitTabBar.tabAlignment].
  final TabAlignment? tabAlignment;

  /// Background color of the tab bar pill.
  final Color? backgroundColor;

  /// Indicator color for the active tab.
  final Color? indicatorColor;

  /// Label color for active tabs.
  final Color? labelColor;

  /// Label color for inactive tabs.
  final Color? unselectedLabelColor;

  /// Padding applied to the entire TabBar container.
  final EdgeInsetsGeometry? padding;

  /// Optional override for the padding within labels.
  final EdgeInsetsGeometry? labelPadding;

  /// Overrides the container's border radius.
  final BorderRadius? borderRadius;

  /// Overrides the active indicator's border radius.
  final BorderRadius? indicatorRadius;

  /// Overrides the active indicator's shadow.
  final List<BoxShadow>? indicatorShadow;

  /// Creates a vertical layout with a flexible visual density logic applied to the tab header padding.
  final VisualDensity? visualDensity;

  /// Padding applied to the TabBar container.
  final EdgeInsetsGeometry? tabBarPadding;

  /// Creates a [VitTabBarView].
  const VitTabBarView({
    super.key,
    required this.tabs,
    required this.children,
    this.controller,
    this.initialIndex = 0,
    this.onTap,
    this.isScrollable = false,
    this.tabAlignment,
    this.backgroundColor,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.padding,
    this.labelPadding,
    this.borderRadius,
    this.indicatorRadius,
    this.indicatorShadow,
    this.visualDensity,
    this.tabBarPadding,
  }) : assert(
         tabs.length == children.length,
         'The lengths of tabs and children must match.',
       );

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: tabBarPadding ?? EdgeInsets.zero,
          child: VitTabBar(
            tabs: tabs,
            controller: controller,
            onTap: onTap,
            isScrollable: isScrollable,
            tabAlignment: tabAlignment,
            backgroundColor: backgroundColor,
            indicatorColor: indicatorColor,
            labelColor: labelColor,
            unselectedLabelColor: unselectedLabelColor,
            padding: padding,
            labelPadding: labelPadding,
            borderRadius: borderRadius,
            indicatorRadius: indicatorRadius,
            indicatorShadow: indicatorShadow,
            visualDensity: visualDensity,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: children,
          ),
        ),
      ],
    );

    if (controller == null) {
      content = DefaultTabController(
        length: tabs.length,
        initialIndex: initialIndex,
        child: content,
      );
    }

    return content;
  }
}

/// A design system equivalent for Flutter's [Tab] widget, designed to automatically
/// utilize [VitTheme] styling provided by the parent [VitTabBar] or [VitTabBarView].
///
/// Use it in place of standard [Tab] widgets inside the [tabs] property.
class VitTabBarItem extends StatelessWidget implements PreferredSizeWidget {
  /// The standard string text to display on the tab label.
  final String? text;

  /// Custom content to display. Cannot be used simultaneously with [text].
  final Widget? child;

  /// An optional leading icon.
  final Widget? icon;

  /// Margin around the leading icon.
  final EdgeInsetsGeometry? iconMargin;

  /// Explicit height override for the tab.
  final double? height;

  /// Creates a [VitTabBarItem]. Note that [text] and [child] cannot be provided
  /// simultaneously.
  const VitTabBarItem({
    super.key,
    this.text,
    this.child,
    this.icon,
    this.iconMargin = const EdgeInsets.only(bottom: 10.0),
    this.height,
  }) : assert(
         text == null || child == null,
         'Cannot provide both `text` and `child`.',
       );

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: text,
      icon: icon,
      iconMargin: iconMargin,
      height: height,
      child: child,
    );
  }

  @override
  Size get preferredSize {
    if (height != null) {
      return Size.fromHeight(height!);
    }
    return const Size.fromHeight(46.0);
  }
}
