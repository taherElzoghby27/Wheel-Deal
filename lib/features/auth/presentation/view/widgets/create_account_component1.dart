import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/text_form_field.dart';
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
    return AspectRatio(
      aspectRatio: AppConsts.aspect16on14,
      child: Column(
        children: [
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

          ///warning
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              StringsEn.warningFields,
              style: AppConsts.styleHint14,
            ),
          ),
        ],
      ),
    );
  }
}
