
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:flutter/material.dart';

import '../../../../../core/consts/style.dart';

class ShowResultFilterButton extends StatelessWidget {
  const ShowResultFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspectRatioButtonAuth,
      child: CustomButton(
        text: StringsEn.showResult,
        styleText: AppConsts.style16White,
        onTap: () {},
      ),
    );
  }
}
