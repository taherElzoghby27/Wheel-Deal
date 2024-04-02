import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/auth/presentation/view/widgets/gender_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'section_terms_and_conditions.dart';

class CreateAccountComponent2 extends StatefulWidget {
  const CreateAccountComponent2({super.key});

  @override
  State<CreateAccountComponent2> createState() =>
      _CreateAccountComponent2State();
}

class _CreateAccountComponent2State extends State<CreateAccountComponent2> {
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController age = TextEditingController();
  String? gender;
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          perfixIcon: const HandleImageWidget(image: Assets.imagesPhonePng),
          hint: StringsEn.phoneNumber,
          controller: state,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        CustomTextFormField(
          perfixIcon: const HandleImageWidget(image: Assets.imagesProfilePng),
          hint: StringsEn.age,
          controller: userName,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 7,
              child: CustomTextFormField(
                perfixIcon:
                    const HandleImageWidget(image: Assets.imagesLocationPng),
                hint: StringsEn.city,
                controller: city,
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 7,
              child: CustomTextFormField(
                perfixIcon:
                    const HandleImageWidget(image: Assets.imagesLocationPng),
                hint: StringsEn.state,
                controller: state,
              ),
            ),
          ],
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        CustomTextFormField(
          perfixIcon: const HandleImageWidget(image: Assets.imagesLocationPng),
          hint: StringsEn.address,
          controller: address,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        const GenderSection(),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        const SectionTermsAndConditions()
      ],
    );
  }
}
