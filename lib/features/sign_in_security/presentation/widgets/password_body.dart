import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordBody extends StatelessWidget {
  const PasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          const CustomTextFormField(
            hint: StringsEn.yourPassword,
            perfixIcon: Icon(
              Icons.lock,
              color: AppConsts.neutral500,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
           CustomTextFormField(
            hint: StringsEn.enterNewPass,
            perfixIcon: const Icon(
              Icons.lock,
              color: AppConsts.neutral500,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          CustomTextFormField(
            hint: StringsEn.confirmNewPass,
            perfixIcon: const Icon(
              Icons.lock,
              color: AppConsts.neutral500,
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.visibility,
                color: AppConsts.neutral500,
              ),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: CustomButton(
              text: StringsEn.confirmNewPass,
              styleText: AppConsts.style16White.copyWith(
                fontWeight: FontWeight.w600,
              ),
              onTap: () => GoRouter.of(context).push(''),
            ),
          ),
        ],
      ),
    );
  }
}
