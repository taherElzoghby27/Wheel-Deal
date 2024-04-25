import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

import 'sign_in_security_tile.dart';
import 'two_step_verification_widget.dart';

class TwoStepVerificationBody extends StatelessWidget {
  const TwoStepVerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: const Column(
        children: [
          AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          TwoStepVerificationWidget(),
          AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
        ],
      ),
    );
  }
}
