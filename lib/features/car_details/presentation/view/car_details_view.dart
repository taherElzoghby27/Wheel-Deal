import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/car_details/presentation/view/widgets/car_details_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_app_bar_scaffold.dart';
import '../../../../core/widgets/custom_squre_button.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: StringsEn.details,
        trailing: CustomSquareButton(
          icon: Icons.favorite_outline_rounded,
          onTap: () {},
        ),
      ),
      body: const CarDetailsBody(),
    );
  }
}
