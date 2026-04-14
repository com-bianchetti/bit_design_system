import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrapWithApp(Widget child) {
  return VitApp(
    theme: VitTheme(),
    home: Scaffold(
      body: child,
    ),
  );
}

void main() {
  group('VitItemCard', () {
    testWidgets('renders with title', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          const VitItemCard(
            title: 'Title',
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.byType(VitItemCard), findsOneWidget);
    });

    testWidgets('renders with title and subtitle', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          const VitItemCard(
            title: 'Title',
            subtitle: 'Subtitle',
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
    });

    testWidgets('renders with icon widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          const VitItemCard(
            title: 'Title',
            icon: Icon(Icons.star),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('renders with trailing widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          const VitItemCard(
            title: 'Title',
            trailing: Icon(Icons.chevron_right),
          ),
        ),
      );

      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('handles onTap callback', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        _wrapWithApp(
          VitItemCard(
            title: 'Title',
            onTap: () {
              tapped = true;
            },
          ),
        ),
      );

      expect(tapped, false);

      await tester.tap(find.byType(VitItemCard));
      await tester.pumpAndSettle();

      expect(tapped, true);
    });

    testWidgets('applies custom border radius', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitItemCard(
            title: 'Title',
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find
            .descendant(
              of: find.byType(VitCard),
              matching: find.byType(Material),
            )
            .first,
      );

      expect(
        material.borderRadius,
        BorderRadius.circular(20),
      );
    });

    testWidgets('applies custom background color', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          const VitItemCard(
            title: 'Title',
            backgroundColor: Colors.red,
          ),
        ),
      );

      final material = tester.widget<Material>(
        find
            .descendant(
              of: find.byType(VitCard),
              matching: find.byType(Material),
            )
            .first,
      );

      expect(material.color, Colors.red);
    });
  });
}
