import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/custom_button_with_border.dart';
import 'package:cars/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AspectRatio(
            aspectRatio: AppConsts.aspectRatio24on2,
          ),
           Center(
            child: Text(
              StringsEn.delete,
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
            StringsEn.areYouSureYouWantToRemove,
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
                  text: StringsEn.remove,
                  styleText: AppConsts.style16White,
                  onTap: () => GoRouter.of(context).push(
                    twoStepVerificationCodePath,
                    extra: StringsEn.deleteAccount,
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
          const AspectRatio(
            aspectRatio: AppConsts.aspectRatio24on2,
          ),
        ],
      ),
    );
  }
}
