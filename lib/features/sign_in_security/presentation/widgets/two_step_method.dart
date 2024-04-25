import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_button_with_border.dart';
import 'two_step_method_tile.dart';

class TwoStepMethod extends StatelessWidget {
  const TwoStepMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppConsts.mainDecoration,
      child: Padding(
        padding: AppConsts.padding15H10V,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsEn.twoStepMethod,
                  style: AppConsts.style12.copyWith(
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        surfaceTintColor: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const AspectRatio(
                              aspectRatio: AppConsts.aspectRatio24on2,
                            ),
                            const Center(
                              child: Text(
                                StringsEn.delete,
                                style: AppConsts.style16White,
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
                                    onTap: () {},
                                  ),
                                ),
                                const Spacer(flex: 1),
                              ],
                            ),
                            const AspectRatio(
                              aspectRatio: AppConsts.aspectRatio40on1,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: AppConsts.mainColor,
                  ),
                ),
              ],
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            TwoStepMethodTile(
              leading: StringsEn.emailAddress,
              trailing: 'taheramin442@gmail.com',
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            TwoStepMethodTile(
              leading: StringsEn.verifiedAt,
              trailing: '08/04/2024',
            ),
          ],
        ),
      ),
    );
  }
}
