// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitDateStory = Story(
  name: 'VitDate',
  description: 'VitDate component to display date picker fields',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => _VitDateStoryWidget(),
);

class _VitDateStoryWidget extends StatefulWidget {
  @override
  State<_VitDateStoryWidget> createState() => _VitDateStoryWidgetState();
}

class _VitDateStoryWidgetState extends State<_VitDateStoryWidget> {
  DateTime? selectedBirthDate;
  DateTime? selectedAppointment;
  DateTime? controlledDate = DateTime.now();
  DateTime? travelStartDate;
  DateTime? travelEndDate;
  DateTime? eventStartDate = DateTime.now();
  DateTime? eventEndDate = DateTime.now().add(const Duration(days: 7));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const VitTitleBig('VitDate Examples'),
              const SizedBox(height: 30),
              const VitTitle('Basic Date Picker'),
              const SizedBox(height: 10),
              VitDate(
                label: 'Birth Date',
                hintText: 'Select your birth date',
                onChanged: (date) {
                  setState(() {
                    selectedBirthDate = date;
                  });
                },
              ),
              if (selectedBirthDate != null) ...[
                const SizedBox(height: 10),
                VitText('Selected: ${_formatDate(selectedBirthDate!)}'),
              ],
              const SizedBox(height: 30),
              const VitTitle('Card Variant Date Picker'),
              const SizedBox(height: 10),
              VitDate(
                label: 'Event Date',
                hintText: 'Select event date',
                variant: VitPickerVariant.card,
                onChanged: (date) {
                  // Internal state updates the UI
                },
              ),
              const SizedBox(height: 30),
              const VitTitle('Date Picker with Initial Value'),
              const SizedBox(height: 10),
              VitDate(
                label: 'Appointment Date',
                initialValue: DateTime.now().add(const Duration(days: 7)),
                onChanged: (date) {
                  setState(() {
                    selectedAppointment = date;
                  });
                },
              ),
              const SizedBox(height: 30),
              const VitTitle('Controlled Date Picker'),
              const SizedBox(height: 10),
              VitDate(
                label: 'Event Date',
                value: controlledDate,
                onChanged: (date) {
                  setState(() {
                    controlledDate = date;
                  });
                },
              ),
              if (controlledDate != null) ...[
                const SizedBox(height: 10),
                VitText('Controlled value: ${_formatDate(controlledDate!)}'),
              ],
              const SizedBox(height: 30),
              const VitTitle('Date Picker with Leading Icon'),
              const SizedBox(height: 10),
              const VitDate(
                label: 'Meeting Date',
                hintText: 'Select meeting date',
                leading: Icon(Icons.event),
              ),
              const SizedBox(height: 30),
              const VitTitle('Date Picker with Custom Icon'),
              const SizedBox(height: 10),
              const VitDate(
                label: 'Deadline',
                hintText: 'Select deadline',
                trailingIcon: Icons.access_time,
              ),
              const SizedBox(height: 30),
              const VitTitle('Date Picker with Helper Text'),
              const SizedBox(height: 10),
              const VitDate(
                label: 'Start Date',
                hintText: 'Select start date',
                helperText: 'Choose the project start date',
              ),
              const SizedBox(height: 30),
              const VitTitle('Date Picker with Error'),
              const SizedBox(height: 10),
              const VitDate(
                label: 'Required Date',
                errorText: 'This field is required',
              ),
              const SizedBox(height: 30),
              const VitTitle('Disabled Date Picker'),
              const SizedBox(height: 10),
              VitDate(
                label: 'Read Only Date',
                enabled: false,
                initialValue: DateTime.now(),
              ),
              const SizedBox(height: 30),
              const VitTitle('Date Picker with Custom Format'),
              const SizedBox(height: 10),
              const VitDate(
                label: 'Custom Format',
                hintText: 'Select date',
                dateFormat: 'dd/MM/yyyy',
              ),
              const SizedBox(height: 30),
              const VitTitle('Date Range Picker'),
              const SizedBox(height: 10),
              VitDate(
                label: 'Travel Dates',
                hintText: 'Select travel dates',
                rangeSelection: true,
                onRangeChanged: (start, end) {
                  setState(() {
                    travelStartDate = start;
                    travelEndDate = end;
                  });
                },
              ),
              if (travelStartDate != null && travelEndDate != null) ...[
                const SizedBox(height: 10),
                VitText(
                  'Selected range: ${_formatDate(travelStartDate!)} - ${_formatDate(travelEndDate!)}',
                ),
              ],
              const SizedBox(height: 30),
              const VitTitle('Card Variant Date Range Picker'),
              const SizedBox(height: 10),
              VitDate(
                label: 'Project Duration',
                hintText: 'Select duration',
                rangeSelection: true,
                variant: VitPickerVariant.card,
                onRangeChanged: (start, end) {
                  // Internal state updates the UI
                },
              ),
              const SizedBox(height: 30),
              const VitTitle('Date Range with Initial Values'),
              const SizedBox(height: 10),
              VitDate(
                label: 'Booking Period',
                rangeSelection: true,
                initialRangeStart: DateTime.now(),
                initialRangeEnd: DateTime.now().add(const Duration(days: 14)),
                onRangeChanged: (start, end) {
                  debugPrint('Range changed: $start - $end');
                },
              ),
              const SizedBox(height: 30),
              const VitTitle('Controlled Date Range'),
              const SizedBox(height: 10),
              VitDate(
                label: 'Event Duration',
                rangeSelection: true,
                rangeStart: eventStartDate,
                rangeEnd: eventEndDate,
                onRangeChanged: (start, end) {
                  setState(() {
                    eventStartDate = start;
                    eventEndDate = end;
                  });
                },
              ),
              if (eventStartDate != null && eventEndDate != null) ...[
                const SizedBox(height: 10),
                VitText(
                  'Event duration: ${_formatDate(eventStartDate!)} - ${_formatDate(eventEndDate!)}',
                ),
              ],
              const SizedBox(height: 30),
              const VitTitle('Date Range with Custom Separator'),
              const SizedBox(height: 10),
              const VitDate(
                label: 'Vacation',
                hintText: 'Select vacation period',
                rangeSelection: true,
                rangeSeparator: ' to ',
              ),
              const SizedBox(height: 30),
              const VitTitle('Date Range with Custom Button Text'),
              const SizedBox(height: 10),
              const VitDate(
                label: 'Conference Dates',
                rangeSelection: true,
                confirmButtonText: 'Apply Dates',
              ),
              const SizedBox(height: 30),
              const VitTitle('Date Picker with Min/Max Dates'),
              const SizedBox(height: 10),
              VitDate(
                label: 'Availability',
                hintText: 'Select within next 30 days',
                minDate: DateTime.now(),
                maxDate: DateTime.now().add(const Duration(days: 30)),
              ),
              const SizedBox(height: 30),
              const VitTitle('Compact Date Picker'),
              const SizedBox(height: 10),
              const VitDate(
                label: 'Date',
                hintText: 'Select date',
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(height: 30),
              const VitTitle('Comfortable Date Picker'),
              const SizedBox(height: 10),
              const VitDate(
                label: 'Date',
                hintText: 'Select date',
                visualDensity: VisualDensity.comfortable,
              ),
              const SizedBox(height: 30),
              const VitTitle('Date Picker with Month/Year Selection'),
              const SizedBox(height: 10),
              const VitDate(
                label: 'Birth Date',
                hintText: 'Select your birth date',
                selectDate: true,
              ),
              const SizedBox(height: 30),
              const VitTitle('Date Range with Month/Year Selection'),
              const SizedBox(height: 10),
              const VitDate(
                label: 'Project Duration',
                hintText: 'Select project duration',
                rangeSelection: true,
                selectDate: true,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
