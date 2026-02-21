import 'package:flutter/material.dart';
import 'package:vit_design_system/components/skeleton/vit_loading_scope.dart';
import 'package:vit_design_system/components/skeleton/vit_skeleton_shimmer.dart';
import 'package:vit_design_system/components/text/vit_text.dart';
import 'package:vit_design_system/utils/extensions.dart';

/// Represents a navigation item for [VitBottomBar].
///
/// Contains all the information needed to render a navigation item
/// in both bottom bar and side bar modes.
class VitBottomBarItem {
  /// The icon to display when the item is not selected.
  final IconData icon;

  /// The icon to display when the item is selected.
  ///
  /// If null, [icon] will be used for both states.
  final IconData? selectedIcon;

  /// The label text for the item.
  final String label;

  /// Optional badge text to display on the item.
  final String? badge;

  /// Optional badge color.
  final Color? badgeColor;

  /// Optional tooltip text.
  final String? tooltip;

  /// Whether this item is enabled.
  final bool enabled;

  /// Creates a [VitBottomBarItem].
  const VitBottomBarItem({
    required this.icon,
    this.selectedIcon,
    required this.label,
    this.badge,
    this.badgeColor,
    this.tooltip,
    this.enabled = true,
  });
}

/// Defines the visual variant of the navigation bar.
enum VitBottomBarVariant {
  /// Standard appearance using theme's card color.
  standard,

  /// Elevated appearance using theme's elevated card color.
  elevated,

  /// Uses primary color as background.
  primary,

  /// Transparent background.
  transparent,

  /// Displays the items with a dot instead of an icon.
  dot,
}

/// Defines the label behavior for the bottom navigation bar.
enum VitBottomBarLabelBehavior {
  /// Always show labels.
  alwaysShow,

  /// Show labels only when selected.
  showOnlySelected,

  /// Never show labels.
  neverShow,
}

/// Defines the animation type for item transitions.
enum VitBottomBarAnimation {
  /// No animation.
  none,

  /// Fade animation.
  fade,

  /// Scale animation.
  scale,

  /// Slide animation.
  slide,

  /// Combined fade and scale animation.
  fadeScale,
}

/// Defines the position of the sidebar.
enum VitSideBarPosition {
  /// Sidebar on the left side.
  left,

  /// Sidebar on the right side.
  right,
}

/// Defines the style variant for sidebar items.
enum VitSideBarItemStyle {
  /// Standard list-style items.
  standard,

  /// Rounded pill-style items.
  rounded,

  /// Items with an indicator bar.
  indicator,
}

/// Builder function type for customizing navigation items.
typedef VitBottomBarItemBuilder =
    Widget Function(
      BuildContext context,
      VitBottomBarItem item,
      int index,
      bool isSelected,
      VoidCallback onTap,
    );

/// Builder function type for customizing sidebar items.
typedef VitSideBarItemBuilder =
    Widget Function(
      BuildContext context,
      VitBottomBarItem item,
      int index,
      bool isSelected,
      VoidCallback onTap,
      bool isExpanded,
    );

/// Builder function type for customizing the sidebar header.
typedef VitSideBarHeaderBuilder =
    Widget Function(
      BuildContext context,
      bool isExpanded,
    );

/// Builder function type for customizing the sidebar footer.
typedef VitSideBarFooterBuilder =
    Widget Function(
      BuildContext context,
      bool isExpanded,
    );

/// A responsive navigation component that renders a bottom navigation bar
/// on phones and a sidebar on tablets/larger screens.
///
/// The [VitBottomBar] provides a highly customizable navigation experience
/// with support for:
/// - Responsive layout switching based on breakpoint
/// - Custom item builders for both bottom bar and sidebar
/// - Multiple visual variants and animations
/// - Expandable/collapsible sidebar
/// - Custom header and footer for sidebar
/// - Loading states with skeleton shimmer
///
/// ## Usage
///
/// ### Basic Usage
///
/// ```dart
/// VitBottomBar(
///   currentIndex: _currentIndex,
///   onIndexChanged: (index) => setState(() => _currentIndex = index),
///   items: [
///     VitBottomBarItem(icon: Icons.home, label: 'Home'),
///     VitBottomBarItem(icon: Icons.search, label: 'Search'),
///     VitBottomBarItem(icon: Icons.settings, label: 'Settings'),
///   ],
/// )
/// ```
///
/// ### With Custom Breakpoint
///
/// ```dart
/// VitBottomBar(
///   currentIndex: _currentIndex,
///   onIndexChanged: (index) => setState(() => _currentIndex = index),
///   tabletBreakpoint: 800,
///   items: [
///     VitBottomBarItem(icon: Icons.home, label: 'Home'),
///     VitBottomBarItem(icon: Icons.search, label: 'Search'),
///   ],
/// )
/// ```
///
/// ### With Custom Item Builder
///
/// ```dart
/// VitBottomBar(
///   currentIndex: _currentIndex,
///   onIndexChanged: (index) => setState(() => _currentIndex = index),
///   bottomBarItemBuilder: (context, item, index, isSelected, onTap) {
///     return IconButton(
///       icon: Icon(isSelected ? item.selectedIcon ?? item.icon : item.icon),
///       onPressed: onTap,
///     );
///   },
///   items: [
///     VitBottomBarItem(icon: Icons.home, label: 'Home'),
///   ],
/// )
/// ```
///
/// ## Customization
///
/// - Use [tabletBreakpoint] to control when to switch between bottom bar and sidebar
/// - Use [variant] to change the visual appearance
/// - Use [animation] to customize item transition animations
/// - Use [bottomBarItemBuilder] for custom bottom bar items
/// - Use [sideBarItemBuilder] for custom sidebar items
/// - Use [sideBarHeaderBuilder] and [sideBarFooterBuilder] for sidebar header/footer
/// - Use [sideBarExpandable] to enable collapsible sidebar
class VitBottomBar extends StatefulWidget {
  /// The list of navigation items.
  final List<VitBottomBarItem> items;

  /// The currently selected index.
  final int currentIndex;

  /// Callback when the selected index changes.
  final ValueChanged<int>? onIndexChanged;

  /// Screen width breakpoint for switching to sidebar layout.
  ///
  /// When screen width exceeds this value, sidebar is shown instead of bottom bar.
  /// Defaults to 600.0.
  final double tabletBreakpoint;

  /// Visual variant of the navigation bar.
  ///
  /// Defaults to [VitBottomBarVariant.standard].
  final VitBottomBarVariant variant;

  /// Animation type for item transitions.
  ///
  /// Defaults to [VitBottomBarAnimation.fadeScale].
  final VitBottomBarAnimation animation;

  /// Duration of the animation.
  ///
  /// Defaults to 200 milliseconds.
  final Duration animationDuration;

  /// Animation curve.
  ///
  /// Defaults to [Curves.easeInOut].
  final Curve animationCurve;

  /// Label behavior for bottom bar.
  ///
  /// Defaults to [VitBottomBarLabelBehavior.alwaysShow].
  final VitBottomBarLabelBehavior labelBehavior;

  /// Custom builder for bottom bar items.
  ///
  /// When provided, allows complete customization of item appearance.
  final VitBottomBarItemBuilder? bottomBarItemBuilder;

  /// Custom builder for sidebar items.
  ///
  /// When provided, allows complete customization of sidebar item appearance.
  final VitSideBarItemBuilder? sideBarItemBuilder;

  /// Custom builder for sidebar header.
  final VitSideBarHeaderBuilder? sideBarHeaderBuilder;

  /// Custom builder for sidebar footer.
  final VitSideBarFooterBuilder? sideBarFooterBuilder;

  /// Position of the sidebar.
  ///
  /// Defaults to [VitSideBarPosition.left].
  final VitSideBarPosition sideBarPosition;

  /// Style variant for sidebar items.
  ///
  /// Defaults to [VitSideBarItemStyle.rounded].
  final VitSideBarItemStyle sideBarItemStyle;

  /// Whether the sidebar can be expanded/collapsed.
  ///
  /// Defaults to true.
  final bool sideBarExpandable;

  /// Initial expanded state of the sidebar.
  ///
  /// Defaults to true.
  final bool sideBarInitiallyExpanded;

  /// Width of the sidebar when expanded.
  ///
  /// Defaults to 250.
  final double sideBarExpandedWidth;

  /// Width of the sidebar when collapsed.
  ///
  /// Defaults to 72.
  final double sideBarCollapsedWidth;

  /// Background color for the navigation bar.
  ///
  /// If null, uses color based on [variant].
  final Color? backgroundColor;

  /// Color for selected items.
  ///
  /// If null, uses theme's primary color.
  final Color? selectedColor;

  /// Color for unselected items.
  ///
  /// If null, uses theme's onBackgroundVariantColor.
  final Color? unselectedColor;

  /// Elevation of the navigation bar.
  ///
  /// Defaults to 0.
  final double elevation;

  /// Height of the bottom navigation bar.
  ///
  /// If null, uses default height based on label behavior.
  final double? bottomBarHeight;

  /// Padding for the navigation bar.
  final EdgeInsetsGeometry? padding;

  /// Border radius for the navigation bar.
  final BorderRadius? borderRadius;

  /// Whether to show a border around the navigation bar.
  final bool showBorder;

  /// Border color.
  final Color? borderColor;

  /// Border width.
  final double borderWidth;

  /// Whether to show divider between sidebar and content.
  final bool showSideBarDivider;

  /// Color of the sidebar divider.
  final Color? sideBarDividerColor;

  /// Icon size for navigation items.
  final double iconSize;

  /// Font size for labels.
  final double? labelFontSize;

  /// Whether the navigation bar is in loading state.
  ///
  /// When true, displays skeleton shimmer effect.
  final bool isLoading;

  /// Semantic label for accessibility.
  final String? semanticLabel;

  /// Whether to enable haptic feedback on selection.
  final bool enableHapticFeedback;

  /// Creates a [VitBottomBar].
  const VitBottomBar({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onIndexChanged,
    this.tabletBreakpoint = 600.0,
    this.variant = VitBottomBarVariant.standard,
    this.animation = VitBottomBarAnimation.fadeScale,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.labelBehavior = VitBottomBarLabelBehavior.alwaysShow,
    this.bottomBarItemBuilder,
    this.sideBarItemBuilder,
    this.sideBarHeaderBuilder,
    this.sideBarFooterBuilder,
    this.sideBarPosition = VitSideBarPosition.left,
    this.sideBarItemStyle = VitSideBarItemStyle.rounded,
    this.sideBarExpandable = true,
    this.sideBarInitiallyExpanded = true,
    this.sideBarExpandedWidth = 250,
    this.sideBarCollapsedWidth = 72,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.elevation = 0,
    this.bottomBarHeight,
    this.padding,
    this.borderRadius,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth = 1.0,
    this.showSideBarDivider = true,
    this.sideBarDividerColor,
    this.iconSize = 24,
    this.labelFontSize,
    this.isLoading = false,
    this.semanticLabel,
    this.enableHapticFeedback = true,
  });

  @override
  State<VitBottomBar> createState() => VitBottomBarState();
}

/// State for [VitBottomBar].
///
/// Provides access to the sidebar expanded state through [isExpanded]
/// and allows programmatic control via [toggleSideBar].
class VitBottomBarState extends State<VitBottomBar>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  /// Whether the sidebar is currently expanded.
  bool get isExpanded => _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.sideBarInitiallyExpanded;
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve,
    );
    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Toggles the sidebar expanded state.
  void toggleSideBar() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  /// Sets the sidebar expanded state.
  void setSideBarExpanded(bool expanded) {
    if (_isExpanded != expanded) {
      toggleSideBar();
    }
  }

  void _onItemTap(int index) {
    if (widget.items[index].enabled && widget.onIndexChanged != null) {
      if (widget.enableHapticFeedback) {
        Feedback.forTap(context);
      }
      widget.onIndexChanged!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final effectiveLoading =
        widget.isLoading || VitLoadingScope.isLoading(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= widget.tabletBreakpoint;

    if (effectiveLoading) {
      return _buildLoadingState(context, isTablet);
    }

    final effectiveBackgroundColor =
        widget.backgroundColor ?? _getVariantColor(theme);
    final effectiveSelectedColor = widget.selectedColor ?? theme.primaryColor;
    final effectiveUnselectedColor =
        widget.unselectedColor ?? theme.onBackgroundVariantColor;

    Widget navigation;
    if (isTablet) {
      navigation = _buildSideBar(
        context,
        effectiveBackgroundColor,
        effectiveSelectedColor,
        effectiveUnselectedColor,
      );
    } else {
      navigation = _buildBottomBar(
        context,
        effectiveBackgroundColor,
        effectiveSelectedColor,
        effectiveUnselectedColor,
      );
    }

    if (widget.semanticLabel != null) {
      navigation = Semantics(
        label: widget.semanticLabel,
        container: true,
        child: navigation,
      );
    }

    return navigation;
  }

  Color _getVariantColor(dynamic theme) {
    return switch (widget.variant) {
      VitBottomBarVariant.standard => theme.cardColor,
      VitBottomBarVariant.elevated => theme.elevatedCardColor,
      VitBottomBarVariant.primary => theme.primaryColor,
      VitBottomBarVariant.transparent => Colors.transparent,
      VitBottomBarVariant.dot => theme.cardColor,
    };
  }

  Widget _buildLoadingState(BuildContext context, bool isTablet) {
    final theme = context.theme;

    if (isTablet) {
      return VitSkeletonShimmer(
        child: Container(
          width: _isExpanded
              ? widget.sideBarExpandedWidth
              : widget.sideBarCollapsedWidth,
          color: theme.skeletonBaseColor,
          child: Column(
            children: [
              const SizedBox(height: 16),
              ...List.generate(
                widget.items.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: theme.skeletonHighlightColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return VitSkeletonShimmer(
      child: Container(
        height: widget.bottomBarHeight ?? 80,
        color: theme.skeletonBaseColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            widget.items.length,
            (index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: widget.iconSize,
                  height: widget.iconSize,
                  decoration: BoxDecoration(
                    color: theme.skeletonHighlightColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 40,
                  height: 12,
                  decoration: BoxDecoration(
                    color: theme.skeletonHighlightColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(
    BuildContext context,
    Color backgroundColor,
    Color selectedColor,
    Color unselectedColor,
  ) {
    final theme = context.theme;
    final effectiveBorderRadius =
        widget.borderRadius ??
        const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        );

    final bottomBarHeight =
        widget.bottomBarHeight ??
        (widget.labelBehavior == VitBottomBarLabelBehavior.neverShow ? 64 : 80);

    return Material(
      elevation: widget.elevation,
      color: backgroundColor,
      child: Container(
        height: bottomBarHeight,
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: effectiveBorderRadius,
          border: widget.showBorder
              ? Border.all(
                  color: widget.borderColor ?? theme.borderColor,
                  width: widget.borderWidth,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.items.length, (index) {
            final item = widget.items[index];
            final isSelected = index == widget.currentIndex;

            if (widget.bottomBarItemBuilder != null) {
              return widget.bottomBarItemBuilder!(
                context,
                item,
                index,
                isSelected,
                () => _onItemTap(index),
              );
            }

            return _buildBottomBarItem(
              context,
              item,
              index,
              isSelected,
              selectedColor,
              unselectedColor,
            );
          }),
        ),
      ),
    );
  }

  Widget _buildBottomBarItem(
    BuildContext context,
    VitBottomBarItem item,
    int index,
    bool isSelected,
    Color selectedColor,
    Color unselectedColor,
  ) {
    final theme = context.theme;
    final effectiveColor = item.enabled
        ? (isSelected ? selectedColor : unselectedColor)
        : theme.disabledColor;

    final showLabel =
        widget.labelBehavior == VitBottomBarLabelBehavior.alwaysShow ||
        (widget.labelBehavior == VitBottomBarLabelBehavior.showOnlySelected &&
            isSelected);

    Widget itemWidget = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.variant == VitBottomBarVariant.dot
          ? [
              if (showLabel) ...[
                VitText(
                  item.label,
                  style: theme.bodySmall.copyWith(
                    color: effectiveColor,
                    fontSize: widget.labelFontSize ?? 14,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 6),
              ],
              AnimatedContainer(
                duration: widget.animationDuration,
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: isSelected ? effectiveColor : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ]
          : [
              _buildAnimatedIcon(
                context,
                item,
                isSelected,
                effectiveColor,
              ),
              if (showLabel) ...[
                const SizedBox(height: 4),
                VitText(
                  item.label,
                  style: theme.bodySmall.copyWith(
                    color: effectiveColor,
                    fontSize: widget.labelFontSize ?? 12,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ],
            ],
    );

    if (item.badge != null) {
      itemWidget = Stack(
        clipBehavior: Clip.none,
        children: [
          itemWidget,
          Positioned(
            top: -4,
            right: -8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: item.badgeColor ?? theme.errorColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: VitText(
                item.badge!,
                style: theme.labelSmall.copyWith(
                  color: theme.onPrimaryColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget button = InkWell(
      onTap: item.enabled ? () => _onItemTap(index) : null,
      borderRadius: BorderRadius.circular(12),
      splashFactory: NoSplash.splashFactory,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: itemWidget,
      ),
    );

    if (item.tooltip != null) {
      button = Tooltip(
        message: item.tooltip!,
        child: button,
      );
    }

    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: Expanded(child: button),
    );
  }

  Widget _buildAnimatedIcon(
    BuildContext context,
    VitBottomBarItem item,
    bool isSelected,
    Color color,
  ) {
    final icon = Icon(
      isSelected ? (item.selectedIcon ?? item.icon) : item.icon,
      size: widget.iconSize,
      color: color,
    );

    return switch (widget.animation) {
      VitBottomBarAnimation.none => icon,
      VitBottomBarAnimation.fade => AnimatedOpacity(
        opacity: isSelected ? 1.0 : 0.7,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
        child: icon,
      ),
      VitBottomBarAnimation.scale => AnimatedScale(
        scale: isSelected ? 1.1 : 1.0,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
        child: icon,
      ),
      VitBottomBarAnimation.slide => AnimatedSlide(
        offset: isSelected ? Offset.zero : const Offset(0, 0.1),
        duration: widget.animationDuration,
        curve: widget.animationCurve,
        child: icon,
      ),
      VitBottomBarAnimation.fadeScale => AnimatedScale(
        scale: isSelected ? 1.1 : 1.0,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
        child: AnimatedOpacity(
          opacity: isSelected ? 1.0 : 0.7,
          duration: widget.animationDuration,
          curve: widget.animationCurve,
          child: icon,
        ),
      ),
    };
  }

  Widget _buildSideBar(
    BuildContext context,
    Color backgroundColor,
    Color selectedColor,
    Color unselectedColor,
  ) {
    final theme = context.theme;

    return AnimatedBuilder(
      animation: _expandAnimation,
      builder: (context, child) {
        final width = _isExpanded
            ? widget.sideBarExpandedWidth
            : widget.sideBarCollapsedWidth;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.sideBarPosition == VitSideBarPosition.right &&
                widget.showSideBarDivider)
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: widget.sideBarDividerColor ?? theme.borderColor,
              ),
            Material(
              elevation: widget.elevation,
              color: backgroundColor,
              child: AnimatedContainer(
                duration: widget.animationDuration,
                curve: widget.animationCurve,
                width: width,
                decoration: BoxDecoration(
                  border: widget.showBorder
                      ? Border.all(
                          color: widget.borderColor ?? theme.borderColor,
                          width: widget.borderWidth,
                        )
                      : null,
                ),
                child: Column(
                  children: [
                    if (widget.sideBarHeaderBuilder != null)
                      widget.sideBarHeaderBuilder!(context, _isExpanded),
                    if (widget.sideBarExpandable)
                      _buildExpandButton(context, backgroundColor),
                    Expanded(
                      child: ListView.builder(
                        padding:
                            widget.padding ??
                            const EdgeInsets.symmetric(vertical: 8),
                        itemCount: widget.items.length,
                        itemBuilder: (context, index) {
                          final item = widget.items[index];
                          final isSelected = index == widget.currentIndex;

                          if (widget.sideBarItemBuilder != null) {
                            return widget.sideBarItemBuilder!(
                              context,
                              item,
                              index,
                              isSelected,
                              () => _onItemTap(index),
                              _isExpanded,
                            );
                          }

                          return _buildSideBarItem(
                            context,
                            item,
                            index,
                            isSelected,
                            selectedColor,
                            unselectedColor,
                          );
                        },
                      ),
                    ),
                    if (widget.sideBarFooterBuilder != null)
                      widget.sideBarFooterBuilder!(context, _isExpanded),
                  ],
                ),
              ),
            ),
            if (widget.sideBarPosition == VitSideBarPosition.left &&
                widget.showSideBarDivider)
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: widget.sideBarDividerColor ?? theme.borderColor,
              ),
          ],
        );
      },
    );
  }

  Widget _buildExpandButton(BuildContext context, Color backgroundColor) {
    final theme = context.theme;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: toggleSideBar,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.cardVariantColor.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: _isExpanded
                ? MainAxisAlignment.end
                : MainAxisAlignment.center,
            children: [
              AnimatedRotation(
                turns: _isExpanded ? 0.5 : 0,
                duration: widget.animationDuration,
                curve: widget.animationCurve,
                child: Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: theme.onBackgroundVariantColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSideBarItem(
    BuildContext context,
    VitBottomBarItem item,
    int index,
    bool isSelected,
    Color selectedColor,
    Color unselectedColor,
  ) {
    final theme = context.theme;
    final effectiveColor = item.enabled
        ? (isSelected ? selectedColor : unselectedColor)
        : theme.disabledColor;

    Widget itemContent = Row(
      children: [
        if (widget.variant == VitBottomBarVariant.dot)
          AnimatedContainer(
            duration: widget.animationDuration,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isSelected ? effectiveColor : Colors.transparent,
              shape: BoxShape.circle,
            ),
          )
        else
          _buildAnimatedIcon(context, item, isSelected, effectiveColor),
        if (_isExpanded) ...[
          const SizedBox(width: 16),
          Expanded(
            child: VitText(
              item.label,
              style: theme.body.copyWith(
                color: effectiveColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (item.badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: item.badgeColor ?? theme.errorColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: VitText(
                item.badge!,
                style: theme.labelSmall.copyWith(
                  color: theme.onPrimaryColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ],
    );

    final itemDecoration = _getSideBarItemDecoration(
      context,
      isSelected,
      selectedColor,
    );

    Widget itemWidget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: item.enabled ? () => _onItemTap(index) : null,
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: widget.animationDuration,
          curve: widget.animationCurve,
          padding: EdgeInsets.symmetric(
            horizontal: _isExpanded ? 16 : 12,
            vertical: 12,
          ),
          decoration: itemDecoration,
          child: itemContent,
        ),
      ),
    );

    if (item.tooltip != null && !_isExpanded) {
      itemWidget = Tooltip(
        message: item.tooltip ?? item.label,
        child: itemWidget,
      );
    }

    return itemWidget;
  }

  BoxDecoration _getSideBarItemDecoration(
    BuildContext context,
    bool isSelected,
    Color selectedColor,
  ) {
    return switch (widget.sideBarItemStyle) {
      VitSideBarItemStyle.standard => BoxDecoration(
        color: isSelected
            ? selectedColor.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      VitSideBarItemStyle.rounded => BoxDecoration(
        color: isSelected
            ? selectedColor.withValues(alpha: 0.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
      ),
      VitSideBarItemStyle.indicator => BoxDecoration(
        color: isSelected
            ? selectedColor.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border(
                left: BorderSide(
                  color: selectedColor,
                  width: 3,
                ),
              )
            : null,
      ),
    };
  }
}

/// A scaffold widget that integrates [VitBottomBar] with body content
/// and handles navigation between pages.
///
/// This widget provides a complete navigation solution with:
/// - Automatic body switching based on selected index
/// - Responsive layout with sidebar on tablets
/// - PageView integration for swipe navigation
/// - IndexedStack for state preservation
///
/// ## Usage
///
/// ```dart
/// VitNavigationScaffold(
///   items: [
///     VitBottomBarItem(icon: Icons.home, label: 'Home'),
///     VitBottomBarItem(icon: Icons.search, label: 'Search'),
///     VitBottomBarItem(icon: Icons.settings, label: 'Settings'),
///   ],
///   pages: [
///     HomePage(),
///     SearchPage(),
///     SettingsPage(),
///   ],
/// )
/// ```
class VitNavigationScaffold extends StatefulWidget {
  /// The list of navigation items.
  final List<VitBottomBarItem> items;

  /// The list of pages corresponding to each navigation item.
  final List<Widget> pages;

  /// Initial selected index.
  ///
  /// Defaults to 0.
  final int initialIndex;

  /// Callback when the selected index changes.
  final ValueChanged<int>? onIndexChanged;

  /// Screen width breakpoint for switching to sidebar layout.
  final double tabletBreakpoint;

  /// Visual variant of the navigation bar.
  final VitBottomBarVariant variant;

  /// Animation type for navigation items.
  final VitBottomBarAnimation animation;

  /// Duration of animations.
  final Duration animationDuration;

  /// Animation curve.
  final Curve animationCurve;

  /// Label behavior for bottom bar.
  final VitBottomBarLabelBehavior labelBehavior;

  /// Custom builder for bottom bar items.
  final VitBottomBarItemBuilder? bottomBarItemBuilder;

  /// Custom builder for sidebar items.
  final VitSideBarItemBuilder? sideBarItemBuilder;

  /// Custom builder for sidebar header.
  final VitSideBarHeaderBuilder? sideBarHeaderBuilder;

  /// Custom builder for sidebar footer.
  final VitSideBarFooterBuilder? sideBarFooterBuilder;

  /// Position of the sidebar.
  final VitSideBarPosition sideBarPosition;

  /// Style variant for sidebar items.
  final VitSideBarItemStyle sideBarItemStyle;

  /// Whether the sidebar can be expanded/collapsed.
  final bool sideBarExpandable;

  /// Initial expanded state of the sidebar.
  final bool sideBarInitiallyExpanded;

  /// Width of the sidebar when expanded.
  final double sideBarExpandedWidth;

  /// Width of the sidebar when collapsed.
  final double sideBarCollapsedWidth;

  /// Background color for the navigation bar.
  final Color? backgroundColor;

  /// Color for selected items.
  final Color? selectedColor;

  /// Color for unselected items.
  final Color? unselectedColor;

  /// Elevation of the navigation bar.
  final double elevation;

  /// Height of the bottom navigation bar.
  final double? bottomBarHeight;

  /// Padding for the navigation bar.
  final EdgeInsetsGeometry? padding;

  /// Border radius for the navigation bar.
  final BorderRadius? borderRadius;

  /// Whether to show a border.
  final bool showBorder;

  /// Border color.
  final Color? borderColor;

  /// Border width.
  final double borderWidth;

  /// Whether to show divider between sidebar and content.
  final bool showSideBarDivider;

  /// Color of the sidebar divider.
  final Color? sideBarDividerColor;

  /// Icon size for navigation items.
  final double iconSize;

  /// Font size for labels.
  final double? labelFontSize;

  /// Whether navigation bar is loading.
  final bool isLoading;

  /// Whether to preserve page state using IndexedStack.
  ///
  /// When true, uses IndexedStack to preserve page state.
  /// When false, displays only the current page.
  /// Defaults to true.
  final bool preserveState;

  /// Whether to enable swipe navigation between pages.
  ///
  /// Only applies to bottom bar mode on phones.
  /// Defaults to false.
  final bool enableSwipeNavigation;

  /// App bar to display at the top.
  final PreferredSizeWidget? appBar;

  /// Floating action button.
  final Widget? floatingActionButton;

  /// Location of the floating action button.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Background color of the scaffold.
  final Color? scaffoldBackgroundColor;

  /// Whether to extend body behind app bar.
  final bool extendBodyBehindAppBar;

  /// Whether to extend body behind bottom bar.
  final bool extendBody;

  /// Controls the inner [VitLoadingScope].
  ///
  /// Defaults to false.
  final bool loading;

  /// Creates a [VitNavigationScaffold].
  const VitNavigationScaffold({
    super.key,
    required this.items,
    required this.pages,
    this.initialIndex = 0,
    this.onIndexChanged,
    this.tabletBreakpoint = 600.0,
    this.variant = VitBottomBarVariant.standard,
    this.animation = VitBottomBarAnimation.fadeScale,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.labelBehavior = VitBottomBarLabelBehavior.alwaysShow,
    this.bottomBarItemBuilder,
    this.sideBarItemBuilder,
    this.sideBarHeaderBuilder,
    this.sideBarFooterBuilder,
    this.sideBarPosition = VitSideBarPosition.left,
    this.sideBarItemStyle = VitSideBarItemStyle.rounded,
    this.sideBarExpandable = true,
    this.sideBarInitiallyExpanded = true,
    this.sideBarExpandedWidth = 250,
    this.sideBarCollapsedWidth = 72,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.elevation = 0,
    this.bottomBarHeight,
    this.padding,
    this.borderRadius,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth = 1.0,
    this.showSideBarDivider = true,
    this.sideBarDividerColor,
    this.iconSize = 24,
    this.labelFontSize,
    this.isLoading = false,
    this.preserveState = true,
    this.enableSwipeNavigation = false,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.scaffoldBackgroundColor,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    this.loading = false,
  }) : assert(
         items.length == pages.length,
         'items and pages must have the same length',
       );

  @override
  State<VitNavigationScaffold> createState() => VitNavigationScaffoldState();
}

/// State for [VitNavigationScaffold].
///
/// Provides access to the current index and navigation control.
class VitNavigationScaffoldState extends State<VitNavigationScaffold> {
  late int _currentIndex;
  late PageController _pageController;
  final GlobalKey<VitBottomBarState> _bottomBarKey = GlobalKey();

  /// The currently selected index.
  int get currentIndex => _currentIndex;

  /// Reference to the bottom bar state.
  VitBottomBarState? get bottomBarState => _bottomBarKey.currentState;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Navigates to the specified index.
  void navigateTo(int index) {
    if (index >= 0 && index < widget.items.length) {
      setState(() {
        _currentIndex = index;
      });
      if (widget.enableSwipeNavigation) {
        _pageController.animateToPage(
          index,
          duration: widget.animationDuration,
          curve: widget.animationCurve,
        );
      }
      widget.onIndexChanged?.call(index);
    }
  }

  void _onIndexChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (widget.enableSwipeNavigation) {
      _pageController.animateToPage(
        index,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
      );
    }
    widget.onIndexChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= widget.tabletBreakpoint;

    final bottomBar = VitBottomBar(
      key: _bottomBarKey,
      items: widget.items,
      currentIndex: _currentIndex,
      onIndexChanged: _onIndexChanged,
      tabletBreakpoint: widget.tabletBreakpoint,
      variant: widget.variant,
      animation: widget.animation,
      animationDuration: widget.animationDuration,
      animationCurve: widget.animationCurve,
      labelBehavior: widget.labelBehavior,
      bottomBarItemBuilder: widget.bottomBarItemBuilder,
      sideBarItemBuilder: widget.sideBarItemBuilder,
      sideBarHeaderBuilder: widget.sideBarHeaderBuilder,
      sideBarFooterBuilder: widget.sideBarFooterBuilder,
      sideBarPosition: widget.sideBarPosition,
      sideBarItemStyle: widget.sideBarItemStyle,
      sideBarExpandable: widget.sideBarExpandable,
      sideBarInitiallyExpanded: widget.sideBarInitiallyExpanded,
      sideBarExpandedWidth: widget.sideBarExpandedWidth,
      sideBarCollapsedWidth: widget.sideBarCollapsedWidth,
      backgroundColor: widget.backgroundColor,
      selectedColor: widget.selectedColor,
      unselectedColor: widget.unselectedColor,
      elevation: widget.elevation,
      bottomBarHeight: widget.bottomBarHeight,
      padding: widget.padding,
      borderRadius: widget.borderRadius,
      showBorder: widget.showBorder,
      borderColor: widget.borderColor,
      borderWidth: widget.borderWidth,
      showSideBarDivider: widget.showSideBarDivider,
      sideBarDividerColor: widget.sideBarDividerColor,
      iconSize: widget.iconSize,
      labelFontSize: widget.labelFontSize,
      isLoading: widget.isLoading,
    );

    Widget body;
    if (widget.enableSwipeNavigation && !isTablet) {
      body = PageView(
        controller: _pageController,
        onPageChanged: _onIndexChanged,
        children: widget.pages,
      );
    } else if (widget.preserveState) {
      body = IndexedStack(
        index: _currentIndex,
        children: widget.pages,
      );
    } else {
      body = widget.pages[_currentIndex];
    }

    if (isTablet) {
      return Scaffold(
        appBar: widget.appBar,
        backgroundColor:
            widget.scaffoldBackgroundColor ?? context.theme.backgroundColor,
        extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        body: VitLoadingScope(
          loading: widget.loading,
          child: Row(
            children: [
              if (widget.sideBarPosition == VitSideBarPosition.left) bottomBar,
              Expanded(child: body),
              if (widget.sideBarPosition == VitSideBarPosition.right) bottomBar,
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: widget.appBar,
      backgroundColor:
          widget.scaffoldBackgroundColor ?? context.theme.backgroundColor,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      extendBody: widget.extendBody,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      body: VitLoadingScope(
        loading: widget.loading,
        child: body,
      ),
      bottomNavigationBar: bottomBar,
    );
  }
}
