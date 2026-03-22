import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A highly customizable scroll view component that supports headers, content,
/// and footers using slivers, with adaptive grid layouts for different screen sizes.
///
/// [VitListView] provides a flexible way to create scrollable content with
/// optional headers and footers, while supporting responsive layouts that
/// adapt between single-column (phone) and multi-column (tablet) views.
///
/// ## Features
///
/// - **Header/Footer Support**: Add pinned or scrollable headers and footers
/// - **Responsive Grid**: Automatically adapt columns based on screen size
/// - **Custom Slivers**: Full control over sliver behavior and configuration
/// - **Flexible Layout**: Support for both list and grid content layouts
///
/// ## Usage
///
/// ### Basic list view with items
///
/// ```dart
/// VitListView(
///   itemCount: 20,
///   itemBuilder: (context, index) => ListTile(
///     title: Text('Item $index'),
///   ),
/// )
/// ```
///
/// ### List view with header and footer
///
/// ```dart
/// VitListView(
///   header: Container(
///     height: 200,
///     child: Text('Header'),
///   ),
///   footer: Container(
///     height: 100,
///     child: Text('Footer'),
///   ),
///   itemCount: 20,
///   itemBuilder: (context, index) => ListTile(
///     title: Text('Item $index'),
///   ),
/// )
/// ```
///
/// ### Responsive grid layout
///
/// ```dart
/// VitListView(
///   crossAxisCount: 2,
///   tabletCrossAxisCount: 3,
///   tabletBreakpoint: 600,
///   itemCount: 20,
///   itemBuilder: (context, index) => Card(
///     child: Center(child: Text('Item $index')),
///   ),
/// )
/// ```
///
/// ### Custom slivers
///
/// ```dart
/// VitListView(
///   slivers: [
///     SliverAppBar(
///       title: Text('Custom App Bar'),
///       floating: true,
///     ),
///     SliverList(
///       delegate: SliverChildBuilderDelegate(
///         (context, index) => ListTile(title: Text('Item $index')),
///         childCount: 20,
///       ),
///     ),
///   ],
/// )
/// ```
///
/// ## Customization
///
/// - Use [header] and [footer] for simple header/footer widgets
/// - Use [headerSliver] and [footerSliver] for custom sliver headers/footers
/// - Use [pinnedHeader] and [pinnedFooter] to control pinning behavior
/// - Use [crossAxisCount] for grid layouts (1 = list, >1 = grid)
/// - Use [tabletCrossAxisCount] and [tabletBreakpoint] for responsive grids
/// - Use [slivers] for complete control over the scroll view content
class VitListView extends StatelessWidget {
  /// Widget to display as the header of the scroll view.
  ///
  /// This is wrapped in a [SliverToBoxAdapter] by default.
  /// For custom sliver headers, use [headerSliver] instead.
  final Widget? header;

  /// Custom sliver widget to use as the header.
  ///
  /// Takes precedence over [header] if both are provided.
  final Widget? headerSliver;

  /// Whether the header should remain pinned at the top while scrolling.
  ///
  /// Only applies when using [header]. For [headerSliver], configure
  /// pinning directly on the sliver widget.
  ///
  /// Defaults to false.
  final bool pinnedHeader;

  /// Widget to display as the footer of the scroll view.
  ///
  /// This is wrapped in a [SliverToBoxAdapter] by default.
  /// For custom sliver footers, use [footerSliver] instead.
  final Widget? footer;

  /// Custom sliver widget to use as the footer.
  ///
  /// Takes precedence over [footer] if both are provided.
  final Widget? footerSliver;

  /// Whether the footer should remain pinned at the bottom while scrolling.
  ///
  /// Only applies when using [footer]. For [footerSliver], configure
  /// pinning directly on the sliver widget.
  ///
  /// Defaults to false.
  final bool pinnedFooter;

  /// The number of items to display in the content area.
  ///
  /// Required when using [itemBuilder].
  final int? itemCount;

  /// Builder function to create items in the content area.
  ///
  /// Called for each index from 0 to [itemCount] - 1.
  final IndexedWidgetBuilder? itemBuilder;

  /// Separator widget builder to display between items.
  ///
  /// Only used when [crossAxisCount] is 1 (list mode).
  final IndexedWidgetBuilder? separatorBuilder;

  /// List of widgets to display as content.
  ///
  /// Alternative to using [itemBuilder] and [itemCount].
  /// If both are provided, [children] takes precedence.
  final List<Widget>? children;

  /// Custom slivers to display in the scroll view.
  ///
  /// When provided, this replaces the default content generation.
  /// [header], [headerSliver], [footer], and [footerSliver] are still
  /// added before and after the custom slivers.
  final List<Widget>? slivers;

  /// Number of columns for grid layout on phones.
  ///
  /// Set to 1 for a standard list view.
  /// Set to 2 or more for a grid layout.
  ///
  /// Defaults to 1.
  final int crossAxisCount;

  /// Number of columns for grid layout on tablets.
  ///
  /// When the screen width exceeds [tabletBreakpoint], this value
  /// is used instead of [crossAxisCount].
  ///
  /// If null, [crossAxisCount] is used regardless of screen size.
  final int? tabletCrossAxisCount;

  /// Screen width breakpoint for tablet layout in logical pixels.
  ///
  /// When screen width exceeds this value, [tabletCrossAxisCount]
  /// is used instead of [crossAxisCount].
  ///
  /// Defaults to 600.0.
  final double tabletBreakpoint;

  /// The ratio of the cross-axis to the main-axis extent of each child.
  ///
  /// Only used when [crossAxisCount] > 1 (grid mode).
  ///
  /// Defaults to 1.0 (square items).
  final double childAspectRatio;

  /// The extent of each child in the main axis.
  ///
  /// When provided, overrides [childAspectRatio] for the main axis extent.
  /// Only used when [crossAxisCount] > 1 (grid mode).
  final double? mainAxisExtent;

  /// Spacing between items along the main axis.
  ///
  /// Used in grid mode. For list mode with separators, use [separatorBuilder].
  ///
  /// Defaults to 0.0.
  final double mainAxisSpacing;

  /// Spacing between items along the cross axis.
  ///
  /// Only used when [crossAxisCount] > 1 (grid mode).
  ///
  /// Defaults to 0.0.
  final double crossAxisSpacing;

  /// Padding around the entire scroll view content.
  final EdgeInsetsGeometry? padding;

  /// Padding around the content area (items/grid).
  ///
  /// Does not affect header or footer.
  final EdgeInsetsGeometry? contentPadding;

  /// An object that can be used to control the position to which this scroll
  /// view is scrolled.
  final ScrollController? controller;

  /// Whether this is the primary scroll view associated with the parent.
  ///
  /// Defaults to true when [controller] is null.
  final bool? primary;

  /// How the scroll view should respond to user input.
  final ScrollPhysics? physics;

  /// Whether the extent of the scroll view in the scroll direction should be
  /// determined by the contents being viewed.
  ///
  /// Defaults to false.
  final bool shrinkWrap;

  /// The first child in the scroll view's viewport.
  ///
  /// If non-null, forces [CustomScrollView.center] to the same key.
  final Key? center;

  /// The relative position of the zero scroll offset.
  ///
  /// Defaults to 0.0.
  final double anchor;

  /// A strategy for retaining scroll position when the scroll view changes.
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  /// Restoration ID to save and restore the scroll offset.
  final String? restorationId;

  /// The direction in which this widget scrolls.
  ///
  /// Defaults to [Axis.vertical].
  final Axis scrollDirection;

  /// Whether the scroll view scrolls in the reading direction.
  ///
  /// Defaults to false, meaning it scrolls in the natural direction.
  final bool reverse;

  /// A performance optimization hint for the scroll view.
  final double? cacheExtent;

  /// The number of children that will contribute semantic information.
  final int? semanticChildCount;

  /// Determines how the scroll view responds to drag gestures.
  final DragStartBehavior dragStartBehavior;

  /// The clip behavior for the scroll view.
  final Clip clipBehavior;

  /// Callback when the scroll view is created.
  final ScrollBehavior? scrollBehavior;

  /// Creates a [VitListView].
  ///
  /// Either [itemBuilder] with [itemCount], [children], or [slivers]
  /// should be provided to display content.
  const VitListView({
    super.key,
    this.header,
    this.headerSliver,
    this.pinnedHeader = false,
    this.footer,
    this.footerSliver,
    this.pinnedFooter = false,
    this.itemCount,
    this.itemBuilder,
    this.separatorBuilder,
    this.children,
    this.slivers,
    this.crossAxisCount = 1,
    this.tabletCrossAxisCount,
    this.tabletBreakpoint = 600.0,
    this.childAspectRatio = 1.0,
    this.mainAxisExtent,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.padding,
    this.contentPadding,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.center,
    this.anchor = 0.0,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.scrollBehavior,
  });

  /// Creates a [VitListView] with a separated list layout.
  ///
  /// Convenience constructor for creating a list with separators between items.
  const VitListView.separated({
    super.key,
    this.header,
    this.headerSliver,
    this.pinnedHeader = false,
    this.footer,
    this.footerSliver,
    this.pinnedFooter = false,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.padding,
    this.contentPadding,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.center,
    this.anchor = 0.0,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.scrollBehavior,
  }) : children = null,
       slivers = null,
       crossAxisCount = 1,
       tabletCrossAxisCount = null,
       tabletBreakpoint = 600.0,
       childAspectRatio = 1.0,
       mainAxisExtent = null,
       mainAxisSpacing = 0.0,
       crossAxisSpacing = 0.0;

  /// Creates a [VitListView] with a grid layout.
  ///
  /// Convenience constructor for creating a responsive grid layout.
  const VitListView.grid({
    super.key,
    this.header,
    this.headerSliver,
    this.pinnedHeader = false,
    this.footer,
    this.footerSliver,
    this.pinnedFooter = false,
    required this.itemCount,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.tabletCrossAxisCount,
    this.tabletBreakpoint = 600.0,
    this.childAspectRatio = 1.0,
    this.mainAxisExtent,
    this.mainAxisSpacing = 8.0,
    this.crossAxisSpacing = 8.0,
    this.padding,
    this.contentPadding,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.center,
    this.anchor = 0.0,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.scrollBehavior,
  }) : separatorBuilder = null,
       children = null,
       slivers = null;

  /// Creates a [VitListView] with custom slivers.
  ///
  /// Convenience constructor for full control over sliver content.
  const VitListView.custom({
    super.key,
    this.header,
    this.headerSliver,
    this.pinnedHeader = false,
    this.footer,
    this.footerSliver,
    this.pinnedFooter = false,
    required this.slivers,
    this.padding,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.center,
    this.anchor = 0.0,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.scrollBehavior,
  }) : itemCount = null,
       itemBuilder = null,
       separatorBuilder = null,
       children = null,
       contentPadding = null,
       crossAxisCount = 1,
       tabletCrossAxisCount = null,
       tabletBreakpoint = 600.0,
       childAspectRatio = 1.0,
       mainAxisExtent = null,
       mainAxisSpacing = 0.0,
       crossAxisSpacing = 0.0;

  int _getEffectiveCrossAxisCount(BuildContext context) {
    if (tabletCrossAxisCount == null) {
      return crossAxisCount;
    }

    final screenWidth = MediaQuery.sizeOf(context).width;
    return screenWidth >= tabletBreakpoint
        ? tabletCrossAxisCount!
        : crossAxisCount;
  }

  Widget? _buildHeaderSliver() {
    if (headerSliver != null) {
      return headerSliver;
    }

    if (header == null) {
      return null;
    }

    if (pinnedHeader) {
      return SliverPersistentHeader(
        pinned: true,
        delegate: _VitSliverHeaderDelegate(
          child: header!,
        ),
      );
    }

    return SliverToBoxAdapter(child: header);
  }

  Widget? _buildFooterSliver() {
    if (footerSliver != null) {
      return footerSliver;
    }

    if (footer == null) {
      return null;
    }

    if (pinnedFooter) {
      return SliverPersistentHeader(
        pinned: true,
        delegate: _VitSliverHeaderDelegate(
          child: footer!,
        ),
      );
    }

    return SliverToBoxAdapter(child: footer);
  }

  Widget _buildContentSliver(
    BuildContext context,
    int effectiveCrossAxisCount,
  ) {
    Widget contentSliver;

    if (slivers != null) {
      return SliverToBoxAdapter(
        child: SizedBox.shrink(),
      );
    }

    if (children != null) {
      if (effectiveCrossAxisCount > 1) {
        contentSliver = SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: effectiveCrossAxisCount,
            childAspectRatio: childAspectRatio,
            mainAxisExtent: mainAxisExtent,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
          ),
          delegate: SliverChildListDelegate(children!),
        );
      } else {
        contentSliver = SliverList(
          delegate: SliverChildListDelegate(children!),
        );
      }
    } else if (itemBuilder != null && itemCount != null) {
      if (effectiveCrossAxisCount > 1) {
        contentSliver = SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: effectiveCrossAxisCount,
            childAspectRatio: childAspectRatio,
            mainAxisExtent: mainAxisExtent,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
          ),
          delegate: SliverChildBuilderDelegate(
            itemBuilder!,
            childCount: itemCount,
          ),
        );
      } else if (separatorBuilder != null) {
        contentSliver = SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final itemIndex = index ~/ 2;
              if (index.isEven) {
                return itemBuilder!(context, itemIndex);
              }
              return separatorBuilder!(context, itemIndex);
            },
            childCount: itemCount! * 2 - 1,
          ),
        );
      } else {
        contentSliver = SliverList(
          delegate: SliverChildBuilderDelegate(
            itemBuilder!,
            childCount: itemCount,
          ),
        );
      }
    } else {
      contentSliver = const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    if (contentPadding != null) {
      contentSliver = SliverPadding(
        padding: contentPadding!,
        sliver: contentSliver,
      );
    }

    return contentSliver;
  }

  List<Widget> _buildSlivers(BuildContext context) {
    final effectiveCrossAxisCount = _getEffectiveCrossAxisCount(context);
    final sliverList = <Widget>[];

    final headerWidget = _buildHeaderSliver();
    if (headerWidget != null) {
      sliverList.add(headerWidget);
    }

    if (slivers != null) {
      sliverList.addAll(slivers!);
    } else {
      sliverList.add(_buildContentSliver(context, effectiveCrossAxisCount));
    }

    final footerWidget = _buildFooterSliver();
    if (footerWidget != null) {
      sliverList.add(footerWidget);
    }

    return sliverList;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      center: center,
      anchor: anchor,
      cacheExtent: cacheExtent,
      slivers: padding != null
          ? [
              SliverPadding(
                padding: padding!,
                sliver: SliverToBoxAdapter(
                  child: CustomScrollView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: _buildSlivers(context),
                  ),
                ),
              ),
            ]
          : _buildSlivers(context),
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
      scrollBehavior: scrollBehavior,
    );
  }
}

class _VitSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _VitSliverHeaderDelegate({
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(_VitSliverHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}

/// A builder delegate for creating sliver content with VitListView.
///
/// This delegate provides additional control over the sliver building process,
/// including support for automatic keep-alive and semantic indexes.
class VitSliverChildBuilderDelegate extends SliverChildBuilderDelegate {
  /// Creates a [VitSliverChildBuilderDelegate].
  ///
  /// The [builder] callback is called for each child that needs to be built.
  VitSliverChildBuilderDelegate(
    super.builder, {
    super.findChildIndexCallback,
    super.childCount,
    super.addAutomaticKeepAlives,
    super.addRepaintBoundaries,
    super.addSemanticIndexes,
    super.semanticIndexCallback,
    super.semanticIndexOffset,
  });
}
