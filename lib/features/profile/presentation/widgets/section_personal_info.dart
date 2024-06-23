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
            leading: Icon(
             Icons.person_2_outlined,
              color: Theme.of(context).canvasColor.withOpacity(.8),
            ),
            title: StringsEn.id,
            trailing: const Text(
              '35154642',
              style: AppConsts.style14,
            ),
            onTap: (){},
          ),
          CustomButtonThreeWidget(
            leading: Icon(
              Icons.email_outlined,
              color: Theme.of(context).canvasColor.withOpacity(.8),
            ),
            trailing: const Text(
              'taherAmin@gmail.com',
              style: AppConsts.style14,
            ),
            title: StringsEn.email,
            onTap: (){},
          ),
          CustomButtonThreeWidget(
            leading: Icon(
              Icons.phone,
              color: Theme.of(context).canvasColor.withOpacity(.8),
            ),
            trailing: const Text(
              '01023412234',
              style: AppConsts.style14,
            ),
            title: StringsEn.phone,
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
