import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'bloc_provider_list_view_installment.dart';
import 'tile_dialog_installment.dart';

class InstallmentAvailableDialog extends StatelessWidget {
  const InstallmentAvailableDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Theme.of(context).splashColor.withOpacity(.5),
      backgroundColor: Theme.of(context).splashColor,
      shape: AppConsts.dialogShape,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor.withOpacity(
                    .1,
                  ),
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
          const BlocProviderInstallmentListView(),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        ],
      ),
    );
  }
}
