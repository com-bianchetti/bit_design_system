// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package

import 'package:vit_design_system/config/vit_strings.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:flutter/material.dart';

/// A [MaterialApp] wrapper widget that configures the app with the Vit design system.
///
/// ## Usage
///
/// ```dart
/// VitApp(
///   home: MyHomePage(),
/// )
/// ```
class VitApp extends StatefulWidget {
  /// The default theme for the app.
  final VitTheme? theme;

  /// The default dark theme for the app.
  final VitTheme? darkTheme;

  /// Class with strings used by Vit components. Used to translate the app.
  final VitStrings bitStrings;

  /// Creates a MaterialApp.
  ///
  /// At least one of [home], [routes], [onGenerateRoute], or [builder] must be
  /// non-null. If only [routes] is given, it must include an entry for the
  /// [Navigator.defaultRouteName] (`/`), since that is the route used when the
  /// application is launched with an intent that specifies an otherwise
  /// unsupported route.
  ///
  /// This class creates an instance of [WidgetsApp].
  const VitApp({
    super.key,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.home,
    this.bitStrings = const VitStrings(),
    Map<String, WidgetBuilder> this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.onNavigationNotification,
    List<NavigatorObserver> this.navigatorObservers =
        const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.themeAnimationDuration = kThemeAnimationDuration,
    this.themeAnimationCurve = Curves.linear,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.useDarkTheme = true,
    @Deprecated(
      'Remove this parameter as it is now ignored. '
      'MaterialApp never introduces its own MediaQuery; the View widget takes care of that. '
      'This feature was deprecated after v3.7.0-29.0.pre.',
    )
    this.useInheritedMediaQuery = false,
    this.themeAnimationStyle,
  }) : routeInformationProvider = null,
       routeInformationParser = null,
       routerDelegate = null,
       backButtonDispatcher = null,
       routerConfig = null;

  /// Creates a [MaterialApp] that uses the [Router] instead of a [Navigator].
  ///
  /// {@macro flutter.widgets.WidgetsApp.router}
  const VitApp.router({
    super.key,
    this.bitStrings = const VitStrings(),
    this.scaffoldMessengerKey,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.routerConfig,
    this.backButtonDispatcher,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.onNavigationNotification,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.themeAnimationDuration = kThemeAnimationDuration,
    this.themeAnimationCurve = Curves.linear,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    @Deprecated(
      'Remove this parameter as it is now ignored. '
      'MaterialApp never introduces its own MediaQuery; the View widget takes care of that. '
      'This feature was deprecated after v3.7.0-29.0.pre.',
    )
    this.useInheritedMediaQuery = false,
    this.themeAnimationStyle,
    this.useDarkTheme = true,
  }) : assert(routerDelegate != null || routerConfig != null),
       navigatorObservers = null,
       navigatorKey = null,
       onGenerateRoute = null,
       home = null,
       onGenerateInitialRoutes = null,
       onUnknownRoute = null,
       routes = null,
       initialRoute = null;

  /// {@macro flutter.widgets.widgetsApp.navigatorKey}
  final GlobalKey<NavigatorState>? navigatorKey;

  /// A key to use when building the [ScaffoldMessenger].
  ///
  /// If a [scaffoldMessengerKey] is specified, the [ScaffoldMessenger] can be
  /// directly manipulated without first obtaining it from a [BuildContext] via
  /// [ScaffoldMessenger.of]: from the [scaffoldMessengerKey], use the
  /// [GlobalKey.currentState] getter.
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  /// {@macro flutter.widgets.widgetsApp.home}
  final Widget? home;

  /// The application's top-level routing table.
  ///
  /// When a named route is pushed with [Navigator.pushNamed], the route name is
  /// looked up in this map. If the name is present, the associated
  /// [WidgetBuilder] is used to construct a [MaterialPageRoute] that
  /// performs an appropriate transition, including [Hero] animations, to the
  /// new route.
  ///
  /// {@macro flutter.widgets.widgetsApp.routes}
  final Map<String, WidgetBuilder>? routes;

  /// {@macro flutter.widgets.widgetsApp.initialRoute}
  final String? initialRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateRoute}
  final RouteFactory? onGenerateRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateInitialRoutes}
  final InitialRouteListFactory? onGenerateInitialRoutes;

  /// {@macro flutter.widgets.widgetsApp.onUnknownRoute}
  final RouteFactory? onUnknownRoute;

  /// {@macro flutter.widgets.widgetsApp.onNavigationNotification}
  final NotificationListenerCallback<NavigationNotification>?
  onNavigationNotification;

  /// {@macro flutter.widgets.widgetsApp.navigatorObservers}
  final List<NavigatorObserver>? navigatorObservers;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  /// {@macro flutter.widgets.widgetsApp.routerConfig}
  final RouterConfig<Object>? routerConfig;

  /// {@macro flutter.widgets.widgetsApp.builder}
  ///
  /// Material specific features such as [showDialog] and [showMenu], and widgets
  /// such as [Tooltip], [PopupMenuButton], also require a [Navigator] to properly
  /// function.
  final TransitionBuilder? builder;

  /// {@macro flutter.widgets.widgetsApp.title}
  ///
  /// This value is passed unmodified to [WidgetsApp.title].
  final String? title;

  /// {@macro flutter.widgets.widgetsApp.onGenerateTitle}
  ///
  /// This value is passed unmodified to [WidgetsApp.onGenerateTitle].
  final GenerateAppTitle? onGenerateTitle;

  /// The [ThemeData] to use when 'high contrast' is requested by the system.
  ///
  /// Some host platforms (for example, iOS) allow the users to increase
  /// contrast through an accessibility setting.
  ///
  /// Uses [theme] instead when null.
  ///
  /// See also:
  ///
  ///  * [MediaQueryData.highContrast], which indicates the platform's
  ///    desire to increase contrast.
  final ThemeData? highContrastTheme;

  /// The [ThemeData] to use when a 'dark mode' and 'high contrast' is requested
  /// by the system.
  ///
  /// Some host platforms (for example, iOS) allow the users to increase
  /// contrast through an accessibility setting.
  ///
  /// This theme should have a [ThemeData.brightness] set to [Brightness.dark].
  ///
  /// Uses [darkTheme] instead when null.
  ///
  /// See also:
  ///
  ///  * [MediaQueryData.highContrast], which indicates the platform's
  ///    desire to increase contrast.
  final ThemeData? highContrastDarkTheme;

  /// Determines which theme will be used by the application if both [theme]
  /// and [darkTheme] are provided.
  ///
  /// If set to [ThemeMode.system], the choice of which theme to use will
  /// be based on the user's system preferences. If the [MediaQuery.platformBrightnessOf]
  /// is [Brightness.light], [theme] will be used. If it is [Brightness.dark],
  /// [darkTheme] will be used (unless it is null, in which case [theme]
  /// will be used.
  ///
  /// If set to [ThemeMode.light] the [theme] will always be used,
  /// regardless of the user's system preference.
  ///
  /// If set to [ThemeMode.dark] the [darkTheme] will be used
  /// regardless of the user's system preference. If [darkTheme] is null
  /// then it will fallback to using [theme].
  ///
  /// The default value is [ThemeMode.system].
  ///
  /// See also:
  ///
  ///  * [theme], which is used when a light mode is selected.
  ///  * [darkTheme], which is used when a dark mode is selected.
  ///  * [ThemeData.brightness], which indicates to various parts of the
  ///    system what kind of theme is being used.
  final ThemeMode? themeMode;

  /// The duration of animated theme changes.
  ///
  /// When the theme changes (either by the [theme], [darkTheme] or [themeMode]
  /// parameters changing) it is animated to the new theme over time.
  /// The [themeAnimationDuration] determines how long this animation takes.
  ///
  /// To have the theme change immediately, you can set this to [Duration.zero].
  ///
  /// The default is [kThemeAnimationDuration].
  ///
  /// See also:
  ///   [themeAnimationCurve], which defines the curve used for the animation.
  final Duration themeAnimationDuration;

  /// The curve to apply when animating theme changes.
  ///
  /// The default is [Curves.linear].
  ///
  /// This is ignored if [themeAnimationDuration] is [Duration.zero].
  ///
  /// See also:
  ///   [themeAnimationDuration], which defines how long the animation is.
  final Curve themeAnimationCurve;

  /// {@macro flutter.widgets.widgetsApp.color}
  final Color? color;

  /// {@macro flutter.widgets.widgetsApp.locale}
  final Locale? locale;

  /// {@macro flutter.widgets.widgetsApp.localizationsDelegates}
  ///
  /// Internationalized apps that require translations for one of the locales
  /// listed in [GlobalMaterialLocalizations] should specify this parameter
  /// and list the [supportedLocales] that the application can handle.
  ///
  /// ```dart
  /// // The GlobalMaterialLocalizations and GlobalWidgetsLocalizations
  /// // classes require the following import:
  /// // import 'package:flutter_localizations/flutter_localizations.dart';
  ///
  /// const MaterialApp(
  ///   localizationsDelegates: <LocalizationsDelegate<Object>>[
  ///     // ... app-specific localization delegate(s) here
  ///     GlobalMaterialLocalizations.delegate,
  ///     GlobalWidgetsLocalizations.delegate,
  ///   ],
  ///   supportedLocales: <Locale>[
  ///     Locale('en', 'US'), // English
  ///     Locale('he', 'IL'), // Hebrew
  ///     // ... other locales the app supports
  ///   ],
  ///   // ...
  /// )
  /// ```
  ///
  /// ## Adding localizations for a new locale
  ///
  /// The information that follows applies to the unusual case of an app
  /// adding translations for a language not already supported by
  /// [GlobalMaterialLocalizations].
  ///
  /// Delegates that produce [WidgetsLocalizations] and [MaterialLocalizations]
  /// are included automatically. Apps can provide their own versions of these
  /// localizations by creating implementations of
  /// [LocalizationsDelegate<WidgetsLocalizations>] or
  /// [LocalizationsDelegate<MaterialLocalizations>] whose load methods return
  /// custom versions of [WidgetsLocalizations] or [MaterialLocalizations].
  ///
  /// For example: to add support to [MaterialLocalizations] for a locale it
  /// doesn't already support, say `const Locale('foo', 'BR')`, one first
  /// creates a subclass of [MaterialLocalizations] that provides the
  /// translations:
  ///
  /// ```dart
  /// class FooLocalizations extends MaterialLocalizations {
  ///   FooLocalizations();
  ///   @override
  ///   String get okButtonLabel => 'foo';
  ///   // ...
  ///   // lots of other getters and methods to override!
  /// }
  /// ```
  ///
  /// One must then create a [LocalizationsDelegate] subclass that can provide
  /// an instance of the [MaterialLocalizations] subclass. In this case, this is
  /// essentially just a method that constructs a `FooLocalizations` object. A
  /// [SynchronousFuture] is used here because no asynchronous work takes place
  /// upon "loading" the localizations object.
  ///
  /// ```dart
  /// // continuing from previous example...
  /// class FooLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  ///   const FooLocalizationsDelegate();
  ///   @override
  ///   bool isSupported(Locale locale) {
  ///     return locale == const Locale('foo', 'BR');
  ///   }
  ///   @override
  ///   Future<FooLocalizations> load(Locale locale) {
  ///     assert(locale == const Locale('foo', 'BR'));
  ///     return SynchronousFuture<FooLocalizations>(FooLocalizations());
  ///   }
  ///   @override
  ///   bool shouldReload(FooLocalizationsDelegate old) => false;
  /// }
  /// ```
  ///
  /// Constructing a [MaterialApp] with a `FooLocalizationsDelegate` overrides
  /// the automatically included delegate for [MaterialLocalizations] because
  /// only the first delegate of each [LocalizationsDelegate.type] is used and
  /// the automatically included delegates are added to the end of the app's
  /// [localizationsDelegates] list.
  ///
  /// ```dart
  /// // continuing from previous example...
  /// const MaterialApp(
  ///   localizationsDelegates: <LocalizationsDelegate<Object>>[
  ///     FooLocalizationsDelegate(),
  ///   ],
  ///   // ...
  /// )
  /// ```
  /// See also:
  ///
  ///  * [supportedLocales], which must be specified along with
  ///    [localizationsDelegates].
  ///  * [GlobalMaterialLocalizations], a [localizationsDelegates] value
  ///    which provides material localizations for many languages.
  ///  * The Flutter Internationalization Tutorial,
  ///    <https://flutter.dev/to/internationalization/>.
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// {@macro flutter.widgets.widgetsApp.localeListResolutionCallback}
  ///
  /// This callback is passed along to the [WidgetsApp] built by this widget.
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// {@macro flutter.widgets.LocaleResolutionCallback}
  ///
  /// This callback is passed along to the [WidgetsApp] built by this widget.
  final LocaleResolutionCallback? localeResolutionCallback;

  /// {@macro flutter.widgets.widgetsApp.supportedLocales}
  ///
  /// It is passed along unmodified to the [WidgetsApp] built by this widget.
  ///
  /// See also:
  ///
  ///  * [localizationsDelegates], which must be specified for localized
  ///    applications.
  ///  * [GlobalMaterialLocalizations], a [localizationsDelegates] value
  ///    which provides material localizations for many languages.
  ///  * The Flutter Internationalization Tutorial,
  ///    <https://flutter.dev/to/internationalization/>.
  final Iterable<Locale> supportedLocales;

  /// Turns on a performance overlay.
  ///
  /// See also:
  ///
  ///  * <https://flutter.dev/to/performance-overlay>
  final bool showPerformanceOverlay;

  /// Turns on checkerboarding of raster cache images.
  final bool checkerboardRasterCacheImages;

  /// Turns on checkerboarding of layers rendered to offscreen bitmaps.
  final bool checkerboardOffscreenLayers;

  /// Turns on an overlay that shows the accessibility information
  /// reported by the framework.
  final bool showSemanticsDebugger;

  /// {@macro flutter.widgets.widgetsApp.debugShowCheckedModeBanner}
  final bool debugShowCheckedModeBanner;

  /// {@macro flutter.widgets.widgetsApp.shortcuts}
  /// {@tool snippet}
  /// This example shows how to add a single shortcut for
  /// [LogicalKeyboardKey.select] to the default shortcuts without needing to
  /// add your own [Shortcuts] widget.
  ///
  /// Alternatively, you could insert a [Shortcuts] widget with just the mapping
  /// you want to add between the [WidgetsApp] and its child and get the same
  /// effect.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return WidgetsApp(
  ///     shortcuts: <ShortcutActivator, Intent>{
  ///       ... WidgetsApp.defaultShortcuts,
  ///       const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
  ///     },
  ///     color: const Color(0xFFFF0000),
  ///     builder: (BuildContext context, Widget? child) {
  ///       return const Placeholder();
  ///     },
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  /// {@macro flutter.widgets.widgetsApp.shortcuts.seeAlso}
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// {@macro flutter.widgets.widgetsApp.actions}
  /// {@tool snippet}
  /// This example shows how to add a single action handling an
  /// [ActivateAction] to the default actions without needing to
  /// add your own [Actions] widget.
  ///
  /// Alternatively, you could insert a [Actions] widget with just the mapping
  /// you want to add between the [WidgetsApp] and its child and get the same
  /// effect.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return WidgetsApp(
  ///     actions: <Type, Action<Intent>>{
  ///       ... WidgetsApp.defaultActions,
  ///       ActivateAction: CallbackAction<Intent>(
  ///         onInvoke: (Intent intent) {
  ///           // Do something here...
  ///           return null;
  ///         },
  ///       ),
  ///     },
  ///     color: const Color(0xFFFF0000),
  ///     builder: (BuildContext context, Widget? child) {
  ///       return const Placeholder();
  ///     },
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  /// {@macro flutter.widgets.widgetsApp.actions.seeAlso}
  final Map<Type, Action<Intent>>? actions;

  /// {@macro flutter.widgets.widgetsApp.restorationScopeId}
  final String? restorationScopeId;

  /// {@template flutter.material.materialApp.scrollBehavior}
  /// The default [ScrollBehavior] for the application.
  ///
  /// [ScrollBehavior]s describe how [Scrollable] widgets behave. Providing
  /// a [ScrollBehavior] can set the default [ScrollPhysics] across
  /// an application, and manage [Scrollable] decorations like [Scrollbar]s and
  /// [GlowingOverscrollIndicator]s.
  /// {@endtemplate}
  ///
  /// When null, defaults to [MaterialScrollBehavior].
  ///
  /// See also:
  ///
  ///  * [ScrollConfiguration], which controls how [Scrollable] widgets behave
  ///    in a subtree.
  final ScrollBehavior? scrollBehavior;

  /// Turns on a [GridPaper] overlay that paints a baseline grid
  /// Material apps.
  ///
  /// Only available in debug mode.
  ///
  /// See also:
  ///
  ///  * <https://material.io/design/layout/spacing-methods.html>
  final bool debugShowMaterialGrid;

  /// {@macro flutter.widgets.widgetsApp.useInheritedMediaQuery}
  @Deprecated(
    'This setting is now ignored. '
    'MaterialApp never introduces its own MediaQuery; the View widget takes care of that. '
    'This feature was deprecated after v3.7.0-29.0.pre.',
  )
  final bool useInheritedMediaQuery;

  /// Used to override the theme animation curve and duration.
  ///
  /// If [AnimationStyle.duration] is provided, it will be used to override
  /// the theme animation duration in the underlying [AnimatedTheme] widget.
  /// If it is null, then [themeAnimationDuration] will be used. Otherwise,
  /// defaults to 200ms.
  ///
  /// If [AnimationStyle.curve] is provided, it will be used to override
  /// the theme animation curve in the underlying [AnimatedTheme] widget.
  /// If it is null, then [themeAnimationCurve] will be used. Otherwise,
  /// defaults to [Curves.linear].
  ///
  /// To disable the theme animation, use [AnimationStyle.noAnimation].
  ///
  /// {@tool dartpad}
  /// This sample showcases how to override the theme animation curve and
  /// duration in the [MaterialApp] widget using [AnimationStyle].
  ///
  /// ** See code in examples/api/lib/material/app/app.0.dart **
  /// {@end-tool}
  final AnimationStyle? themeAnimationStyle;

  /// Whether to use the dark theme or not.
  /// Defaults to true, meaning that the dark theme will be different from the light theme.
  /// If set to false, the dark theme will be the same as the light theme.
  final bool useDarkTheme;

  @override
  State<VitApp> createState() => _VitAppState();
}

class _VitAppState extends State<VitApp> {
  final themeMode = ValueNotifier<ThemeMode>(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme ?? VitTheme();
    final darkTheme = widget.darkTheme;

    final bitLightTheme = ThemeData(
      brightness: theme.brightness,
      primaryColor: theme.primaryColor,
      splashFactory: NoSplash.splashFactory,
      useMaterial3: false,
      colorScheme: ColorScheme(
        brightness: theme.brightness,
        primary: theme.primaryColor,
        onPrimary: theme.onPrimaryColor,
        secondary: theme.secondaryColor,
        onSecondary: theme.onSecondaryColor,
        error: theme.errorColor,
        onError: theme.onPrimaryColor,
        surface: theme.backgroundColor,
        onSurface: theme.onBackrgroundColor,
        surfaceContainer: theme.cardColor,
        surfaceContainerHighest: theme.elevatedCardColor,
        surfaceVariant: theme.cardVariantColor,
      ),
      textTheme:
          TextTheme(
            titleLarge: theme.titleBig,
            titleMedium: theme.title,
            titleSmall: theme.titleSmall,
            bodyLarge: theme.bodyBig,
            bodyMedium: theme.body,
            bodySmall: theme.bodySmall,
            labelLarge: theme.labelBig,
            labelMedium: theme.label,
            labelSmall: theme.labelSmall,
          )..apply(
            bodyColor: theme.onBackrgroundColor,
            displayColor: theme.onBackrgroundColor,
          ),
    );

    final bitDarkTheme = darkTheme == null
        ? null
        : ThemeData(
            brightness: Brightness.dark,
            primaryColor: darkTheme.primaryColor,
            splashFactory: NoSplash.splashFactory,
            useMaterial3: false,
            colorScheme: ColorScheme(
              brightness: Brightness.dark,
              primary: darkTheme.primaryColor,
              onPrimary: darkTheme.onPrimaryColor,
              secondary: darkTheme.secondaryColor,
              onSecondary: darkTheme.onSecondaryColor,
              error: darkTheme.errorColor,
              onError: darkTheme.onPrimaryColor,
              surface: darkTheme.backgroundColor,
              onSurface: darkTheme.onBackrgroundColor,
              surfaceContainer: darkTheme.cardColor,
              surfaceContainerHighest: darkTheme.elevatedCardColor,
              surfaceVariant: darkTheme.cardVariantColor,
            ),
            textTheme:
                TextTheme(
                  titleLarge: darkTheme.titleBig,
                  titleMedium: darkTheme.title,
                  titleSmall: darkTheme.titleSmall,
                  bodyLarge: darkTheme.bodyBig,
                  bodyMedium: darkTheme.body,
                  bodySmall: darkTheme.bodySmall,
                  labelLarge: darkTheme.labelBig,
                  labelMedium: darkTheme.label,
                  labelSmall: darkTheme.labelSmall,
                )..apply(
                  bodyColor: theme.onBackrgroundColor,
                  displayColor: theme.onBackrgroundColor,
                ),
          );

    return VitAppTheme(
      theme: theme,
      darkTheme: darkTheme,
      changeThemeMode: (themeMode) {
        this.themeMode.value = themeMode;
      },
      child: ValueListenableBuilder(
        valueListenable: themeMode,
        builder: (context, themeMode, child) {
          return widget.routerConfig != null
              ? MaterialApp.router(
                  theme: bitLightTheme,
                  darkTheme: widget.useDarkTheme ? bitDarkTheme : bitLightTheme,
                  themeMode: themeMode,
                  themeAnimationDuration: widget.themeAnimationDuration,
                  themeAnimationCurve: widget.themeAnimationCurve,
                  color: widget.color,
                  locale: widget.locale,
                  localizationsDelegates: widget.localizationsDelegates,
                  localeListResolutionCallback:
                      widget.localeListResolutionCallback,
                  localeResolutionCallback: widget.localeResolutionCallback,
                  supportedLocales: widget.supportedLocales,
                  showPerformanceOverlay: widget.showPerformanceOverlay,
                  checkerboardRasterCacheImages:
                      widget.checkerboardRasterCacheImages,
                  checkerboardOffscreenLayers:
                      widget.checkerboardOffscreenLayers,
                  showSemanticsDebugger: widget.showSemanticsDebugger,
                  debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
                  shortcuts: widget.shortcuts,
                  actions: widget.actions,
                  restorationScopeId: widget.restorationScopeId,
                  scrollBehavior: widget.scrollBehavior,
                  debugShowMaterialGrid: widget.debugShowMaterialGrid,
                  useInheritedMediaQuery: widget.useInheritedMediaQuery,
                  themeAnimationStyle: widget.themeAnimationStyle,
                  builder: widget.builder,
                  routerDelegate: widget.routerDelegate,
                  routeInformationParser: widget.routeInformationParser,
                  routeInformationProvider: widget.routeInformationProvider,
                  scaffoldMessengerKey: widget.scaffoldMessengerKey,
                  routerConfig: widget.routerConfig,
                  backButtonDispatcher: widget.backButtonDispatcher,
                )
              : MaterialApp(
                  theme: bitLightTheme,
                  darkTheme: bitDarkTheme,
                  themeMode: themeMode,
                  themeAnimationDuration: widget.themeAnimationDuration,
                  themeAnimationCurve: widget.themeAnimationCurve,
                  color: widget.color,
                  locale: widget.locale,
                  localizationsDelegates: widget.localizationsDelegates,
                  localeListResolutionCallback:
                      widget.localeListResolutionCallback,
                  localeResolutionCallback: widget.localeResolutionCallback,
                  supportedLocales: widget.supportedLocales,
                  showPerformanceOverlay: widget.showPerformanceOverlay,
                  checkerboardRasterCacheImages:
                      widget.checkerboardRasterCacheImages,
                  checkerboardOffscreenLayers:
                      widget.checkerboardOffscreenLayers,
                  showSemanticsDebugger: widget.showSemanticsDebugger,
                  debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
                  shortcuts: widget.shortcuts,
                  actions: widget.actions,
                  restorationScopeId: widget.restorationScopeId,
                  scrollBehavior: widget.scrollBehavior,
                  debugShowMaterialGrid: widget.debugShowMaterialGrid,
                  useInheritedMediaQuery: widget.useInheritedMediaQuery,
                  themeAnimationStyle: widget.themeAnimationStyle,
                  builder: widget.builder,
                  scaffoldMessengerKey: widget.scaffoldMessengerKey,
                  onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
                  onNavigationNotification: widget.onNavigationNotification,
                  navigatorObservers:
                      widget.navigatorObservers ?? <NavigatorObserver>[],
                  onUnknownRoute: widget.onUnknownRoute,
                  onGenerateRoute: widget.onGenerateRoute,
                  onGenerateTitle: widget.onGenerateTitle,
                  title: widget.title,
                  home: widget.home,
                );
        },
      ),
    );
  }
}

/// A [InheritedWidget] that provides the Vit theme to the app.
class VitAppTheme extends InheritedWidget {
  final Function(ThemeMode) changeThemeMode;
  final VitTheme theme;
  final VitTheme? darkTheme;

  const VitAppTheme({
    super.key,
    required super.child,
    required this.changeThemeMode,
    required this.theme,
    required this.darkTheme,
  });

  static VitAppTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VitAppTheme>()!;
  }

  static VitAppTheme? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VitAppTheme>();
  }

  @override
  bool updateShouldNotify(VitAppTheme oldWidget) => false;
}
