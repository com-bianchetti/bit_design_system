// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:vit_design_system/vit_design_system.dart';

final VitTabBarStory = Story(
  name: 'TabBar',
  description:
      'A customizable tab bar component with a pill background and indicator.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Builder(
              builder: (context) {
                final isScrollable = context.knobs.boolean(
                  label: 'Is Scrollable',
                  initial: false,
                );

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Standard Tab Bar with Custom Controller:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    VitTabBar(
                      isScrollable: isScrollable,
                      tabs: const [
                        VitTabBarItem(text: 'Charities'),
                        VitTabBarItem(text: 'Contribution'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'VitTabBarView Wrapper:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: VitTabBarView(
                        isScrollable: isScrollable,
                        tabs: const [
                          VitTabBarItem(text: 'Charities Content'),
                          VitTabBarItem(text: 'Contribution Details'),
                          VitTabBarItem(text: 'Configuration Data'),
                        ],
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: context.theme.cardColor,
                              borderRadius: context.theme.borderRadius,
                              border: Border.all(
                                color: context.theme.borderColor,
                              ),
                            ),
                            child: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (context, index) =>
                                  ListTile(title: Text('Charity item $index')),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: context.theme.cardColor,
                              borderRadius: context.theme.borderRadius,
                              border: Border.all(
                                color: context.theme.borderColor,
                              ),
                            ),
                            child: const Center(
                              child: Text('Contribution Views Content'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: context.theme.cardColor,
                              borderRadius: context.theme.borderRadius,
                              border: Border.all(
                                color: context.theme.borderColor,
                              ),
                            ),
                            child: const Center(
                              child: Text('Configuration Settings View'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  },
);
