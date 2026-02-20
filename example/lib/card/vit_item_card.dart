// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitItemCardStory = Story(
  name: 'VitItemCard',
  description:
      'VitItemCard component to display an item with icon, title, subtitle, and trailing widget',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => _VitItemCardStoryWidget(),
);

class _VitItemCardStoryWidget extends StatefulWidget {
  @override
  State<_VitItemCardStoryWidget> createState() =>
      _VitItemCardStoryWidgetState();
}

class _VitItemCardStoryWidgetState extends State<_VitItemCardStoryWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Basic Item Card',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitItemCard(
              title: 'Item Title',
              subtitle: 'This is a description of the item',
              icon: Icon(Icons.star, color: Colors.amber),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            const Text(
              'Without Icon',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitItemCard(
              title: 'Item Title',
              subtitle: 'This is a description of the item with no icon',
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            const Text(
              'Without Subtitle',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitItemCard(
              title: 'Item Title Only',
              icon: Icon(Icons.person, color: Colors.blue),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            const Text(
              'Interactive Item Card',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitItemCard(
              title: 'Tap Me',
              subtitle: 'This card is interactive and has variant style',
              variant: VitCardVariant.variant,
              icon: Icon(Icons.touch_app, color: Colors.green),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Action when tapped
              },
            ),
            const SizedBox(height: 32),
            const Text(
              'Bordered Item Card',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitItemCard(
              title: 'Bordered Item',
              subtitle: 'This card has a custom border radius and color',
              showBorder: true,
              borderColor: Colors.blue,
              borderRadius: BorderRadius.circular(24),
              icon: Icon(Icons.crop_square, color: Colors.blue),
              trailing: VitButton(
                text: 'Action',
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Loading State',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            VitButton(
              text: isLoading ? 'Stop Loading' : 'Start Loading',
              onPressed: () {
                setState(() {
                  isLoading = !isLoading;
                });
              },
            ),
            const SizedBox(height: 16),
            VitLoadingScope(
              loading: isLoading,
              child: Column(
                children: [
                  VitItemCard(
                    title: 'Loading Item',
                    subtitle: 'This item is in a loading state',
                    icon: Icon(Icons.hourglass_empty),
                    trailing: Icon(Icons.chevron_right),
                    margin: const EdgeInsets.only(bottom: 8),
                  ),
                  VitItemCard(
                    title: 'Another Loading Item',
                    subtitle: 'Detailed description that is currently hidden',
                    icon: Icon(Icons.refresh),
                    trailing: Icon(Icons.sync),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
