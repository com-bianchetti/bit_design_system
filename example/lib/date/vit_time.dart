// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitTimeStory = Story(
  name: 'VitTime',
  description: 'VitTime component to display time picker fields',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => _VitTimeStoryWidget(),
);

class _VitTimeStoryWidget extends StatefulWidget {
  @override
  State<_VitTimeStoryWidget> createState() => _VitTimeStoryWidgetState();
}

class _VitTimeStoryWidgetState extends State<_VitTimeStoryWidget> {
  TimeOfDay? basicTime;
  TimeOfDay? twentyFourTime;
  TimeOfDay? controlledTime = TimeOfDay(hour: 10, minute: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const VitTitleBig('VitTime Examples'),
              const SizedBox(height: 30),
              const VitTitle('Basic Time Picker (12-hour AM/PM)'),
              const SizedBox(height: 10),
              VitTime(
                label: 'Alarm Time',
                hintText: 'Select your alarm time',
                mode: VitTimeMode.amPm,
                onChanged: (time) {
                  setState(() {
                    basicTime = time;
                  });
                },
              ),
              if (basicTime != null) ...[
                const SizedBox(height: 10),
                VitText('Selected: ${basicTime!.format(context)}'),
              ],
              const SizedBox(height: 30),
              const VitTitle('Card Variant Time Picker (12-hour AM/PM)'),
              const SizedBox(height: 10),
              VitTime(
                label: 'Event Time',
                hintText: 'Select your event time',
                mode: VitTimeMode.twentyFourHour,
                variant: VitPickerVariant.card,
                onChanged: (time) {
                  // The card variant updates state internally and behaves the same
                },
              ),
              const SizedBox(height: 30),
              const VitTitle('Basic Time Picker (24-hour)'),
              const SizedBox(height: 10),
              VitTime(
                label: 'Meeting Time',
                hintText: 'Select meeting time',
                mode: VitTimeMode.twentyFourHour,
                onChanged: (time) {
                  setState(() {
                    twentyFourTime = time;
                  });
                },
              ),
              if (twentyFourTime != null) ...[
                const SizedBox(height: 10),
                VitText(
                  'Selected: ${twentyFourTime!.hour.toString().padLeft(2, '0')}:${twentyFourTime!.minute.toString().padLeft(2, '0')}',
                ),
              ],
              const SizedBox(height: 30),
              const VitTitle('Controlled Time Picker'),
              const SizedBox(height: 10),
              VitTime(
                label: 'Event Time',
                value: controlledTime,
                onChanged: (time) {
                  setState(() {
                    controlledTime = time;
                  });
                },
              ),
              if (controlledTime != null) ...[
                const SizedBox(height: 10),
                VitText('Controlled value: ${controlledTime!.format(context)}'),
              ],
              const SizedBox(height: 30),
              const VitTitle('Time Picker with Initial Value'),
              const SizedBox(height: 10),
              const VitTime(
                label: 'Start Time',
                initialValue: TimeOfDay(hour: 9, minute: 0),
              ),
              const SizedBox(height: 30),
              const VitTitle('Disabled Time Picker'),
              const SizedBox(height: 10),
              const VitTime(
                label: 'Read Only Time',
                enabled: false,
                initialValue: TimeOfDay(hour: 12, minute: 0),
              ),
              const SizedBox(height: 30),
              const VitTitle('Time Picker with Error'),
              const SizedBox(height: 10),
              const VitTime(
                label: 'Required Time',
                errorText: 'This field is required',
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
