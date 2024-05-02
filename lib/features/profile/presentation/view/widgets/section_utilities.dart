import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_button_three_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../home/presentation/view/widgets/top_leading_trailing.dart';

class SectionUtilities extends StatelessWidget {
  const SectionUtilities({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const TopLeadingTrailing(
            leading: StringsEn.utilities,
            leadingColor: AppConsts.mainColor,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
          CustomButtonThreeWidget(
            leading: const Icon(FontAwesomeIcons.userCheck),
            title: StringsEn.accountVerifi,
            onTap: () => GoRouter.of(context).push(verificationWelcomePath),
          ),
          CustomButtonThreeWidget(
            leading: const Icon(FontAwesomeIcons.lock),
            title: StringsEn.signInSecurity,
            onTap: () => GoRouter.of(context).push(signInSecurityPath),
          ),
          CustomButtonThreeWidget(
            leading: const Icon(FontAwesomeIcons.gear),
            title: StringsEn.setting,
            onTap: () => GoRouter.of(context).push(settingsPath),
          ),
          CustomButtonThreeWidget(
            leading: const Icon(FontAwesomeIcons.shield),
            title: StringsEn.privacyPolicy,
            onTap: () => GoRouter.of(context).push(''),
          ),
          CustomButtonThreeWidget(
            leading: const Icon(FontAwesomeIcons.trash),
            title: StringsEn.deleteAccount,
            onTap: () => GoRouter.of(context).push(deleteAccountPath),
          ),
          CustomButtonThreeWidget(
            leading: const Icon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: AppConsts.danger500,
            ),
            title: StringsEn.logout,
            onTap: () => GoRouter.of(context).push(''),
            color: AppConsts.danger500,
          ),
        ],
      ),
    );
  }
}
