import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

import '../dialog_content.dart';
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
                  onPressed: () => _showDialog(context),
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

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const DialogContent(),
    );
  }
}
