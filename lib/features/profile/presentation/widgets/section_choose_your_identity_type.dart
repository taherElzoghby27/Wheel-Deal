import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'identities_list.dart';
import 'identity_type_section.dart';

class SectionChooseYourIdentityType extends StatelessWidget {
  const SectionChooseYourIdentityType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsEn.chooseYourIdentityType,
          style: AppConsts.style16.copyWith(
            color: Theme.of(context).canvasColor,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        //id card   - passport - Driving license
        const IdentitiesList(),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        const IdentityTypeWidget(),
      ],
    );
  }
}
