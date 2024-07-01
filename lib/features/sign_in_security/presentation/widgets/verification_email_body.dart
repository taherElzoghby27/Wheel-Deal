import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/features/sign_in_security/presentation/widgets/section_note.dart';
import 'package:flutter/material.dart';

import 'section_otp.dart';
import 'send_button_bloc_consumer.dart';

class VerificationEmailBody extends StatelessWidget {
  const VerificationEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
          Padding(
            padding: AppConsts.padding50H,
            child: Text(
              StringsEn.pleaseEnterVerificationEmail,
              textAlign: TextAlign.center,
              style: AppConsts.style14.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
          const SectionOtp(),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
          const SectionNote(),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
          const AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: SendButtonBlocConsumer(),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
        ],
      ),
    );
  }
}
