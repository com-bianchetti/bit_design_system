// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:vit_design_system/vit_design_system.dart';

Story get VitStatusStory => Story(
  name: 'VitStatus',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  description:
      'A component used to display a centralized status, mostly for empty states or errors.',
  builder: (context) {
    final title = context.knobs.text(
      label: 'Title',
      initial: 'No internet connection',
    );

    final text = context.knobs.text(
      label: 'Text',
      initial: 'Please check your connection and try again.',
    );

    final actionText = context.knobs.text(
      label: 'Action Text',
      initial: 'Retry',
    );

    final showSecondaryAction = context.knobs.boolean(
      label: 'Show Secondary Action',
      initial: false,
    );

    final secondaryActionText = context.knobs.text(
      label: 'Secondary Action Text',
      initial: 'Cancel',
    );

    final expandButtons = context.knobs.boolean(
      label: 'Expand Buttons',
      initial: false,
    );

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: VitStatus(
          icon: Icon(
            Icons.wifi_off_rounded,
            size: 64,
            color: context.theme.onBackrgroundColor,
          ),
          title: title,
          text: text,
          actionText: actionText,
          onActionPressed: () {
            debugPrint('Action pressed');
          },
          secondaryActionText: showSecondaryAction ? secondaryActionText : null,
          onSecondaryActionPressed: showSecondaryAction
              ? () {
                  debugPrint('Secondary action pressed');
                }
              : null,
          expandButtons: expandButtons,
        ),
      ),
    );
  },
);
