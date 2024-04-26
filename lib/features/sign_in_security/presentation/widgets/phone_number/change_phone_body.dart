import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangePhoneBody extends StatelessWidget {
  const ChangePhoneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          const CustomTextFormField(
            hint: StringsEn.changePhoneNumberLabel,
            perfixIcon: Icon(
              Icons.phone,
              color: AppConsts.neutral500,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          const CustomTextFormField(
            hint: StringsEn.confirmNewPhone,
            perfixIcon: Icon(
              Icons.phone,
              color: AppConsts.neutral500,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          CustomTextFormField(
            hint: StringsEn.yourPassword,
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
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                StringsEn.forgotPass,
                style: AppConsts.style12.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: CustomButton(
              text: StringsEn.confirmNewPhone,
              styleText: AppConsts.style16White.copyWith(
                fontWeight: FontWeight.w600,
              ),
              onTap: () => GoRouter.of(context).push(''),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
        ],
      ),
    );
  }
}
