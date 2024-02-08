import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:cars/core/widgets/custom_divider.dart';
import 'package:cars/features/profile/presentation/view/widgets/section_info_user.dart';
import 'package:cars/features/profile/presentation/view/widgets/section_setting.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        //   title
        CustomAppBar(
          title: StringsEn.profile,
          trailingOnTap: () {},
        ),
        //User info
        const SectionInfoUser(),
        const CustomDivider(),
        //settings
        const SectionSetting(),
      ],
    );
  }
}
