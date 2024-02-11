import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_button_three_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SectionSetting extends StatelessWidget {
  const SectionSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButtonThreeWidget(
          leading: const Icon(FontAwesomeIcons.user),
          title: StringsEn.editProfile,
          trailing: Icons.arrow_forward_ios,
          onTap: () => GoRouter.of(context).push(editProfilePath),
        ),
        CustomButtonThreeWidget(
          leading: const Icon(FontAwesomeIcons.locationDot),
          title: StringsEn.address,
          trailing: Icons.arrow_forward_ios,
          onTap: () => GoRouter.of(context).push(''),
        ),
        CustomButtonThreeWidget(
          leading: const Icon(FontAwesomeIcons.gear),
          title: StringsEn.setting,
          trailing: Icons.arrow_forward_ios,
          onTap: () => GoRouter.of(context).push(''),
        ),
        CustomButtonThreeWidget(
          leading: const Icon(FontAwesomeIcons.info),
          title: StringsEn.help,
          trailing: Icons.arrow_forward_ios,
          onTap: () => GoRouter.of(context).push(''),
        ),
        CustomButtonThreeWidget(
          leading: const Icon(
            FontAwesomeIcons.arrowRightFromBracket,
            color: AppConsts.danger500,
          ),
          title: StringsEn.logout,
          trailing: Icons.arrow_forward_ios,
          onTap: () => GoRouter.of(context).push(''),
          color: AppConsts.danger500,
        ),
      ],
    );
  }
}
