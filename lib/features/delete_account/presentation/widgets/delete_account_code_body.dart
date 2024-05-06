import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/features/sign_in_security/presentation/widgets/content_dialog_verified.dart';
import 'package:cars/features/sign_in_security/presentation/widgets/email_address/section_note.dart';
import 'package:cars/features/sign_in_security/presentation/widgets/email_address/section_otp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/consts/assets.dart';
import '../../../../core/consts/routesPage.dart';
import '../../../../core/consts/strings.dart';
import '../../../../core/helper/handle_image.dart';

class DeleteAccountCodeBody extends StatelessWidget {
  const DeleteAccountCodeBody({super.key});

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
                    GoRouter.of(context).push(areYouSureDeletePath);
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
