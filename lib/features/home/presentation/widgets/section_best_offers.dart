import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/strings.dart';
import 'best_offers_bloc_consumer_home.dart';
import 'top_leading_trailing.dart';

class SectionBestOffers extends StatelessWidget {
  const SectionBestOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: AspectRatio(
        aspectRatio: AppConsts.aspectRatio16on12,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: TopLeadingTrailing(
                leading: StringsEn.bestOffers,
                trailingOnTap: ()=>GoRouter.of(context).push(bestOffersPath),
              ),
            ),
            const Spacer(),
            const Expanded(
              flex: 25,
              child: BestOffersBlocConsumerHome(),
            ),
          ],
        ),
      ),
    );
  }
}
