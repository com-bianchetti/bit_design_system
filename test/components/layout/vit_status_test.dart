import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vit_design_system/vit_design_system.dart';

void main() {
  Widget buildApp(Widget child) {
    return VitApp(
      theme: VitTheme(),
      home: Scaffold(body: child),
    );
  }

  group('VitStatus', () {
    testWidgets('renders icon, title, text, and primary action', (
      WidgetTester tester,
    ) async {
      bool actionPressed = false;

      await tester.pumpWidget(
        buildApp(
          VitStatus(
            icon: const Icon(Icons.error),
            title: 'Error Title',
            text: 'Error text description.',
            actionText: 'Retry',
            onActionPressed: () {
              actionPressed = true;
            },
          ),
        ),
      );

      expect(find.byIcon(Icons.error), findsOneWidget);
      expect(find.text('Error Title'), findsOneWidget);
      expect(find.text('Error text description.'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);

      await tester.tap(find.text('Retry'));
      expect(actionPressed, isTrue);

      await tester.pumpAndSettle();
    });

    testWidgets('renders secondary action when provided', (
      WidgetTester tester,
    ) async {
      bool secondaryPressed = false;

      await tester.pumpWidget(
        buildApp(
          VitStatus(
            icon: const Icon(Icons.check),
            title: 'Success',
            text: 'Task completed.',
            actionText: 'Done',
            onActionPressed: () {},
            secondaryActionText: 'Undo',
            onSecondaryActionPressed: () {
              secondaryPressed = true;
            },
          ),
        ),
      );

      expect(find.text('Undo'), findsOneWidget);

      await tester.tap(find.text('Undo'));
      expect(secondaryPressed, isTrue);

      await tester.pumpAndSettle();
    });

    testWidgets('expands buttons when expandButtons is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildApp(
          VitStatus(
            icon: const Icon(Icons.info),
            title: 'Info',
            text: 'Information',
            actionText: 'OK',
            onActionPressed: () {},
            secondaryActionText: 'Cancel',
            onSecondaryActionPressed: () {},
            expandButtons: true,
          ),
        ),
      );

      // We can verify VitButtons are rendered. With expandButtons=true,
      // they get automatically wrapped in Flexible by VitButton's internal logic
      // if placed in a Row.
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);

      await tester.pumpAndSettle();
    });
  });
}
