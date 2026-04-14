import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VitCurrencyField renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: const Column(
              children: [
                VitCurrencyField(
                  expand: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(VitCurrencyField), findsOneWidget);
    expect(find.byType(VitRawInput), findsOneWidget);
    expect(find.text('\$0,00'), findsOneWidget);
  });
}
