import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:cars/core/widgets/custom_divider.dart';
import 'package:cars/features/profile/presentation/view/widgets/section_info_user.dart';
import 'package:cars/features/profile/presentation/view/widgets/section_utilities.dart';
import 'package:flutter/material.dart';

import 'section_personal_info.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        //User info
        SectionInfoUser(),
        //personal info
        SectionPersonalInfo(),
        //Utilities
        SectionUtilities(),
        AspectRatio(aspectRatio: AppConsts.aspectRatio16on3),
      ],
    );
  }
}
