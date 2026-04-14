// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitIconButtonStory = Story(
  name: 'VitIconButton',
  description: 'VitIconButton component to display an icon button.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Visual Density: Comfortable'),
            const SizedBox(height: 8),
            VitIconButton(
              icon: const Icon(Icons.add),
              visualDensity: VisualDensity.comfortable,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Button pressed'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('Visual Density: Standard'),
            const SizedBox(height: 8),
            VitIconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Button pressed'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('Visual Density: Compact'),
            const SizedBox(height: 8),
            VitIconButton(
              icon: const Icon(Icons.check),
              visualDensity: VisualDensity.compact,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Button pressed'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('Custom BorderRadius & Colors'),
            const SizedBox(height: 8),
            VitIconButton(
              icon: const Icon(Icons.home),
              backgroundColor: Colors.blue,
              iconColor: Colors.white,
              borderRadius: BorderRadius.circular(90),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Button pressed'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('Disabled state'),
            const SizedBox(height: 8),
            VitIconButton(
              icon: const Icon(Icons.close),
              isDisabled: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
    ),
  ),
);
