// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitAppBarStory = Story(
  name: 'VitAppBar',
  description: 'VitAppBar component for consistent app bar styling.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VitButton(
              text: 'Basic AppBar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _BasicAppBarExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'AppBar with Actions',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _ActionsAppBarExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Centered Title AppBar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _CenteredTitleAppBarExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Custom Colors AppBar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _CustomColorsAppBarExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'No Border AppBar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _NoBorderAppBarExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Elevated AppBar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _ElevatedAppBarExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Custom Leading Icon',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _CustomLeadingAppBarExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Custom Leading Widget',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const _CustomLeadingWidgetAppBarExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'No Leading AppBar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _NoLeadingAppBarExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Custom Title Widget',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const _CustomTitleWidgetAppBarExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Tall AppBar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _TallAppBarExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Custom Padding AppBar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _CustomPaddingAppBarExample(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  ),
);

class _BasicAppBarExample extends StatelessWidget {
  const _BasicAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Basic AppBar',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('Basic AppBar Example'),
              const SizedBox(height: 16),
              VitText(
                'This is a basic app bar with a title and back button. '
                'The back button automatically handles navigation.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionsAppBarExample extends StatelessWidget {
  const _ActionsAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'AppBar with Actions',
        onLeadingPressed: () => Navigator.pop(context),
        trailing: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search pressed')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Favorite pressed')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('More pressed')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('AppBar with Actions'),
              const SizedBox(height: 16),
              VitText(
                'This app bar includes trailing action buttons. '
                'You can add as many actions as needed.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CenteredTitleAppBarExample extends StatelessWidget {
  const _CenteredTitleAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Centered Title',
        centerTitle: true,
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('Centered Title AppBar'),
              const SizedBox(height: 16),
              VitText(
                'The title is centered in the app bar. '
                'This is useful for iOS-style navigation.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomColorsAppBarExample extends StatelessWidget {
  const _CustomColorsAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Custom Colors',
        backgroundColor: context.theme.primaryColor,
        foregroundColor: context.theme.onPrimaryColor,
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('Custom Colors AppBar'),
              const SizedBox(height: 16),
              VitText(
                'This app bar uses custom background and foreground colors. '
                'You can customize colors to match your design.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoBorderAppBarExample extends StatelessWidget {
  const _NoBorderAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'No Border',
        showBorder: false,
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('No Border AppBar'),
              const SizedBox(height: 16),
              VitText(
                'This app bar has no bottom border for a cleaner look. '
                'Use showBorder: false to hide the border.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ElevatedAppBarExample extends StatelessWidget {
  const _ElevatedAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Elevated AppBar',
        elevation: 8.0,
        showBorder: false,
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('Elevated AppBar'),
              const SizedBox(height: 16),
              VitText(
                'This app bar has elevation for a shadow effect. '
                'The elevation property controls the shadow depth.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomLeadingAppBarExample extends StatelessWidget {
  const _CustomLeadingAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Custom Leading Icon',
        leadingIcon: Icons.menu,
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('Custom Leading Icon'),
              const SizedBox(height: 16),
              VitText(
                'The leading icon can be customized using the leadingIcon property. '
                'This example uses a menu icon instead of the default back arrow.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomLeadingWidgetAppBarExample extends StatelessWidget {
  const _CustomLeadingWidgetAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Custom Leading Widget',
        leading: VitAvatar(
          text: 'U',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Avatar pressed')),
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('Custom Leading Widget'),
              const SizedBox(height: 16),
              VitText(
                'You can provide any custom widget as the leading element. '
                'This example uses an avatar instead of an icon button.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoLeadingAppBarExample extends StatelessWidget {
  const _NoLeadingAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'No Leading',
        showLeading: false,
        trailing: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('No Leading AppBar'),
              const SizedBox(height: 16),
              VitText(
                'This app bar has no leading widget. '
                'The close button is in the trailing actions instead.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomTitleWidgetAppBarExample extends StatelessWidget {
  const _CustomTitleWidgetAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        titleWidget: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: context.theme.errorColor,
              size: 20,
            ),
            const SizedBox(width: 8),
            VitTitle('Custom Title Widget'),
            const SizedBox(width: 8),
            Icon(
              Icons.star,
              color: context.theme.errorColor,
              size: 20,
            ),
          ],
        ),
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('Custom Title Widget'),
              const SizedBox(height: 16),
              VitText(
                'You can provide a completely custom title widget. '
                'This example includes icons alongside the title text.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TallAppBarExample extends StatelessWidget {
  const _TallAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Tall AppBar',
        height: 80.0,
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('Tall AppBar'),
              const SizedBox(height: 16),
              VitText(
                'This app bar has a custom height of 80 pixels. '
                'You can adjust the height to fit your design needs.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomPaddingAppBarExample extends StatelessWidget {
  const _CustomPaddingAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Custom Padding',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('Custom Padding AppBar'),
              const SizedBox(height: 16),
              VitText(
                'The AppBar uses Flutter built-in padding system.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
