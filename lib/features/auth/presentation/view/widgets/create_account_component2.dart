import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/auth/presentation/view/widgets/gender_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateAccountComponent2 extends StatefulWidget {
  const CreateAccountComponent2({super.key});

  @override
  State<CreateAccountComponent2> createState() =>
      _CreateAccountComponent2State();
}

class _CreateAccountComponent2State extends State<CreateAccountComponent2> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController age = TextEditingController();
  String? gender;
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                perfixIcon: const HandleImageWidget(image: Assets.imagesProfilePng),
                hint: StringsEn.firstName,
                controller: firstName,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomTextFormField(
                perfixIcon: HandleImageWidget(image: Assets.imagesProfilePng),
                hint: StringsEn.lastName,
                controller: lastName,
              ),
            ),
          ],
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        CustomTextFormField(
          perfixIcon: HandleImageWidget(image: Assets.imagesProfilePng),
          hint: StringsEn.userName,
          controller: userName,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        CustomTextFormField(
          perfixIcon: HandleImageWidget(image: Assets.imagesPhonePng),
          hint: StringsEn.phoneNumber,
          controller: phoneNumber,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        CustomTextFormField(
          perfixIcon: HandleImageWidget(image: Assets.imagesProfilePng),
          hint: StringsEn.age,
          controller: age,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        CustomTextFormField(
          perfixIcon: HandleImageWidget(image: Assets.imagesLocationPng),
          hint: StringsEn.address,
          controller: address,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        const GenderSection(),
      ],
    );
  }
}
