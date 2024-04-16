import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/features/car_details/presentation/view/widgets/car_details_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_squre_button.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarScaffold(context),
      body: const CarDetailsBody(),
    );
  }

  AppBar customAppBarScaffold(
    BuildContext context,
  ) {
    return AppBar(
      leading: Padding(
        padding: AppConsts.padding6,
        child: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
      ),
      title: Text(
        StringsEn.details,
        style: AppConsts.style20.copyWith(color: AppConsts.mainColor),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: AppConsts.padding6,
          child: CustomSquareButton(
            icon: Icons.favorite_outline_rounded,
            onTap: (){},
          ),
        )
      ],
    );
  }
}
