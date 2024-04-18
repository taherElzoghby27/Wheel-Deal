import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:cars/core/widgets/custom_button_three_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        //   title
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pop(),
          title: StringsEn.setting,
          trailingOnTap: () {},
        ),
        CustomButtonThreeWidget(
          leading: const Icon(FontAwesomeIcons.bell),
          title: StringsEn.notificationSetting,
          onTap: () => GoRouter.of(context).push(''),
        ),
        CustomButtonThreeWidget(
          leading: const Icon(FontAwesomeIcons.key),
          title: StringsEn.passwordManager,
          onTap: () => GoRouter.of(context).push(''),
        ),
        CustomButtonThreeWidget(
          leading: const Icon(FontAwesomeIcons.trash),
          title: StringsEn.deleteAccount,
          onTap: () => GoRouter.of(context).push(''),
        ),
      ],
    );
  }
}
