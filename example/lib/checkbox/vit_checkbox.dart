// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitCheckboxStory = Story(
  name: 'VitCheckbox',
  description: 'VitCheckbox component to display a checkbox',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => _VitCheckboxStoryWidget(),
);

class _VitCheckboxStoryWidget extends StatefulWidget {
  @override
  State<_VitCheckboxStoryWidget> createState() =>
      _VitCheckboxStoryWidgetState();
}

class _VitCheckboxStoryWidgetState extends State<_VitCheckboxStoryWidget> {
  bool standaloneCheckbox = true;
  bool comfortableCheckbox = false;
  bool standardCheckbox = true;
  bool compactCheckbox = false;
  bool leftPositionCheckbox = true;
  bool rightPositionCheckbox = false;
  bool withSubtitleCheckbox = true;
  bool disabledCheckbox = false;
  bool customColorCheckbox = true;
  bool squareCheckbox = true;
  bool circleCheckbox = false;
  bool convexCheckbox = true;
  bool? tristateCheckbox;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Standalone Checkbox',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Center(
                child: VitCheckbox(
                  value: standaloneCheckbox,
                  onChanged: (value) {
                    setState(() {
                      standaloneCheckbox = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density: Comfortable',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: true,
                onChanged: (value) {
                  setState(() {
                    comfortableCheckbox = value;
                  });
                },
                title: 'Accept Terms',
                visualDensity: VisualDensity.comfortable,
              ),
              const SizedBox(height: 16),
              const Text(
                'Visual Density: Standard',

                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: standardCheckbox,
                onChanged: (value) {
                  setState(() {
                    standardCheckbox = value;
                  });
                },
                title: 'Subscribe Newsletter',
                visualDensity: VisualDensity.standard,
              ),
              const SizedBox(height: 16),
              const Text(
                'With icon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                icon: const Icon(Icons.mail_outline),
                title: 'Subscribe Newsletter',
                visualDensity: VisualDensity.standard,
              ),
              const SizedBox(height: 16),
              const Text(
                'Visual Density: Compact',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: compactCheckbox,
                onChanged: (value) {
                  setState(() {
                    compactCheckbox = value;
                  });
                },
                title: 'Remember Me',
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(height: 32),
              const Text(
                'Checkbox Position: Left',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: leftPositionCheckbox,
                onChanged: (value) {
                  setState(() {
                    leftPositionCheckbox = value;
                  });
                },
                title: 'Privacy Policy',
                checkboxPosition: VitCheckboxPosition.left,
              ),
              const SizedBox(height: 16),
              const Text(
                'Checkbox Position: Right',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: rightPositionCheckbox,
                onChanged: (value) {
                  setState(() {
                    rightPositionCheckbox = value;
                  });
                },
                title: 'Marketing Emails',
                checkboxPosition: VitCheckboxPosition.right,
              ),
              const SizedBox(height: 32),
              const Text(
                'With Title and Subtitle',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: withSubtitleCheckbox,
                onChanged: (value) {
                  setState(() {
                    withSubtitleCheckbox = value;
                  });
                },
                title: 'Terms and Conditions',
                subtitle:
                    'I agree to the terms and conditions and privacy policy',
              ),
              const SizedBox(height: 32),
              const Text(
                'Disabled Checkbox',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: disabledCheckbox,
                onChanged: null,
                title: 'Premium Feature',
                subtitle: 'Upgrade to enable this feature',
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Colors',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: customColorCheckbox,
                onChanged: (value) {
                  setState(() {
                    customColorCheckbox = value;
                  });
                },
                title: 'Custom Theme',
                subtitle: 'Checkbox with custom active color',
                activeColor: Colors.green,
              ),
              const SizedBox(height: 32),
              const Text(
                'Shapes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: squareCheckbox,
                onChanged: (value) {
                  setState(() {
                    squareCheckbox = value;
                  });
                },
                title: 'Square Shape (Default)',
                shape: VitCheckboxShape.square,
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: circleCheckbox,
                onChanged: (value) {
                  setState(() {
                    circleCheckbox = value;
                  });
                },
                title: 'Circle Shape',
                shape: VitCheckboxShape.circle,
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: convexCheckbox,
                onChanged: (value) {
                  setState(() {
                    convexCheckbox = value;
                  });
                },
                title: 'Convex Shape (Pillow)',
                shape: VitCheckboxShape.convex,
              ),
              const SizedBox(height: 32),
              const Text(
                'Sizes Override',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: squareCheckbox,
                onChanged: (value) {},
                title: 'Custom Size (32px)',
                checkboxSize: 32,
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: circleCheckbox,
                onChanged: (value) {},
                title: 'Custom Size (12px)',
                checkboxSize: 12,
              ),
              const SizedBox(height: 32),
              const Text(
                'Tristate Checkbox',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitCheckbox(
                value: tristateCheckbox,
                onChanged: (value) {
                  setState(() {
                    if (tristateCheckbox == null) {
                      tristateCheckbox = true;
                    } else if (tristateCheckbox == true) {
                      tristateCheckbox = false;
                    } else {
                      tristateCheckbox = null;
                    }
                  });
                },
                title: 'Select All',
                subtitle: 'Supports null, true, and false states',
                tristate: true,
              ),
              const SizedBox(height: 32),
              const Text(
                'List of Options',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  VitCheckbox(
                    value: standaloneCheckbox,
                    onChanged: (value) {
                      setState(() {
                        standaloneCheckbox = value;
                      });
                    },
                    title: 'Receive Email Updates',
                    subtitle: 'Get notified about new features',
                  ),
                  const SizedBox(height: 8),
                  VitCheckbox(
                    value: comfortableCheckbox,
                    onChanged: (value) {
                      setState(() {
                        comfortableCheckbox = value;
                      });
                    },
                    title: 'Marketing Communications',
                    subtitle: 'Receive promotional content',
                  ),
                  const SizedBox(height: 8),
                  VitCheckbox(
                    value: standardCheckbox,
                    onChanged: (value) {
                      setState(() {
                        standardCheckbox = value;
                      });
                    },
                    title: 'Product Updates',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
