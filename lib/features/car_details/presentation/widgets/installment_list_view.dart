import 'package:cars/core/helper/methods.dart';
import 'package:cars/core/widgets/custom_divider.dart';
import 'package:cars/features/car_details/data/models/installment_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'tile_dialog_installment.dart';

class InstallmentListView extends StatelessWidget {
  const InstallmentListView({super.key, required this.installments});

  final List<InstallmentAvailableModel> installments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return TileDialogInstallment(
          first: '${installments[index].installmentPlan} ${StringsEn.months}',
          second: handlePrice(installments[index].deposit!),
          third: handlePrice(installments[index].monthly!),
          forth: handlePrice(installments[index].total!),
          color: AppConsts.mainColor,
        );
      },
      separatorBuilder: (context, index) => CustomDivider(
        color: Theme.of(context).canvasColor.withOpacity(.1),
      ),
      itemCount: installments.length,
    );
  }
}
