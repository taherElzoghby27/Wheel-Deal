import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

import 'dark_mode_widget.dart';
import 'language_widget.dart';
import 'notifications_widget.dart';
import 'receieve_marketing_widget.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
          Container(
            decoration: AppConsts.mainDecorationWithoutBorder,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LanguageWidget(),
                CustomDivider(
                  color: Theme.of(context).canvasColor.withOpacity(.05),
                ),
                const DarkModeWidget(),
                CustomDivider(
                  color: Theme.of(context).canvasColor.withOpacity(.05),
                ),
                const NotificationsWidget(),
                CustomDivider(
                  color: Theme.of(context).canvasColor.withOpacity(.05),
                ),
                const ReceiveMarketingWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
