import 'package:vit_design_system/components/button/vit_icon_button.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:vit_design_system/vit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VitIconButton', () {
    testWidgets('renders button with icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitIconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitIconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  pressed = true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitIconButton));
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitIconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  pressed = true;
                },
                isDisabled: true,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitIconButton));
      await tester.pumpAndSettle();
      expect(pressed, isFalse);
    });

    testWidgets('applies custom background color', (tester) async {
      const customColor = Colors.blue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitIconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
                backgroundColor: customColor,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer).first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, customColor);
    });

    testWidgets('applies custom icon color', (tester) async {
      const customColor = Colors.red;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitIconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
                iconColor: customColor,
              ),
            ),
          ),
        ),
      );

      final iconTheme = tester.widget<IconTheme>(
        find
            .ancestor(
              of: find.byIcon(Icons.add),
              matching: find.byType(IconTheme),
            )
            .first,
      );
      expect(iconTheme.data.color, customColor);
    });

    testWidgets('applies custom padding', (tester) async {
      const customPadding = EdgeInsets.all(20);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitIconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
                padding: customPadding,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer).first,
      );
      expect(container.padding, customPadding);
    });

    testWidgets('applies custom border radius', (tester) async {
      const customRadius = BorderRadius.all(Radius.circular(20));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitIconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
                borderRadius: customRadius,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer).first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, customRadius);
    });

    testWidgets('applies visual density comfortable', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitIconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
                visualDensity: VisualDensity.comfortable,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer).first,
      );
      expect(container.padding, const EdgeInsets.all(12));
    });

    testWidgets('applies semantic label for accessibility', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitIconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
                semanticLabel: 'Custom Label',
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(VitIconButton)),
        matchesSemantics(
          label: 'Custom Label',
          isButton: true,
        ),
      );
    });
  });
}
