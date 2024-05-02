import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/text_form_field.dart';

class EnterPhoneOrEmail extends StatelessWidget {
  const EnterPhoneOrEmail({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ListView(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
        SizedBox(
          height: size.height * .125,
          child: const HandleImageWidget(image: Assets.verified),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
        Text(
          status == StringsEn.sms
              ? StringsEn.enterYourPhone
              : StringsEn.enterYouEmail,
          style: AppConsts.style20.copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
        Padding(
          padding: AppConsts.mainPadding,
          child: Text(
            status == StringsEn.sms
                ? StringsEn.mustBeUsBasedNumber
                : StringsEn.mustBeUsBasedEmail,
            style: AppConsts.styleHint14,
            textAlign: TextAlign.center,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
        CustomTextFormField(
          hint:
              status == StringsEn.sms ? StringsEn.phoneNumber : StringsEn.email,
          perfixIcon: Icon(
            status == StringsEn.sms ? Icons.phone : Icons.email,
            color: AppConsts.neutral400,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
        AspectRatio(
          aspectRatio: AppConsts.aspectRatioButtonAuth,
          child: CustomButton(
            text: StringsEn.send,
            styleText: AppConsts.style16White,
            onTap: () => GoRouter.of(context).push(
              twoStepVerificationCodePath,
              extra: StringsEn.deleteAccount,
            ),
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
      ],
    );
  }
}
