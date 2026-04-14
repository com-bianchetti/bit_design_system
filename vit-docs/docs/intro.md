---
sidebar_position: 1
---

# Introduction

Welcome to **Vit Design System** documentation! A comprehensive Flutter UI component library that helps you build beautiful, consistent, and production-ready Flutter applications faster.

## What is Vit Design System?

Vit Design System is a complete UI toolkit for Flutter that provides 30+ customizable components, a robust theming system, form management, and built-in internationalization support. It follows modern design principles and Flutter best practices to help you create exceptional user experiences.

## Key Features

### 🎨 Rich Component Library

- **30+ UI Components** - Everything from buttons and inputs to complex forms and modals
- **Consistent Design Language** - All components follow a unified design system
- **Fully Customizable** - Extensive theming and styling options
- **Responsive** - Components adapt to different screen sizes and orientations

### 🚀 Developer Experience

- **Easy to Use** - Simple, intuitive API with sensible defaults
- **Well Documented** - Comprehensive examples and inline documentation
- **Type Safe** - Full Dart type safety with clear component APIs
- **Storybook Integration** - Interactive component showcase included

### ⚡ Built-in Features

- **Form Management** - Multi-page forms with validation and state management
- **Loading States** - Skeleton loading with shimmer animations
- **Theme Support** - Light and dark mode with full customization
- **Internationalization** - Built-in i18n support with VitStrings
- **Accessibility** - Components follow accessibility best practices

## Design Principles

Vit Design System is built with the following principles in mind:

### Simplicity First

Components are designed to be easy to use with minimal configuration. You can get started quickly with sensible defaults, while still having the flexibility to customize when needed.

### Consistency

All components share a common design language, ensuring your application feels cohesive and professional. The theming system makes it easy to maintain consistency across your entire app.

### Flexibility

While we provide beautiful defaults, every component is highly customizable. Override colors, spacing, typography, and behavior to match your brand and requirements.

### Performance

Components are optimized for performance, with features like skeleton loading, lazy loading, and efficient state management built in.

### Accessibility

We follow Flutter and Material Design accessibility guidelines to ensure your applications are usable by everyone.

## Component Categories

### Input Components

- **VitInput** - Flexible text input with validation
- **VitRawInput** - Minimal input for custom implementations
- **VitInputCount** - Numeric input with increment/decrement buttons
- **Specialized Fields** - Pre-configured fields for email, password, phone, URL, currency, and more

### Selection Components

- **VitCheckbox** - Single or group checkboxes
- **VitRadio** - Radio button groups
- **VitSwitch** - Toggle switches
- **VitSelect** - Dropdown selection with single/multi-select
- **VitSlider** - Range selection
- **VitChip** - Selectable chips and chip groups
- **VitDate** - Date and date range picker

### Action Components

- **VitButton** - Primary action button
- **VitOutlinedButton** - Outlined variant
- **VitSecondaryButton** - Secondary actions
- **VitLinkButton** - Text-style button
- **VitSocialButton** - Social network authentication buttons
- **VitButtonDock** - Responsive button groups

### Display Components

- **VitText** - Enhanced text with rich formatting
- **VitCard** - Content containers
- **VitListCard** - List item cards
- **VitAvatar** - User avatars and avatar groups
- **VitBadge** - Notification badges
- **VitProgress** - Progress indicators
- **VitAccordion** - Collapsible content sections

### Feedback Components

- **VitDialog** - Alert and confirmation dialogs
- **VitModal** - Modal overlays
- **VitSheet** - Bottom sheets
- **VitToast** - Toast notifications
- **VitPopover** - Contextual popovers

### Layout Components

- **VitScaffold** - Page structure
- **VitAppBar** - Application bar
- **VitBottomBar** - Bottom navigation
- **VitListView** - Scrollable lists

### Form Components

- **VitForm** - Multi-page form management
- **VitFormPage** - Individual form pages
- **VitFormModal** - Modal forms
- **VitFormFooter** - Form navigation

### Loading Components

- **VitLoading** - Loading indicators
- **VitLoadingScope** - Skeleton loading wrapper
- **VitSkeletonShimmer** - Shimmer effect for loading states

## Quick Example

Here's a simple example to get you started:

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
      theme: VitTheme(
        primaryColor: Colors.blue,
        secondaryColor: Colors.orange,
      ),
      home: VitScaffold(
        appBar: VitAppBar(
          title: 'My App',
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitText(
                'Welcome to Vit Design System!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              VitButton(
                text: 'Get Started',
                icon: Icon(Icons.rocket_launch),
                onPressed: () {
                  VitToast.success(
                    context,
                    message: 'Welcome!',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Next Steps

Ready to get started? Check out the [Installation](./installation.md) guide to add Vit Design System to your project, or browse the component documentation to see what's available.

### Explore

- [Installation Guide](./installation.md) - Add Vit to your Flutter project
- [Theming](./customization/theming.md) - Customize the look and feel
- [Components](./components/button.md) - Browse all available components
- [Form System](./components/form.md) - Build multi-page forms with validation

## Support

If you encounter any issues or have questions, please file an issue on our GitHub repository. We're here to help!

## License

Vit Design System is available under the MPL-2.0 License.
