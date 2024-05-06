import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:cars/features/home/presentation/view/widgets/best_offers_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestOffersView extends StatelessWidget {
  const BestOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: StringsEn.bestOffers,
      ),
      body: const SafeArea(
        child: BestOffersBody(),
      ),
    );
  }
}
