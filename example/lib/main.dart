import 'package:example/accordion/vit_accordion.dart';
import 'package:example/avatar/vit_avatar.dart';
import 'package:example/button/vit_button.dart';
import 'package:example/button/vit_icon_button.dart';
import 'package:example/button/vit_social_button.dart';
import 'package:example/badge/vit_badge.dart';
import 'package:example/card/vit_card.dart';
import 'package:example/card/vit_item_card.dart';
import 'package:example/card/vit_list_card.dart';
import 'package:example/checkbox/vit_checkbox.dart';
import 'package:example/chip/vit_chip.dart';
import 'package:example/date/vit_date.dart';
import 'package:example/date/vit_time.dart';
import 'package:example/dialog/vit_dialog.dart';
import 'package:example/layout/vit_bottom_bar.dart';
import 'package:example/loading/vit_loading.dart';
import 'package:example/modal/vit_modal.dart';
import 'package:example/form/vit_form.dart';
import 'package:example/fields/vit_fields.dart';
import 'package:example/input/vit_input.dart';
import 'package:example/input/vit_raw_input.dart';
import 'package:example/input/vit_input_count.dart';
import 'package:example/layout/vit_appbar.dart';
import 'package:example/layout/vit_list_view.dart';
import 'package:example/layout/vit_scaffold.dart';
import 'package:example/popover/vit_popover.dart';
import 'package:example/progress/vit_progress.dart';
import 'package:example/radio/vit_radio.dart';
import 'package:example/select/vit_select.dart';
import 'package:example/sheet/vit_sheet.dart';
import 'package:example/skeleton/vit_skeleton.dart';
import 'package:example/slider/vit_slider.dart';
import 'package:example/switch/vit_switch.dart';
import 'package:example/text/vit_text.dart';
import 'package:example/text/vit_text_rich.dart';
import 'package:example/toast/vit_toast.dart';
import 'package:example/layout/vit_status.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const MyApp());
}

Map<String, String> getQueryParameters() {
  final uri = Uri.base;
  return uri.queryParameters;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final queryParams = getQueryParameters();
    final initialStory = queryParams['story'];

    return Storybook(
      initialStory: initialStory,
      stories: [
        VitTextStory,
        VitTextRichStory,
        VitButtonStory,
        VitIconButtonStory,
        VitSocialButtonStory,
        VitAvatarStory,
        VitBadgeStory,
        VitCardStory,
        VitItemCardStory,
        VitListCardStory,
        VitProgressStory,
        VitAccordionStory,
        VitSheetStory,
        VitDialogStory,
        VitLoadingStory,
        VitModalStory,
        VitPopoverStory,
        VitToastStory,
        VitSwitchStory,
        VitCheckboxStory,
        VitRadioStory,
        VitChipStory,
        VitSliderStory,
        VitInputStory,
        VitRawInputStory,
        VitInputCountStory,
        VitSelectStory,
        VitDateStory,
        VitTimeStory,
        VitFormStory,
        VitFieldsStory,
        VitSkeletonStory,
        VitAppBarStory,
        VitListViewStory,
        VitScaffoldStory,
        VitBottomBarStory,
        VitStatusStory,
      ],
    );
  }
}
