import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/features/sign_in_security/presentation/widgets/email_address/section_note.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'section_otp.dart';

class VerificationEmailBody extends StatelessWidget {
  const VerificationEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
          Text(
            StringsEn.pleaseEnterVerification,
            textAlign: TextAlign.center,
            style: AppConsts.style14.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).canvasColor,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
          const SectionOtp(),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
          const SectionNote(),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: CustomButton(
              text: StringsEn.send,
              styleText: AppConsts.style16White.copyWith(
                fontWeight: FontWeight.w600,
              ),
              onTap: () => GoRouter.of(context).push(changeEmailAddressPath),
            ),
          ),
        ],
      ),
    );
  }
}
