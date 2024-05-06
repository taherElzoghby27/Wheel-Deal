import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:flutter/material.dart';

class ContentDialogVerified extends StatelessWidget {
  const ContentDialogVerified({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).primaryColor,
      child: Padding(
        padding: AppConsts.mainPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AspectRatio(
              aspectRatio: AppConsts.aspectRatio16on2,
            ),
            const HandleImageWidget(image: Assets.verified),
            const AspectRatio(
              aspectRatio: AppConsts.aspectRatio16on2,
            ),
            Text(
              StringsEn.verified,
              style: AppConsts.style20.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).canvasColor,
              ),
              textAlign: TextAlign.center,
            ),
            const AspectRatio(
              aspectRatio: AppConsts.aspectRatio16on2,
            ),
            Text(
              StringsEn.methodHasBeenRemovedSuccess,
              style: AppConsts.styleHint14,
              textAlign: TextAlign.center,
            ),
            const AspectRatio(
              aspectRatio: AppConsts.aspectRatio16on2,
            ),
            Padding(
              padding: AppConsts.mainPadding,
              child: AspectRatio(
                aspectRatio: AppConsts.aspectRatioButtonAuth,
                child: CustomButton(
                  text: StringsEn.done,
                  styleText: AppConsts.style16White.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: onTap,
                ),
              ),
            ),
            const AspectRatio(
              aspectRatio: AppConsts.aspectRatio16on2,
            ),
          ],
        ),
      ),
    );
  }
}
