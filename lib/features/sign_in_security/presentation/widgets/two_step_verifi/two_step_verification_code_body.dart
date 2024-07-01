import 'package:cars/core/helper/assets.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../content_dialog_verified.dart';
import '../section_note.dart';
import '../section_otp.dart';

class TwoStepVerificationCodeBody extends StatelessWidget {
  const TwoStepVerificationCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
          SizedBox(
            height: size.height * .125,
            child: const HandleImageWidget(image: Assets.lockWithBackGround),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
          Text(
            StringsEn.enterYourCode,
            style: AppConsts.style20.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).canvasColor,
            ),
            textAlign: TextAlign.center,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
          Text(
            "${StringsEn.weSentCodeTo} Taheramin@gmail.com",
            style: AppConsts.styleHint14,
            textAlign: TextAlign.center,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
          const SectionOtp(),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
          const SectionNote(),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: CustomButton(
              text: StringsEn.send,
              styleText: AppConsts.style16White.copyWith(
                fontWeight: FontWeight.w600,
              ),
              onTap: () => showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => ContentDialogVerified(
                  onTap: () {
                    GoRouter.of(context).pop();
                    GoRouter.of(context).pop();
                    GoRouter.of(context).pop();
                  },
                ),
              ),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
        ],
      ),
    );
  }
}
