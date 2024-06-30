import 'package:cars/core/theming/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'section_choose_your_identity_type.dart';
import 'section_instruction_verification.dart';
import 'verififaction_button.dart';

class VerificationBody extends StatelessWidget {
  const VerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
          SectionInstructionVerification(),
          AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
          SectionChooseYourIdentityType(),
          AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
          VerificationButton(),
        ],
      ),
    );
  }
}
