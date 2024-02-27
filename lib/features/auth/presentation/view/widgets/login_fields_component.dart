
import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/auth/presentation/view/widgets/remeber_me.dart';
import 'package:flutter/material.dart';

import '../../../../../core/consts/style.dart';

class LoginFieldComponent extends StatefulWidget {
  const LoginFieldComponent({super.key});

  @override
  State<LoginFieldComponent> createState() => _LoginFieldComponentState();
}

class _LoginFieldComponentState extends State<LoginFieldComponent> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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

        ///Password
        CustomTextFormField(
          perfixIcon: handleImage(image: Assets.imagesLockPng),
          hint: StringsEn.password,
          obscureText: false,
          controller: password,
        ),

        ///remeber me
        const RemeberMe(),
      ],
    );
  }
}
