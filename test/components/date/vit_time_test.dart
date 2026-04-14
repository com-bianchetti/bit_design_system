import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VitTime', () {
    testWidgets('renders with label and hint text', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitTime(
              label: 'Meeting Time',
              hintText: 'Select meeting time',
            ),
          ),
        ),
      );

      expect(find.text('Meeting Time'), findsOneWidget);
      expect(find.text('Select meeting time'), findsOneWidget);
    });

    testWidgets('renders with initial value', (tester) async {
      final testTime = TimeOfDay(hour: 14, minute: 30);

      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitTime(
              label: 'Meeting Time',
              initialValue: testTime,
              mode: VitTimeMode.twentyFourHour,
            ),
          ),
        ),
      );

      expect(find.text('14:30'), findsOneWidget);
    });

    testWidgets('opens popover on tap when enabled', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitTime(
              label: 'Meeting Time',
              mode: VitTimeMode.twentyFourHour,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.byType(ListWheelScrollView), findsWidgets);
      expect(find.text('Confirm'), findsOneWidget);
    });

    testWidgets('does not open popover when disabled', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitTime(
              label: 'Meeting Time',
              enabled: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.byType(ListWheelScrollView), findsNothing);
    });

    testWidgets('displays access_time icon by default', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitTime(
              label: 'Meeting Time',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.access_time), findsOneWidget);
    });

    testWidgets('24 hour mode displays 2 wheels', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitTime(
              label: 'Time',
              mode: VitTimeMode.twentyFourHour,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.byType(ListWheelScrollView), findsNWidgets(2));
    });

    testWidgets('12 hour mode displays 3 wheels', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitTime(
              label: 'Time',
              mode: VitTimeMode.amPm,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.byType(ListWheelScrollView), findsNWidgets(3));
      // Should find AM and PM somewhere
      expect(find.text('AM'), findsWidgets);
      expect(find.text('PM'), findsWidgets);
    });

    testWidgets('validator receives VitTimeData', (tester) async {
      VitTimeData? receivedData;

      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: Form(
              key: formKey,
              child: VitTime(
                label: 'Meeting Time',
                initialValue: TimeOfDay(hour: 14, minute: 30),
                validator: (data) {
                  receivedData = data;
                  if (data == null || data.time == null) {
                    return 'Time is required';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      );

      formKey.currentState!.validate();
      await tester.pump();

      expect(receivedData, isNotNull);
      expect(receivedData!.time, isNotNull);
      expect(receivedData!.time!.hour, 14);
      expect(receivedData!.time!.minute, 30);
    });
  });
}
