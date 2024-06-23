import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

import 'section_info_user.dart';
import 'section_personal_info.dart';
import 'section_utilities.dart';

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
