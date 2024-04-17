import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'tile_dialog_installment.dart';

class InstallmentAvailableDialog extends StatelessWidget {
  const InstallmentAvailableDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Theme.of(context).splashColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppConsts.radius10,
        side: BorderSide(
          color: AppConsts.neutral700.withOpacity(.3),
          width: 1,
        ),
      ),
      child: AspectRatio(
        aspectRatio: 2.3 / 3,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppConsts.neutral700.withOpacity(.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: TileDialogInstallment(
                first: StringsEn.installmentPlan,
                second: StringsEn.deposit,
                third: StringsEn.monthly,
                forth: StringsEn.total,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TileDialogInstallment(
                  first: '${installments[index].months} ${StringsEn.months}',
                  second: installments[index].deposit.toString(),
                  third: installments[index].monthly.toString(),
                  forth: installments[index].total.toString(),
                  color: AppConsts.mainColor,
                );
              },
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: installments.length,
            ),
          ],
        ),
      ),
    );
  }
}
