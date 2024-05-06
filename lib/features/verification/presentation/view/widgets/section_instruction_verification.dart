import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class SectionInstructionVerification extends StatelessWidget {
  const SectionInstructionVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsEn.proofOfIdentify,
          style: AppConsts.style16.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).canvasColor,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        Text(
          StringsEn.proofOfIdentifySubTitle,
          style: AppConsts.style12.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).canvasColor.withOpacity(.5),
          ),
        ),
      ],
    );
  }
}
