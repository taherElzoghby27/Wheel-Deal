import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AreYouSureDeleteAccountBody extends StatelessWidget {
  const AreYouSureDeleteAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
          const AspectRatio(
            aspectRatio: AppConsts.aspectRatio16on7,
            child: HandleImageWidget(image: Assets.delete),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on3),
          Text(
            StringsEn.areYouSureYouWantToDeleteYourAccount,
            style: AppConsts.style22.copyWith(
              color: Theme.of(context).canvasColor,
            ),
            textAlign: TextAlign.center,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: Padding(
              padding: AppConsts.mainPadding,
              child: CustomButton(
                text: StringsEn.delete,
                styleText: AppConsts.style16White.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                onTap: () {
                  GoRouter.of(context)
                    ..pop()
                    ..pop()
                    ..pop()
                    ..pop()
                    ..pop();
                },
              ),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
          TextButton(
            onPressed: () {},
            child: Text(
              StringsEn.keepAccount,
              style: AppConsts.style16.copyWith(
                fontWeight: FontWeight.w600,
                color: AppConsts.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
