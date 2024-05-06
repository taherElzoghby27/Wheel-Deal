import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

import 'installment_dialog.dart';

class InstallmentAvailableComponent extends StatelessWidget {
  const InstallmentAvailableComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return const InstallmentAvailableDialog();
            },
          );
        },
        child: Container(
          decoration: AppConsts.mainDecoration.copyWith(
            color: Theme.of(context).canvasColor.withOpacity(.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: AppConsts.padding8H3V,
            child: Text(
              StringsEn.installmentAvailable,
              style: AppConsts.style22.copyWith(
                color: Theme.of(context).canvasColor,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
