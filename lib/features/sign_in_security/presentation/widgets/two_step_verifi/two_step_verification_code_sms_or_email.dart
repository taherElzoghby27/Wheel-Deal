import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:flutter/material.dart';

import 'sms_or_email.dart';

class TwoStepVerificationSecurityCodeSmsOrEmail extends StatelessWidget {
  const TwoStepVerificationSecurityCodeSmsOrEmail({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ListView(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
        SizedBox(
          height: size.height * .2,
          child: const HandleImageWidget(image: Assets.verified),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
        Text(
          StringsEn.howDoYouWantToGetYourSecurityCode,
          style: AppConsts.style20.copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
        Padding(
          padding: AppConsts.mainPadding,
          child: Text(
            StringsEn.weRecommendedSendingSecurityCodesToYourPhone,
            style: AppConsts.styleHint14,
            textAlign: TextAlign.center,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
        const SmsOrEmail(),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
      ],
    );
  }
}
