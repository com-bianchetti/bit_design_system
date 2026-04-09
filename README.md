# Vit Design System

Vit Design System is a Flutter UI package for building complete product interfaces with one consistent language. Instead of giving you only isolated widgets, it brings together actions, forms, fields, overlays, layout primitives, loading states, feedback patterns, and theming tools that work well together out of the box.

It is especially useful for teams that build real application flows: onboarding, checkout, settings, authentication, internal tools, dashboards, and any screen where a consistent component vocabulary matters.

## Why use Vit Design System

- A large component surface: buttons, inputs, fields, pickers, cards, overlays, navigation, feedback, loading, and layout.
- A strong form layer with multi-step flows, automatic data collection by field `id`, modal forms, and ready-made field widgets.
- Centralized design decisions through `VitTheme`, `VitValues`, `VitConfiguration`, and `VitStrings`.
- Responsive patterns for bottom bars, side navigation, sheets, dialogs, and modal presentation.
- Helpful defaults for spacing, typography, density, colors, states, and localization.
- Production-friendly widgets that cover both happy-path UI and waiting/error/empty states.

## Installation

Add the dependency:

```yaml
dependencies:
  vit_design_system: ^1.0.0
```

Then install:

```bash
flutter pub get
```

## Quick Start

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
      title: 'Vit Demo',
      theme: VitTheme(
        primaryColor: const Color(0xff1F1F1F),
        secondaryColor: const Color(0xff0F766E),
        borderRadius: BorderRadius.circular(16),
      ),
      bitStrings: const VitStrings(
        confirm: 'Continue',
        searchHint: 'Search components...',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return VitScaffold(
      appBar: VitAppBar(
        title: 'Vit Design System',
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VitTitleBig('Build complete Flutter flows faster'),
            const SizedBox(height: 12),
            const VitText(
              'Vit gives you themed components, structured forms, navigation, and feedback patterns in one package.',
            ),
            const SizedBox(height: 24),
            VitButton(
              text: 'Show success toast',
              icon: const Icon(Icons.rocket_launch),
              onPressed: () {
                VitToast.success(
                  context,
                  message: 'Vit is ready to use.',
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

## App Setup and Theming

Vit starts at the app level. `VitApp` wraps `MaterialApp`, so you still keep the familiar Flutter app API, but now with a design-system-aware theme and strings layer.

The main configuration objects are:

- `VitTheme`: colors, typography, border radius, density, strings, values, and component behavior.
- `VitValues`: sizing and spacing tokens for buttons, inputs, avatars, cards, badges, tabs, and loading indicators.
- `VitConfiguration`: component behavior and presentation defaults such as input mode, checkbox shape, borders, and backgrounds.
- `VitStrings`: localized labels, picker text, dialog text, validation copy, and reusable UI strings.

```dart
VitApp(
  theme: VitTheme(
    primaryColor: const Color(0xff111827),
    secondaryColor: const Color(0xff0F766E),
    backgroundColor: const Color(0xffF6F7F7),
    visualDensity: VisualDensity.standard,
    values: const VitValues(
      buttonStandardHeight: 50,
      loadingStandardSize: 50,
    ),
    configuration: const VitConfiguration(
      inputMode: VitInputMode.floatingLabel,
      showCardBorder: true,
      showInputBackground: true,
    ),
    bitStrings: const VitStrings(
      confirm: 'Confirmar',
      searchHint: 'Buscar...',
      noResultsFound: 'Nenhum resultado encontrado',
    ),
  ),
  darkTheme: VitTheme(
    brightness: Brightness.dark,
    primaryColor: const Color(0xffE5E7EB),
    secondaryColor: const Color(0xff2DD4BF),
    backgroundColor: const Color(0xff111827),
    cardColor: const Color(0xff1F2937),
    elevatedCardColor: const Color(0xff0F172A),
    onBackrgroundColor: Colors.white,
    onBackgroundVariantColor: const Color(0xff94A3B8),
  ),
  themeMode: ThemeMode.system,
  home: const HomePage(),
)
```

You can access the active theme with:

```dart
final theme = VitAppTheme.of(context).theme;
final primary = theme.primaryColor;
```

## Component Showcase

All examples below assume:

```dart
import 'package:flutter/material.dart';
import 'package:vit_design_system/vit_design_system.dart';
```

### Typography

Vit includes text widgets mapped to a simple design hierarchy:

- `VitTitleBig`, `VitTitle`, `VitTitleSmall`: headings and section titles.
- `VitTextBig`, `VitText`, `VitTextSmall`: body copy and descriptions.
- `VitLabelBig`, `VitLabel`, `VitLabelSmall`: tiny metadata and labels.
- Rich constructors such as `VitText.rich(...)` are available when you want styled spans.

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: const [
    VitTitleBig('Dashboard'),
    SizedBox(height: 8),
    VitTitle('Revenue'),
    SizedBox(height: 8),
    VitTitleSmall('This month'),
    SizedBox(height: 16),
    VitTextBig('A larger paragraph for emphasis.'),
    VitText('Standard body copy for most UI text.'),
    VitTextSmall('Supporting helper text or metadata.'),
    SizedBox(height: 16),
    VitLabelBig('LABEL BIG'),
    VitLabel('LABEL'),
    VitLabelSmall('LABEL SMALL'),
  ],
)
```

```dart
const VitText.rich(
  'You can mix <b>bold</b>, <i>italic</i>, and other inline styles.',
)
```

### Buttons and Actions

Vit covers common action hierarchy and different CTA styles:

- `VitButton`: the primary filled call-to-action.
- `VitOutlinedButton`: secondary action with border emphasis.
- `VitSecondaryButton`: softer filled action for less dominant CTAs.
- `VitLinkButton`: tertiary action with minimal visual weight.
- `VitIconButton`: compact icon-only actions.
- `VitSocialButton`: preconfigured social sign-in buttons.

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    VitButton(
      text: 'Continue',
      icon: const Icon(Icons.arrow_forward),
      onPressed: () {},
    ),
    const SizedBox(height: 12),
    VitOutlinedButton(
      text: 'Back',
      onPressed: () {},
    ),
    const SizedBox(height: 12),
    VitSecondaryButton(
      text: 'Save Draft',
      onPressed: () {},
    ),
    const SizedBox(height: 12),
    VitLinkButton(
      text: 'Skip for now',
      underlined: true,
      onPressed: () {},
    ),
    const SizedBox(height: 12),
    Row(
      children: [
        VitIconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        const SizedBox(width: 12),
        VitButton(
          text: 'Submitting',
          isLoadingState: true,
          onPressed: () {},
        ),
      ],
    ),
  ],
)
```

```dart
Column(
  children: [
    VitSocialButton.google(
      text: 'Continue with Google',
      onPressed: () {},
    ),
    const SizedBox(height: 12),
    VitSocialButton.facebook(
      text: 'Continue with Facebook',
      onPressed: () {},
    ),
    const SizedBox(height: 12),
    VitSocialButton.apple(
      text: 'Continue with Apple',
      onPressed: () {},
    ),
  ],
)
```

### Base Inputs

The package includes three base input primitives that cover most entry patterns:

- `VitInput`: the main text field with validation, labels, icons, helper text, and form integration.
- `VitRawInput`: a minimal borderless text field with larger typography for inline titles, codes, and custom layouts.
- `VitInputCount`: a number input with increment and decrement controls.

```dart
Column(
  children: [
    VitInput(
      id: 'username',
      label: 'Username',
      hintText: 'Choose a username',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username is required';
        }
        return null;
      },
    ),
    const SizedBox(height: 16),
    VitRawInput(
      id: 'headline',
      placeholder: 'Document title',
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    const SizedBox(height: 16),
    VitInputCount(
      id: 'quantity',
      label: 'Quantity',
      value: 2,
      minValue: 1,
      maxValue: 10,
      onChanged: (value) {},
    ),
  ],
)
```

### Specialized Fields

One of Vit's biggest advantages is the amount of repetitive form work it removes. These fields come pre-configured with validation, keyboard behavior, localized labels, formatters, and defaults:

- Authentication: `VitEmailField`, `VitPasswordField`, `VitConfirmPasswordField`, `VitUsernameField`
- Personal data: `VitNameField`, `VitPhoneField`, `VitBirthdayField`, `VitGenderField`
- Locale data: `VitCountryField`, `VitLanguageField`
- Numeric data: `VitNumberField`, `VitDecimalField`, `VitCurrencyField`, `VitPercentageField`
- Text and search: `VitTextAreaField`, `VitSearchField`, `VitUrlField`
- Dates and agreements: `VitDateRangeField`, `VitTermsField`, `VitNewsletterField`

```dart
Column(
  children: const [
    VitEmailField(id: 'email'),
    SizedBox(height: 16),
    VitPasswordField(id: 'password'),
    SizedBox(height: 16),
    VitConfirmPasswordField(
      id: 'confirmPassword',
      passwordFieldId: 'password',
    ),
    SizedBox(height: 16),
    VitUsernameField(id: 'username'),
    SizedBox(height: 16),
    VitNameField(id: 'fullName'),
    SizedBox(height: 16),
    VitPhoneField(id: 'phone'),
    SizedBox(height: 16),
    VitCountryField(id: 'country'),
    SizedBox(height: 16),
    VitLanguageField(id: 'language'),
  ],
)
```

```dart
Column(
  children: [
    VitNumberField(id: 'quantity'),
    const SizedBox(height: 16),
    VitDecimalField(id: 'weight'),
    const SizedBox(height: 16),
    VitPercentageField(id: 'discount'),
    const SizedBox(height: 16),
    SizedBox(
      height: 420,
      child: VitCurrencyField(
        id: 'amount',
        subtitle: 'Available balance: \$2,500.00',
      ),
    ),
  ],
)
```

```dart
Column(
  children: const [
    VitSearchField(id: 'search'),
    SizedBox(height: 16),
    VitUrlField(id: 'website'),
    SizedBox(height: 16),
    VitTextAreaField(id: 'bio'),
    SizedBox(height: 16),
    VitBirthdayField(id: 'birthday'),
    SizedBox(height: 16),
    VitDateRangeField(id: 'travelDates'),
    SizedBox(height: 16),
    VitGenderField(id: 'gender'),
    SizedBox(height: 16),
    VitTermsField(id: 'terms'),
    SizedBox(height: 16),
    VitNewsletterField(id: 'newsletter'),
  ],
)
```

### Selection and Pickers

Vit includes a full set of choice and picker controls:

- `VitSelect`: single or multi-select dropdown with search and confirmation flow.
- `VitCheckbox`: standalone or list-tile checkbox.
- `VitRadio` and `VitRadioGroup`: single-choice controls.
- `VitSwitch`: boolean toggles.
- `VitSlider`: ranged values with optional labels and formatted values.
- `VitChip` and `VitChipGroup`: single or multi-select chips and tags.
- `VitDate`: single-date or date-range picker.
- `VitTime`: time picker in 24-hour, AM/PM, or duration modes.

```dart
Column(
  children: [
    VitSelect(
      id: 'country',
      label: 'Country',
      hintText: 'Select a country',
      options: const ['Brazil', 'Canada', 'Japan', 'Portugal'],
      onChanged: (value) {},
    ),
    const SizedBox(height: 16),
    VitSelect(
      id: 'skills',
      label: 'Skills',
      multiSelection: true,
      options: const ['Flutter', 'Dart', 'Firebase', 'Figma'],
      onChangedMultiple: (values) {},
    ),
    const SizedBox(height: 16),
    VitCheckbox(
      id: 'termsAccepted',
      title: 'Accept terms',
      subtitle: 'Required to continue',
      value: false,
      onChanged: (value) {},
    ),
    const SizedBox(height: 16),
    VitSwitch(
      id: 'notifications',
      title: 'Enable notifications',
      subtitle: 'Receive product updates',
      value: true,
      onChanged: (value) {},
    ),
  ],
)
```

```dart
Column(
  children: [
    VitRadioGroup<String>(
      id: 'plan',
      value: 'pro',
      onChanged: (value) {},
      options: const [
        VitRadioOption(value: 'starter', title: 'Starter'),
        VitRadioOption(value: 'pro', title: 'Pro'),
        VitRadioOption(value: 'enterprise', title: 'Enterprise'),
      ],
    ),
    const SizedBox(height: 16),
    VitSlider(
      id: 'brightness',
      title: 'Brightness',
      value: 72,
      min: 0,
      max: 100,
      showValue: true,
      onChanged: (value) {},
    ),
  ],
)
```

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    VitChip(
      label: 'Featured',
      selected: true,
      onSelected: (selected) {},
      showDeleteIcon: true,
      onDeleted: () {},
    ),
    const SizedBox(height: 16),
    VitChipGroup<String>(
      id: 'topics',
      multiSelect: true,
      values: const ['flutter', 'dart'],
      onMultiChanged: (values) {},
      options: const [
        VitChipOption(value: 'flutter', label: 'Flutter'),
        VitChipOption(value: 'dart', label: 'Dart'),
        VitChipOption(value: 'ui', label: 'UI'),
      ],
    ),
  ],
)
```

```dart
Column(
  children: [
    VitDate(
      id: 'meetingDate',
      label: 'Meeting date',
      hintText: 'Choose a date',
      onChanged: (date) {},
    ),
    const SizedBox(height: 16),
    VitDate(
      id: 'trip',
      label: 'Travel dates',
      rangeSelection: true,
      selectDate: true,
      onRangeChanged: (start, end) {},
    ),
    const SizedBox(height: 16),
    VitTime(
      id: 'startTime',
      label: 'Start time',
      mode: VitTimeMode.twentyFourHour,
      onChanged: (time) {},
    ),
    const SizedBox(height: 16),
    VitTime(
      id: 'duration',
      label: 'Duration',
      mode: VitTimeMode.duration,
      onChanged: (time) {},
    ),
  ],
)
```

### Forms and Flow Control

`VitForm` is one of the most important parts of the package. It lets you compose complete flows from the field widgets above, while handling step navigation, validation, focus, and data collection.

The main pieces are:

- `VitForm`: the multi-step form container.
- `VitFormPage`: a page definition with title, subtitle, children, and custom validation.
- `VitFormController`: programmatic state and navigation control.
- `VitFormProvider`: inherited form state used internally and available for advanced integration.
- `VitForm.show(...)`: modal form presentation.

```dart
VitForm(
  showPageIndicator: true,
  continueButtonText: 'Next step',
  finishButtonText: 'Create account',
  pages: [
    VitFormPage(
      title: 'Account',
      subtitle: 'Let’s create your login',
      spacing: 16,
      children: const [
        VitEmailField(id: 'email'),
        VitPasswordField(id: 'password'),
        VitConfirmPasswordField(
          id: 'confirmPassword',
          passwordFieldId: 'password',
        ),
      ],
    ),
    VitFormPage(
      title: 'Profile',
      subtitle: 'Complete your information',
      spacing: 16,
      children: const [
        VitNameField(id: 'name'),
        VitPhoneField(id: 'phone'),
        VitCountryField(id: 'country'),
        VitTermsField(id: 'terms'),
      ],
    ),
  ],
  onComplete: (data) async {
    debugPrint('Collected data: $data');
  },
)
```

```dart
final result = await VitForm.show(
  context,
  pages: [
    VitFormPage(
      title: 'Quick profile edit',
      spacing: 16,
      children: const [
        VitNameField(id: 'name'),
        VitEmailField(id: 'email'),
        VitPhoneField(id: 'phone'),
      ],
    ),
  ],
);

if (result != null) {
  debugPrint('Modal form result: $result');
}
```

### Display and Content Components

Vit also includes a solid set of presentation components:

- `VitAvatar`: profile image, initials, icon, badge, and overlay support.
- `VitAvatarGroup`: overlapping avatar stacks for teams and participants.
- `VitAvatarPreview`: larger avatar presentation for profile pages.
- `VitBadge`: count, label, icon, or dot badges on any child.
- `VitCard`: a general-purpose content surface.
- `VitItemCard`: a compact icon-title-subtitle card.
- `VitListCard`: list-tile-style card layout with leading and trailing content.
- `VitProgress`: determinate or indeterminate linear progress.
- `VitAccordion`: expandable content groups with one or many open sections.

```dart
Row(
  children: [
    VitAvatar(
      backgroundImage: const NetworkImage('https://example.com/avatar.png'),
      radius: 24,
      badgeCount: 3,
      overlayIcon: Icons.camera_alt,
      onTap: () {},
    ),
    const SizedBox(width: 16),
    VitAvatarGroup(
      avatars: const [
        VitAvatar(text: 'HB'),
        VitAvatar(text: 'AL'),
        VitAvatar(text: 'VT'),
      ],
    ),
  ],
)
```

```dart
Column(
  children: [
    const VitAvatarPreview(
      text: 'HB',
      overlayIcon: Icons.edit,
      badgeLabel: 'PRO',
    ),
    const SizedBox(height: 24),
    VitBadge(
      count: 8,
      child: const Icon(Icons.notifications_none),
    ),
  ],
)
```

```dart
Column(
  children: [
    VitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          VitTitle('Weekly revenue'),
          SizedBox(height: 8),
          VitText('Rising 18% compared to last week.'),
        ],
      ),
    ),
    const SizedBox(height: 16),
    VitItemCard(
      title: 'Premium Plan',
      subtitle: 'Renews on 24 May',
      icon: const Icon(Icons.workspace_premium),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    ),
    const SizedBox(height: 16),
    VitListCard(
      leading: const VitAvatar(text: 'HB'),
      title: const Text('Hugo Bianchetti'),
      subtitle: const Text('Design system maintainer'),
      trailing: const Icon(Icons.mail_outline),
      onTap: () {},
    ),
  ],
)
```

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const VitProgress(value: 0.65),
    const SizedBox(height: 24),
    VitAccordion(
      allowMultipleExpanded: true,
      items: const [
        VitAccordionItem(
          headerText: 'Billing',
          body: Padding(
            padding: EdgeInsets.only(top: 8),
            child: VitText('Update invoices, cards, and subscriptions here.'),
          ),
        ),
        VitAccordionItem(
          headerText: 'Security',
          body: Padding(
            padding: EdgeInsets.only(top: 8),
            child: VitText('Manage sessions and two-factor authentication.'),
          ),
        ),
      ],
    ),
  ],
)
```

### Feedback and Overlays

Vit gives you several ways to show feedback and temporary interfaces:

- `VitDialog`: centered confirmation, success, and error dialogs.
- `VitModal`: adaptive modal that becomes full-screen on small screens and centered on large screens.
- `VitSheet`: draggable bottom sheet on mobile and side sheet on larger layouts.
- `VitPopover`: floating rounded surface for focused secondary actions.
- `VitToast`: transient top or bottom notifications.
- `VitStatus`: dedicated empty, success, warning, or error-state screen.

```dart
final confirmed = await VitDialog.confirm(
  context,
  message: 'Are you sure you want to archive this project?',
);

if (confirmed == true) {
  await VitDialog.success(
    context,
    message: 'The project was archived successfully.',
  );
}
```

```dart
await VitModal.show(
  context,
  title: const VitTitle('Team settings'),
  showDefaultFooter: true,
  confirmText: 'Save changes',
  content: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      VitText('Invite members, update permissions, and manage billing.'),
      SizedBox(height: 16),
      VitSwitch(
        title: 'Allow guest access',
        value: true,
      ),
    ],
  ),
);
```

```dart
await VitSheet.show(
  context,
  title: const VitTitle('Choose an action'),
  content: Column(
    children: [
      ListTile(
        leading: const Icon(Icons.copy),
        title: const Text('Duplicate'),
        onTap: () => Navigator.pop(context),
      ),
      ListTile(
        leading: const Icon(Icons.delete_outline),
        title: const Text('Delete'),
        onTap: () => Navigator.pop(context),
      ),
    ],
  ),
);
```

```dart
await VitPopover.show(
  context,
  title: const VitTitle('Filters'),
  content: Column(
    children: const [
      VitCheckbox(
        title: 'Only active projects',
        value: true,
      ),
      SizedBox(height: 12),
      VitCheckbox(
        title: 'Include archived items',
        value: false,
      ),
    ],
  ),
);
```

```dart
VitToast.show(
  context,
  message: 'Your changes were saved.',
);

VitToast.success(
  context,
  message: 'Invite sent successfully.',
);

VitToast.error(
  context,
  message: 'Could not load workspace data.',
);
```

```dart
VitStatus(
  icon: const Icon(
    Icons.wifi_off_rounded,
    size: 64,
  ),
  title: 'No internet connection',
  text: 'Please check your connection and try again.',
  actionText: 'Retry',
  onActionPressed: () {},
  secondaryActionText: 'Dismiss',
  onSecondaryActionPressed: () {},
)
```

### Layout and Navigation

Vit includes structural components so you can build complete screens, not just isolated blocks:

- `VitScaffold`: a page shell that can render a body, lists of children, or integrated navigation pages.
- `VitAppBar`: design-system-aware top bar with title, leading action, trailing actions, border, and bottom widget support.
- `VitBottomBar` and `VitBottomBarItem`: responsive navigation that behaves like a bottom bar on small screens and a side bar on larger ones.
- `VitListView`: a sliver-friendly, grid-capable scroll view with header and footer support.
- `VitTabBar`, `VitTabBarView`, and `VitTabBarItem`: segmented tab navigation styled to the system.

```dart
VitScaffold(
  appBar: VitAppBar(
    title: 'Workspace',
    trailing: [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
    ],
  ),
  navigationIndex: 0,
  onNavigationIndexChanged: (index) {},
  navigationItems: const [
    VitBottomBarItem(icon: Icons.dashboard_outlined, label: 'Overview'),
    VitBottomBarItem(icon: Icons.folder_open_outlined, label: 'Projects'),
    VitBottomBarItem(icon: Icons.person_outline, label: 'Profile'),
  ],
  navigationPages: const [
    Center(child: VitText('Overview')),
    Center(child: VitText('Projects')),
    Center(child: VitText('Profile')),
  ],
)
```

```dart
VitListView(
  header: const Padding(
    padding: EdgeInsets.all(16),
    child: VitTitle('Recent activity'),
  ),
  itemCount: 10,
  itemBuilder: (context, index) {
    return VitListCard(
      title: Text('Activity #$index'),
      subtitle: const Text('A short summary of what happened.'),
    );
  },
)
```

```dart
VitTabBarView(
  tabs: const [
    VitTabBarItem(text: 'Details'),
    VitTabBarItem(text: 'Members'),
    VitTabBarItem(text: 'Billing'),
  ],
  children: const [
    Center(child: VitText('Details tab')),
    Center(child: VitText('Members tab')),
    Center(child: VitText('Billing tab')),
  ],
)
```

### Loading and Skeleton States

Vit includes both blocking and non-blocking loading patterns:

- `VitLoading`: a centered spinner or async blocking overlay with `VitLoading.show(...)`.
- `VitLoadingScope`: a wrapper that tells compatible child components to render their skeleton state.
- `VitSkeletonShimmer`: a shimmer placeholder for custom skeleton layouts.
- Skeleton utilities and extensions are exported to make placeholder rendering easier.

```dart
await VitLoading.show(
  context,
  future: Future.delayed(
    const Duration(seconds: 2),
    () => 'done',
  ),
);
```

```dart
VitLoadingScope(
  loading: isLoading,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const VitTitle('Projects'),
      const SizedBox(height: 16),
      VitCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            VitText('Revenue summary'),
            SizedBox(height: 8),
            VitTextSmall('Updated a few seconds ago'),
          ],
        ),
      ),
    ],
  ),
)
```

```dart
VitSkeletonShimmer(
  child: Container(
    height: 18,
    width: 220,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(8),
    ),
  ),
)
```

## Example App

The repository includes a runnable Flutter showcase under [`example`](example).

Run it with:

```bash
cd example
flutter run
```

## Requirements

- Dart SDK: `^3.10.1`
- Package dependency: `intl ^0.20.2`

See [`pubspec.yaml`](pubspec.yaml) for the exact package metadata and SDK constraints.

## Contributing

Issues, improvements, and pull requests are welcome.

## License

This package is available under the MPL-2.0 License. See [`LICENSE`](LICENSE) for details.
