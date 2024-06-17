import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerificationButton extends StatelessWidget {
  const VerificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspectRatioButtonAuth,
      child: CustomButton(
        text: StringsEn.next,
        styleText: AppConsts.style16White.copyWith(
          fontWeight: FontWeight.w600,
        ),
        onTap: () => GoRouter.of(context).push(verificationVerifyLoadingPath),
      ),
    );
  }
}
