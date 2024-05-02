import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/custom_button_with_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/consts/strings.dart';
import '../../../../core/widgets/text_form_field.dart';

class DeleteAccountVerifiBody extends StatelessWidget {
  const DeleteAccountVerifiBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          Text(
            StringsEn.loginInToConfirm,
            style: AppConsts.style22.copyWith(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          Padding(
            padding: AppConsts.mainPadding,
            child: Text(
              StringsEn.enterLoginInformation,
              style: AppConsts.style14.copyWith(
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
          const CustomTextFormField(
            hint: StringsEn.email,
            perfixIcon: Icon(
              Icons.email,
              color: AppConsts.neutral500,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          CustomTextFormField(
            hint: StringsEn.password,
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
          Row(
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 10,
                child: CustomButtonWithBorder(
                  text: StringsEn.cancel,
                  onTap: () => GoRouter.of(context).pop(),
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 10,
                child: CustomButton(
                  text: StringsEn.delete,
                  styleText: AppConsts.style16White,
                  onTap: () => GoRouter.of(context).push(deleteAccountCodePath),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
        ],
      ),
    );
  }
}
