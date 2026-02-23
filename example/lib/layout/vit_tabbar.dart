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
                    VitTabBar(
                      isScrollable: isScrollable,
                      tabs: const [
                        Tab(text: 'Charities'),
                        Tab(text: 'Contribution'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: context.theme.borderRadius,
                        border: Border.all(
                          color: context.theme.borderColor,
                        ),
                      ),
                      child: const TabBarView(
                        children: [
                          Center(child: Text('Charities Content')),
                          Center(child: Text('Contribution Content')),
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
