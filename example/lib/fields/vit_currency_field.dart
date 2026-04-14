// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitCurrencyFieldStory = Story(
  name: 'VitCurrencyField',
  description: 'A dedicated currency field with virtual keyboard.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => const VitCurrencyFieldExample(),
);

class VitCurrencyFieldExample extends StatelessWidget {
  const VitCurrencyFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Field Example'),
      ),
      body: VitForm(
        finishButtonText: 'Send Money',
        onComplete: (data) {
          VitDialog.success(
            context,
            title: 'Money Sent!',
            message: 'Amount: ${data['amount']}',
          );
        },
        pages: [
          VitFormPage(
            scrollable: false,
            children: [
              VitCurrencyField(
                id: 'amount',
                subtitle: 'Balance: \$19,462.10',
                currencySymbol: '\$',
                decimalSeparator: ',',
                thousandSeparator: '.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
