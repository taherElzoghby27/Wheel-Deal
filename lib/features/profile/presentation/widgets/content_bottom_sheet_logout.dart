import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/custom_button_with_border.dart';
import 'package:cars/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/style.dart';

class ContentBottomSheetLogout extends StatelessWidget {
  const ContentBottomSheetLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio24on2,
        ),
        Center(
          child: Text(
            StringsEn.logout,
            style: AppConsts.style16White.copyWith(
              color: Theme.of(context).canvasColor,
            ),
          ),
        ),
        Padding(
          padding: AppConsts.mainPadding,
          child: const CustomDivider(),
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio24on2,
        ),
        const Text(
          StringsEn.areYouSureYouWantToLogout,
          style: AppConsts.styleHint14,
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio24on2,
        ),
        Row(
          children: [
            const Spacer(flex: 1),
            Expanded(
              flex: 5,
              child: CustomButtonWithBorder(
                text: StringsEn.cancel,
                onTap: () => GoRouter.of(context).pop(),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 5,
              child: CustomButton(
                text: StringsEn.logout,
                styleText: AppConsts.style16White,
                onTap: () {},
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio24on2,
        ),
      ],
    );
  }
}
