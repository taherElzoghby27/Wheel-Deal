import 'package:cars/core/helper/assets.dart';
import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerificationWelcomeBody extends StatelessWidget {
  const VerificationWelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HandleImageWidget(image: Assets.verificationAsset),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
            Text(
              StringsEn.verifyYourAccount,
              style: AppConsts.style22.copyWith(
                color: Theme.of(context).canvasColor,
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
            Text(
              StringsEn.loremVerifi,
              style: AppConsts.style14.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio16on4),
            Padding(
              padding:AppConsts.padding15H,
              child: AspectRatio(
                aspectRatio: AppConsts.aspectRatioButtonAuth,
                child: CustomButton(
                  text: StringsEn.next,
                  styleText: AppConsts.style16White.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () => GoRouter.of(context).push(verificationPath),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
