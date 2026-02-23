import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vit_design_system/vit_design_system.dart';

Widget _wrapWithApp(Widget child) {
  return VitApp(
    theme: VitTheme(),
    home: DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Center(child: child),
      ),
    ),
  );
}

void main() {
  group('VitTabBar', () {
    testWidgets('renders tabs correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          const VitTabBar(
            tabs: [
              Tab(text: 'Charities'),
              Tab(text: 'Contribution'),
            ],
          ),
        ),
      );

      expect(find.byType(VitTabBar), findsOneWidget);
      expect(find.text('Charities'), findsOneWidget);
      expect(find.text('Contribution'), findsOneWidget);
    });

    testWidgets('calls onTap when a tab is tapped', (
      WidgetTester tester,
    ) async {
      int tappedIndex = -1;

      await tester.pumpWidget(
        _wrapWithApp(
          VitTabBar(
            onTap: (index) => tappedIndex = index,
            tabs: const [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
            ],
          ),
        ),
      );

      await tester.tap(find.text('Tab 2'));
      await tester.pumpAndSettle();

      expect(tappedIndex, 1);
    });

    testWidgets('respects custom colors', (WidgetTester tester) async {
      const customBgColor = Colors.red;
      const customIndicatorColor = Colors.green;

      await tester.pumpWidget(
        _wrapWithApp(
          const VitTabBar(
            backgroundColor: customBgColor,
            indicatorColor: customIndicatorColor,
            tabs: [
              Tab(text: 'A'),
              Tab(text: 'B'),
            ],
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(VitTabBar),
              matching: find.byType(Container),
            )
            .first,
      );

      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.color, customBgColor);

      final tabBar = tester.widget<TabBar>(find.byType(TabBar));
      final indicatorDecoration = tabBar.indicator as BoxDecoration;
      expect(indicatorDecoration.color, customIndicatorColor);
    });

    testWidgets('respects VisualDensity padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          const VitTabBar(
            visualDensity: VisualDensity.compact,
            tabs: [
              Tab(text: 'C'),
              Tab(text: 'D'),
            ],
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(VitTabBar),
              matching: find.byType(Container),
            )
            .first,
      );

      // Compact padding
      expect(container.padding, const EdgeInsets.all(2));
    });
  });
}
