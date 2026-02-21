import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vit_design_system/vit_design_system.dart';

class VitScaffold extends StatelessWidget {
  const VitScaffold({
    super.key,
    this.extendBody = false,
    this.drawerBarrierDismissible = true,
    this.extendBodyBehindAppBar = false,
    this.appBar,
    this.body,
    this.children,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.persistentFooterDecoration,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.drawerScrimColor,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.resizeToAvoidBottomInset = true,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    this.title,
    this.titleWidget,
    this.leading,
    this.onLeadingPressed,
    this.leadingIcon = Icons.arrow_back,
    this.trailing,
    this.centerTitle = false,
    this.showAppBar = true,
    this.bodyPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    this.scrollable = true,
    this.tabletCrossAxisCount = 1,
    this.tabletBreakpoint = 600.0,
    this.gridMainAxisSpacing = 8.0,
    this.gridCrossAxisSpacing = 8.0,
    this.gridChildAspectRatio = 1.0,
    this.gridMainAxisExtent,
    this.navigationItems,
    this.navigationPages,
    this.navigationIndex,
    this.onNavigationIndexChanged,
    this.navigationVariant = VitBottomBarVariant.standard,
    this.navigationAnimation = VitBottomBarAnimation.fadeScale,
    this.navigationLabelBehavior = VitBottomBarLabelBehavior.alwaysShow,
    this.sideBarPosition = VitSideBarPosition.left,
    this.sideBarItemStyle = VitSideBarItemStyle.rounded,
    this.sideBarExpandable = true,
    this.sideBarInitiallyExpanded = true,
    this.sideBarExpandedWidth = 250,
    this.sideBarCollapsedWidth = 72,
    this.bottomBarItemBuilder,
    this.sideBarItemBuilder,
    this.sideBarHeaderBuilder,
    this.sideBarFooterBuilder,
    this.navigationSelectedColor,
    this.navigationUnselectedColor,
    this.navigationBackgroundColor,
    this.preserveNavigationState = true,
    this.showAppBarBorder = true,
    this.loading = false,
  }) : assert(
         body != null ||
             children != null ||
             (navigationItems != null && navigationPages != null),
         'Either body, children, or navigation (navigationItems and navigationPages) must be provided',
       );

  /// If true, and [bottomNavigationBar] or [persistentFooterButtons]
  /// is specified, then the [body] extends to the bottom of the Scaffold,
  /// instead of only extending to the top of the [bottomNavigationBar]
  /// or the [persistentFooterButtons].
  ///
  /// If true, a [MediaQuery] widget whose bottom padding matches the height
  /// of the [bottomNavigationBar] will be added above the scaffold's [body].
  ///
  /// This property is often useful when the [bottomNavigationBar] has
  /// a non-rectangular shape, like [CircularNotchedRectangle], which
  /// adds a [FloatingActionButton] sized notch to the top edge of the bar.
  /// In this case specifying `extendBody: true` ensures that scaffold's
  /// body will be visible through the bottom navigation bar's notch.
  ///
  /// See also:
  ///
  ///  * [extendBodyBehindAppBar], which extends the height of the body
  ///    to the top of the scaffold.
  final bool extendBody;

  /// Whether the drawer can be dismissed by tapping on the barrier.
  ///
  /// If false, and a [drawer] is specified, then the barrier behind the drawer
  /// will not respond to a tap event and thus remains open.
  ///
  /// Defaults to true, in which case the drawer will close upon the user tapping on the barrier.
  final bool drawerBarrierDismissible;

  /// If true, and an [appBar] is specified, then the height of the [body] is
  /// extended to include the height of the app bar and the top of the body
  /// is aligned with the top of the app bar.
  ///
  /// This is useful if the app bar's [AppBar.backgroundColor] is not
  /// completely opaque.
  ///
  /// This property is false by default.
  ///
  /// See also:
  ///
  ///  * [extendBody], which extends the height of the body to the bottom
  ///    of the scaffold.
  final bool extendBodyBehindAppBar;

  /// An app bar to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;

  /// The primary content of the scaffold.
  ///
  /// Displayed below the [appBar], above the bottom of the ambient
  /// [MediaQuery]'s [MediaQueryData.viewInsets], and behind the
  /// [floatingActionButton] and [drawer]. If [resizeToAvoidBottomInset] is
  /// false then the body is not resized when the onscreen keyboard appears,
  /// i.e. it is not inset by `viewInsets.bottom`.
  ///
  /// The widget in the body of the scaffold is positioned at the top-left of
  /// the available space between the app bar and the bottom of the scaffold. To
  /// center this widget instead, consider putting it in a [Center] widget and
  /// having that be the body. To expand this widget instead, consider
  /// putting it in a [SizedBox.expand].
  ///
  /// If you have a column of widgets that should normally fit on the screen,
  /// but may overflow and would in such cases need to scroll, consider using a
  /// [ListView] as the body of the scaffold. This is also a good choice for
  /// the case where your body is a scrollable list.
  final Widget? body;

  /// A button displayed floating above [body], in the bottom right corner.
  ///
  /// Typically a [FloatingActionButton].
  final Widget? floatingActionButton;

  /// Responsible for determining where the [floatingActionButton] should go.
  ///
  /// If null, the [ScaffoldState] will use the default location, [FloatingActionButtonLocation.endFloat].
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Animator to move the [floatingActionButton] to a new [floatingActionButtonLocation].
  ///
  /// If null, the [ScaffoldState] will use the default animator, [FloatingActionButtonAnimator.scaling].
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// A set of buttons that are displayed at the bottom of the scaffold.
  ///
  /// Typically this is a list of [TextButton] widgets. These buttons are
  /// persistently visible, even if the [body] of the scaffold scrolls.
  ///
  /// These widgets will be wrapped in an [OverflowBar].
  ///
  /// The [persistentFooterButtons] are rendered above the
  /// [bottomNavigationBar] but below the [body].
  final List<Widget>? persistentFooterButtons;

  /// The alignment of the [persistentFooterButtons] inside the [OverflowBar].
  ///
  /// Defaults to [AlignmentDirectional.centerEnd].
  final AlignmentDirectional persistentFooterAlignment;

  /// Decoration for the container that holds the [persistentFooterButtons].
  ///
  /// By default, this container has a top border with a width of 1.0, created by
  /// [Divider.createBorderSide].
  ///
  /// See also:
  ///
  ///  * [persistentFooterButtons], which defines the buttons to show in the footer.
  ///  * [persistentFooterAlignment], which defines the alignment of the footer buttons.
  final BoxDecoration? persistentFooterDecoration;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from either left-to-right ([TextDirection.ltr]) or
  /// right-to-left ([TextDirection.rtl])
  ///
  /// Typically a [Drawer].
  ///
  /// To open the drawer, use the [ScaffoldState.openDrawer] function.
  ///
  /// To close the drawer, use either [ScaffoldState.closeDrawer], [Navigator.pop]
  /// or press the escape key on the keyboard.
  ///
  /// {@tool dartpad}
  /// To disable the drawer edge swipe on mobile, set the
  /// [Scaffold.drawerEnableOpenDragGesture] to false. Then, use
  /// [ScaffoldState.openDrawer] to open the drawer and [Navigator.pop] to close
  /// it.
  ///
  /// ** See code in examples/api/lib/material/scaffold/scaffold.drawer.0.dart **
  /// {@end-tool}
  final Widget? drawer;

  /// Optional callback that is called when the [Scaffold.drawer] is opened or closed.
  final DrawerCallback? onDrawerChanged;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from right-to-left ([TextDirection.ltr]) or
  /// left-to-right ([TextDirection.rtl])
  ///
  /// Typically a [Drawer].
  ///
  /// To open the drawer, use the [ScaffoldState.openEndDrawer] function.
  ///
  /// To close the drawer, use either [ScaffoldState.closeEndDrawer], [Navigator.pop]
  /// or press the escape key on the keyboard.
  ///
  /// {@tool dartpad}
  /// To disable the drawer edge swipe, set the
  /// [Scaffold.endDrawerEnableOpenDragGesture] to false. Then, use
  /// [ScaffoldState.openEndDrawer] to open the drawer and [Navigator.pop] to
  /// close it.
  ///
  /// ** See code in examples/api/lib/material/scaffold/scaffold.end_drawer.0.dart **
  /// {@end-tool}
  final Widget? endDrawer;

  /// Optional callback that is called when the [Scaffold.endDrawer] is opened or closed.
  final DrawerCallback? onEndDrawerChanged;

  /// The color to use for the scrim that obscures primary content while a drawer is open.
  ///
  /// If this is null, then [DrawerThemeData.scrimColor] is used. If that
  /// is also null, then it defaults to [Colors.black54].
  final Color? drawerScrimColor;

  /// The color of the [Material] widget that underlies the entire Scaffold.
  ///
  /// The theme's [ThemeData.scaffoldBackgroundColor] by default.
  final Color? backgroundColor;

  /// A bottom navigation bar to display at the bottom of the scaffold.
  ///
  /// Snack bars slide from underneath the bottom navigation bar while bottom
  /// sheets are stacked on top.
  ///
  /// The [bottomNavigationBar] is rendered below the [persistentFooterButtons]
  /// and the [body].
  final Widget? bottomNavigationBar;

  /// The persistent bottom sheet to display.
  ///
  /// A persistent bottom sheet shows information that supplements the primary
  /// content of the app. A persistent bottom sheet remains visible even when
  /// the user interacts with other parts of the app.
  ///
  /// A closely related widget is a modal bottom sheet, which is an alternative
  /// to a menu or a dialog and prevents the user from interacting with the rest
  /// of the app. Modal bottom sheets can be created and displayed with the
  /// [showModalBottomSheet] function.
  ///
  /// Unlike the persistent bottom sheet displayed by [showBottomSheet]
  /// this bottom sheet is not a [LocalHistoryEntry] and cannot be dismissed
  /// with the scaffold appbar's back button.
  ///
  /// If a persistent bottom sheet created with [showBottomSheet] is already
  /// visible, it must be closed before building the Scaffold with a new
  /// [bottomSheet].
  ///
  /// The value of [bottomSheet] can be any widget at all. It's unlikely to
  /// actually be a [BottomSheet], which is used by the implementations of
  /// [showBottomSheet] and [showModalBottomSheet]. Typically it's a widget
  /// that includes [Material].
  ///
  /// See also:
  ///
  ///  * [showBottomSheet], which displays a bottom sheet as a route that can
  ///    be dismissed with the scaffold's back button.
  ///  * [showModalBottomSheet], which displays a modal bottom sheet.
  ///  * [BottomSheetThemeData], which can be used to customize the default
  ///    bottom sheet property values when using a [BottomSheet].
  final Widget? bottomSheet;

  /// If true the [body] and the scaffold's floating widgets should size
  /// themselves to avoid the onscreen keyboard whose height is defined by the
  /// ambient [MediaQuery]'s [MediaQueryData.viewInsets] `bottom` property.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// scaffold, the body can be resized to avoid overlapping the keyboard, which
  /// prevents widgets inside the body from being obscured by the keyboard.
  ///
  /// Defaults to true.
  final bool? resizeToAvoidBottomInset;

  /// Whether this scaffold is being displayed at the top of the screen.
  ///
  /// If true then the height of the [appBar] will be extended by the height
  /// of the screen's status bar, i.e. the top padding for [MediaQuery].
  ///
  /// The default value of this property, like the default value of
  /// [AppBar.primary], is true.
  final bool primary;

  /// {@macro flutter.material.DrawerController.dragStartBehavior}
  final DragStartBehavior drawerDragStartBehavior;

  /// The width of the area within which a horizontal swipe will open the
  /// drawer.
  ///
  /// By default, the value used is 20.0 added to the padding edge of
  /// `MediaQuery.paddingOf(context)` that corresponds to the surrounding
  /// [TextDirection]. This ensures that the drag area for notched devices is
  /// not obscured. For example, if `TextDirection.of(context)` is set to
  /// [TextDirection.ltr], 20.0 will be added to
  /// `MediaQuery.paddingOf(context).left`.
  final double? drawerEdgeDragWidth;

  /// Determines if the [Scaffold.drawer] can be opened with a drag
  /// gesture on mobile.
  ///
  /// On desktop platforms, the drawer is not draggable.
  ///
  /// By default, the drag gesture is enabled on mobile.
  final bool drawerEnableOpenDragGesture;

  /// Determines if the [Scaffold.endDrawer] can be opened with a
  /// gesture on mobile.
  ///
  /// On desktop platforms, the drawer is not draggable.
  ///
  /// By default, the drag gesture is enabled on mobile.
  final bool endDrawerEnableOpenDragGesture;

  /// Restoration ID to save and restore the state of the [Scaffold].
  ///
  /// If it is non-null, the scaffold will persist and restore whether the
  /// [drawer] and [endDrawer] was open or closed.
  ///
  /// The state of this widget is persisted in a [RestorationBucket] claimed
  /// from the surrounding [RestorationScope] using the provided restoration ID.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  final String? restorationId;

  /// The title text to display in the app bar.
  ///
  /// If both [title] and [titleWidget] are provided, [titleWidget] takes precedence.
  final String? title;

  /// Custom widget to display as the title.
  ///
  /// If provided, this takes precedence over [title].
  final Widget? titleWidget;

  /// Custom leading widget to display at the start of the app bar.
  ///
  /// If provided, this takes precedence over [onLeadingPressed].
  final Widget? leading;

  /// Callback invoked when the default leading button is pressed.
  ///
  /// When provided without [leading], displays a default back button.
  /// If both [leading] and [onLeadingPressed] are null, no leading widget is shown.
  final VoidCallback? onLeadingPressed;

  /// Icon to display in the default leading button.
  ///
  /// Defaults to [Icons.arrow_back].
  /// Only used when [onLeadingPressed] is provided and [leading] is null.
  final IconData leadingIcon;

  /// List of widgets to display at the end of the app bar.
  ///
  /// Typically used for action buttons like search, menu, or settings.
  final List<Widget>? trailing;

  /// Whether to center the title text in the app bar.
  ///
  /// Defaults to true.
  final bool centerTitle;

  /// Whether to show the app bar.
  ///
  /// Defaults to true.
  final bool showAppBar;

  /// Padding to apply to the body.
  ///
  /// Defaults to 16.0 horizontal padding.
  final EdgeInsetsGeometry bodyPadding;

  /// Whether the body should be scrollable.
  ///
  /// Defaults to true.
  final bool scrollable;

  /// Number of columns for grid layout on tablets.
  ///
  /// When screen width exceeds [tabletBreakpoint], this value
  /// determines the number of columns. Phone devices always show 1 column.
  ///
  /// Defaults to 2.
  final int tabletCrossAxisCount;

  /// Screen width breakpoint for tablet layout in logical pixels.
  ///
  /// When screen width exceeds this value, [tabletCrossAxisCount]
  /// is used. Below this value, 1 column is used (phone layout).
  ///
  /// Defaults to 600.0.
  final double tabletBreakpoint;

  /// Spacing between grid items along the main axis.
  ///
  /// Only used when [useGridLayout] is true.
  ///
  /// Defaults to 8.0.
  final double gridMainAxisSpacing;

  /// Spacing between grid items along the cross axis.
  ///
  /// Only used when [useGridLayout] is true.
  ///
  /// Defaults to 8.0.
  final double gridCrossAxisSpacing;

  /// The ratio of the cross-axis to the main-axis extent of each child.
  ///
  /// Only used when [useGridLayout] is true.
  ///
  /// Defaults to 1.0 (square items).
  final double gridChildAspectRatio;

  /// The extent of each child in the main axis.
  ///
  /// When provided, overrides [gridChildAspectRatio] for the main axis extent.
  /// Only used when [useGridLayout] is true.
  final double? gridMainAxisExtent;

  final List<Widget>? children;

  /// Navigation items for responsive bottom/side navigation.
  ///
  /// When provided along with [navigationPages], enables the integrated
  /// navigation system that shows a bottom bar on phones and a sidebar
  /// on tablets/larger screens.
  ///
  /// The number of items must match [navigationPages].
  final List<VitBottomBarItem>? navigationItems;

  /// Pages corresponding to each navigation item.
  ///
  /// When provided along with [navigationItems], enables the integrated
  /// navigation system.
  ///
  /// The number of pages must match [navigationItems].
  final List<Widget>? navigationPages;

  /// Currently selected navigation index.
  ///
  /// Used when [navigationItems] and [navigationPages] are provided.
  /// Defaults to 0.
  final int? navigationIndex;

  /// Callback when navigation index changes.
  ///
  /// Used when [navigationItems] and [navigationPages] are provided.
  final ValueChanged<int>? onNavigationIndexChanged;

  /// Visual variant for the navigation bar.
  ///
  /// Defaults to [VitBottomBarVariant.standard].
  final VitBottomBarVariant navigationVariant;

  /// Animation type for navigation item transitions.
  ///
  /// Defaults to [VitBottomBarAnimation.fadeScale].
  final VitBottomBarAnimation navigationAnimation;

  /// Label behavior for the bottom navigation bar.
  ///
  /// Defaults to [VitBottomBarLabelBehavior.alwaysShow].
  final VitBottomBarLabelBehavior navigationLabelBehavior;

  /// Position of the sidebar on tablets.
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

  /// Custom builder for bottom bar items.
  final VitBottomBarItemBuilder? bottomBarItemBuilder;

  /// Custom builder for sidebar items.
  final VitSideBarItemBuilder? sideBarItemBuilder;

  /// Custom builder for sidebar header.
  final VitSideBarHeaderBuilder? sideBarHeaderBuilder;

  /// Custom builder for sidebar footer.
  final VitSideBarFooterBuilder? sideBarFooterBuilder;

  /// Color for selected navigation items.
  final Color? navigationSelectedColor;

  /// Color for unselected navigation items.
  final Color? navigationUnselectedColor;

  /// Background color for the navigation bar.
  final Color? navigationBackgroundColor;

  /// Whether to preserve page state using IndexedStack.
  ///
  /// Defaults to true.
  final bool preserveNavigationState;

  /// Whether to show the app bar border.
  ///
  /// Defaults to true.
  final bool showAppBarBorder;

  /// Controls the inner [VitLoadingScope].
  ///
  /// Defaults to false.
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final shouldShowAppBar =
        showAppBar &&
        (appBar != null ||
            title != null ||
            titleWidget != null ||
            leading != null);

    final hasNavigation = navigationItems != null && navigationPages != null;

    if (hasNavigation) {
      final effectiveAppBar = shouldShowAppBar
          ? (appBar ??
                VitAppBar(
                  title: title,
                  titleWidget: titleWidget,
                  leading: leading,
                  onLeadingPressed: onLeadingPressed,
                  leadingIcon: leadingIcon,
                  trailing: trailing,
                  centerTitle: centerTitle,
                  showBorder: showAppBarBorder,
                ))
          : null;

      return VitNavigationScaffold(
        items: navigationItems!,
        pages: navigationPages!,
        initialIndex: navigationIndex ?? 0,
        onIndexChanged: onNavigationIndexChanged,
        tabletBreakpoint: tabletBreakpoint,
        variant: navigationVariant,
        animation: navigationAnimation,
        labelBehavior: navigationLabelBehavior,
        bottomBarItemBuilder: bottomBarItemBuilder,
        sideBarItemBuilder: sideBarItemBuilder,
        sideBarHeaderBuilder: sideBarHeaderBuilder,
        sideBarFooterBuilder: sideBarFooterBuilder,
        sideBarPosition: sideBarPosition,
        sideBarItemStyle: sideBarItemStyle,
        sideBarExpandable: sideBarExpandable,
        sideBarInitiallyExpanded: sideBarInitiallyExpanded,
        sideBarExpandedWidth: sideBarExpandedWidth,
        sideBarCollapsedWidth: sideBarCollapsedWidth,
        backgroundColor: navigationBackgroundColor,
        selectedColor: navigationSelectedColor,
        unselectedColor: navigationUnselectedColor,
        preserveState: preserveNavigationState,
        appBar: effectiveAppBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        scaffoldBackgroundColor: backgroundColor,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        extendBody: extendBody,
        loading: loading,
      );
    }

    Widget? defaultBody;

    if (children != null) {
      if (scrollable) {
        defaultBody = VitListView.grid(
          itemCount: children!.length,
          itemBuilder: (context, index) => children![index],
          crossAxisCount: 1,
          tabletCrossAxisCount: tabletCrossAxisCount,
          tabletBreakpoint: tabletBreakpoint,
          mainAxisSpacing: gridMainAxisSpacing,
          crossAxisSpacing: gridCrossAxisSpacing,
          childAspectRatio: gridChildAspectRatio,
          mainAxisExtent: gridMainAxisExtent,
          padding: bodyPadding,
        );
      } else {
        defaultBody = Padding(
          padding: bodyPadding,
          child: Column(
            children: children ?? [],
          ),
        );
      }
    }

    return Scaffold(
      appBar: shouldShowAppBar
          ? (appBar ??
                VitAppBar(
                  title: title,
                  titleWidget: titleWidget,
                  leading: leading,
                  onLeadingPressed: onLeadingPressed,
                  leadingIcon: leadingIcon,
                  trailing: trailing,
                  centerTitle: centerTitle,
                  showBorder: showAppBarBorder,
                ))
          : null,
      body: VitLoadingScope(
        loading: loading,
        child: body ?? defaultBody ?? const SizedBox.shrink(),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      persistentFooterAlignment: persistentFooterAlignment,
      persistentFooterDecoration: persistentFooterDecoration,
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      endDrawer: endDrawer,
      onEndDrawerChanged: onEndDrawerChanged,
      drawerScrimColor: drawerScrimColor,
      backgroundColor: backgroundColor ?? context.theme.backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      drawerDragStartBehavior: drawerDragStartBehavior,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      restorationId: restorationId,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerBarrierDismissible: drawerBarrierDismissible,
    );
  }
}
