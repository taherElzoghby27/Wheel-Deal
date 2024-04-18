import 'package:cars/core/consts/style.dart';
import 'package:cars/features/home/presentation/view/widgets/top_leading_trailing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/custom_button_three_widget.dart';

class SectionPersonalInfo extends StatelessWidget {
  const SectionPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          TopLeadingTrailing(
            leading: StringsEn.personalInfo,
            leadingColor: AppConsts.mainColor,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
          CustomButtonThreeWidget(
            leading: const Icon(FontAwesomeIcons.user),
            title: StringsEn.id,
            trailing: const Text(
              '35154642',
              style: AppConsts.style14,
            ),
            onTap: () => GoRouter.of(context).push(editProfilePath),
          ),
          CustomButtonThreeWidget(
            leading: const Icon(Icons.email),
            trailing: const Text(
              'tataamen@gmail.com',
              style: AppConsts.style14,
            ),
            title: StringsEn.email,
            onTap: () => GoRouter.of(context).push(''),
          ),
          CustomButtonThreeWidget(
            leading: const Icon(FontAwesomeIcons.phone),
            trailing: const Text(
              '01023412234',
              style: AppConsts.style14,
            ),
            title: StringsEn.phone,
            onTap: () => GoRouter.of(context).push(settingsPath),
          ),
        ],
      ),
    );
  }
}
