import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccountComponent1 extends StatefulWidget {
  const CreateAccountComponent1({super.key});

  @override
  State<CreateAccountComponent1> createState() =>
      _CreateAccountComponent1State();
}

class _CreateAccountComponent1State extends State<CreateAccountComponent1> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //first name - last name
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 7,
              child: CustomTextFormField(
                perfixIcon:
                    const HandleImageWidget(image: Assets.imagesProfilePng),
                hint: StringsEn.firstName,
                onChanged: (String? value) => email = value,
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 7,
              child: CustomTextFormField(
                perfixIcon:
                    const HandleImageWidget(image: Assets.imagesProfilePng),
                hint: StringsEn.lastName,
                onChanged: (String? value) => email = value,
              ),
            ),
          ],
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio20on1,
        ),

        ///Email

        CustomTextFormField(
          perfixIcon: const HandleImageWidget(image: Assets.imagesSms),
          hint: StringsEn.email,
          onChanged: (String? value) => email = value,
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio20on1,
        ),

        ///Password
        CustomTextFormField(
          perfixIcon: const HandleImageWidget(image: Assets.imagesLockPng),
          hint: StringsEn.password,
          obscureText: false,
          onChanged: (String? value) => password = value,
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio20on1,
        ),

        ///confirm Password
        CustomTextFormField(
          perfixIcon: const HandleImageWidget(image: Assets.imagesLockPng),
          hint: StringsEn.confirmNewPass,
          obscureText: false,
          onChanged: (String? value) => password = value,
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio16on2,
        ),
      ],
    );
  }
}
