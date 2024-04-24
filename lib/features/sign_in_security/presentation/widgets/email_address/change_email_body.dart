import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class ChangeEmailBody extends StatelessWidget {
  const ChangeEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        CustomTextFormField(
          hint: StringsEn.newEmailAddress,
          perfixIcon: Icon(
            Icons.email,
            color: AppConsts.neutral500,
          ),
        ),
        AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        CustomTextFormField(
          hint: StringsEn.confirmNewEmail,
          perfixIcon: Icon(
            Icons.email,
            color: AppConsts.neutral500,
          ),
        ),
        AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        CustomTextFormField(
          hint: StringsEn.yourPassword,
          perfixIcon: Icon(
            Icons.lock,
            color: AppConsts.neutral500,
          ),
        ),
      ],
    );
  }
}
