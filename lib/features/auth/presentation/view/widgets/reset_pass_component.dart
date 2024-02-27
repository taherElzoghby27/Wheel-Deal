import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/consts/strings.dart';

class ResetPasswordComponent extends StatefulWidget {
  const ResetPasswordComponent({super.key});

  @override
  State<ResetPasswordComponent> createState() => _ResetPasswordComponentState();
}

class _ResetPasswordComponentState extends State<ResetPasswordComponent> {
  TextEditingController email = TextEditingController();
  TextEditingController last3digitPhone = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          perfixIcon: handleImage(image: Assets.imagesSms),
          hint: StringsEn.email,
          controller: email,
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio20on1,
        ),
        CustomTextFormField(
          perfixIcon: handleImage(image: Assets.imagesProfilePng),
          hint: StringsEn.age,
          controller: age,
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio20on1,
        ),
        CustomTextFormField(
          perfixIcon: handleImage(image: Assets.imagesPhonePng),
          hint: StringsEn.last3digitPhone,
          controller: last3digitPhone,
        ),
      ],
    );
  }
}
