---
sidebar_position: 2
---

# Installation

Get started with Vit Design System in your Flutter project in just a few steps.

## Requirements

Before you begin, make sure you have the following:

- **Flutter SDK**: >=3.10.1
- **Dart SDK**: >=3.10.1

## Step 1: Add Dependency

Add `vit_design_system` to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  vit_design_system: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Step 2: Import the Package

Import the package in your Dart files:

```dart
import 'package:vit_design_system/vit_design_system.dart';
```

## Step 3: Wrap Your App with VitApp

Replace `MaterialApp` with `VitApp` as the root widget of your application:

```dart
import 'package:flutter/material.dart';
import 'package:vit_design_system/vit_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VitApp(
      theme: VitTheme(),
      home: MyHomePage(),
    );
  }
}
```

## Step 4: Start Using Components

You're all set! Now you can start using any Vit component in your app:

```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return VitScaffold(
      appBar: VitAppBar(
        title: 'My App',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VitText(
              'Hello, Vit Design System!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            VitButton(
              text: 'Click Me',
              onPressed: () {
                VitToast.success(
                  context,
                  message: 'Button clicked!',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

## Configuration Options

### Basic Configuration

The simplest setup uses default values:

```dart
VitApp(
  theme: VitTheme(),
  home: MyHomePage(),
)
```

### Custom Theme

Customize colors and styling:

```dart
VitApp(
  theme: VitTheme(
    primaryColor: Colors.blue,
    secondaryColor: Colors.orange,
    backgroundColor: Colors.white,
    borderRadius: BorderRadius.circular(12),
    fontFamily: 'Roboto',
  ),
  home: MyHomePage(),
)
```

### Dark Mode Support

Provide both light and dark themes:

```dart
VitApp(
  theme: VitTheme(
    primaryColor: Colors.blue,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  ),
  darkTheme: VitTheme(
    primaryColor: Colors.blue.shade300,
    backgroundColor: Colors.grey.shade900,
    brightness: Brightness.dark,
  ),
  themeMode: ThemeMode.system,
  home: MyHomePage(),
)
```

### Internationalization

Customize strings for different languages:

```dart
VitApp(
  theme: VitTheme(
    bitStrings: VitStrings(
      confirm: 'Confirmar',
      cancel: 'Cancelar',
      email: 'Correo electrónico',
      password: 'Contraseña',
    ),
  ),
  home: MyHomePage(),
)
```

## VitApp Properties

`VitApp` is a wrapper around `MaterialApp` and supports all its properties, plus additional Vit-specific configuration:

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `theme` | `VitTheme` | Light theme configuration | `VitTheme()` |
| `darkTheme` | `VitTheme?` | Dark theme configuration | `null` |
| `themeMode` | `ThemeMode` | Theme mode (light/dark/system) | `ThemeMode.system` |
| `home` | `Widget?` | Home widget | `null` |
| `routes` | `Map<String, WidgetBuilder>?` | Named routes | `null` |
| `initialRoute` | `String?` | Initial route | `null` |
| `onGenerateRoute` | `RouteFactory?` | Route generator | `null` |
| `navigatorKey` | `GlobalKey<NavigatorState>?` | Navigator key | `null` |
| `locale` | `Locale?` | App locale | `null` |
| `localizationsDelegates` | `Iterable<LocalizationsDelegate>?` | Localization delegates | `null` |
| `supportedLocales` | `Iterable<Locale>` | Supported locales | `[Locale('en', 'US')]` |
| `debugShowCheckedModeBanner` | `bool` | Show debug banner | `true` |
| `title` | `String` | App title | `''` |

All standard `MaterialApp` properties are also supported.

## Adding Custom Fonts

To use custom fonts with Vit Design System:

1. Add your font files to `assets/fonts/` in your project
2. Register them in `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: Roboto
      fonts:
        - asset: assets/fonts/Roboto-Regular.ttf
        - asset: assets/fonts/Roboto-Bold.ttf
          weight: 700
```

3. Specify the font family in your theme:

```dart
VitApp(
  theme: VitTheme(
    fontFamily: 'Roboto',
  ),
  home: MyHomePage(),
)
```

## Using with Existing Projects

If you already have a `MaterialApp` in your project, you can gradually migrate to Vit Design System:

### Option 1: Full Migration

Replace `MaterialApp` with `VitApp`:

```dart
return VitApp(
  theme: VitTheme(
    primaryColor: Theme.of(context).primaryColor,
  ),
  home: MyHomePage(),
);
```

### Option 2: Gradual Adoption

Keep your existing `MaterialApp` and use Vit components individually:

```dart
return MaterialApp(
  home: Scaffold(
    body: Column(
      children: [
        VitButton(text: 'Click Me', onPressed: () {}),
      ],
    ),
  ),
);
```

Note: Some features like theme access via `VitAppTheme.of(context)` will require wrapping your app with `VitApp`.

## Troubleshooting

### Package Not Found

If you get an error that the package is not found, make sure you've run:

```bash
flutter pub get
```

### Import Errors

Make sure you're importing the correct package:

```dart
import 'package:vit_design_system/vit_design_system.dart';
```

### Theme Not Applied

Ensure your widget tree is wrapped with `VitApp`:

```dart
void main() {
  runApp(
    VitApp(
      theme: VitTheme(),
      home: MyHomePage(),
    ),
  );
}
```

### Hot Reload Issues

If components don't update after hot reload, try hot restart:

```bash
r
```

Or press Shift + R in your IDE.

## Next Steps

Now that you have Vit Design System installed, you can:

- [Customize your theme](./customization/theming.md)
- [Explore components](./components/button.md)
- [Learn about forms](./components/form.md)
- [Set up internationalization](./customization/i18n.md)

## Example Project

Check out the example project included in the package for a complete implementation with all components:

```bash
cd example
flutter run
```

The example includes a Storybook-style showcase of all components with interactive examples.
