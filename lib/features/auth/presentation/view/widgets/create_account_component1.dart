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
                perfixIcon: const Icon(
                  Icons.person,
                  color: AppConsts.neutral500,
                ),
                hint: StringsEn.firstName,
                onChanged: (String? value) => email = value,
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 7,
              child: CustomTextFormField(
                perfixIcon: const Icon(
                  Icons.person,
                  color: AppConsts.neutral500,
                ),
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
          perfixIcon: const Icon(
            Icons.email_outlined,
            color: AppConsts.neutral500,
          ),
          hint: StringsEn.email,
          onChanged: (String? value) => email = value,
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio20on1,
        ),

        ///Password
        CustomTextFormField(
          perfixIcon: const Icon(
            Icons.lock,
            color: AppConsts.neutral500,
          ),
          hint: StringsEn.password,
          obscureText: true,
          onChanged: (String? value) => password = value,
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio20on1,
        ),

        ///confirm Password
        CustomTextFormField(
          perfixIcon: const Icon(
            Icons.lock,
            color: AppConsts.neutral500,
          ),
          hint: StringsEn.confirmNewPass,
          obscureText: true,
          onChanged: (String? value) => password = value,
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio16on2,
        ),
      ],
    );
  }
}
