import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cars/core/theming/style.dart';
import 'bloc_consumer_recommended_for_you.dart';
import 'top_leading_trailing.dart';

class SectionRecommendedForYou extends StatelessWidget {
  const SectionRecommendedForYou({super.key});

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
                leading: StringsEn.recommendedForYou,
                trailingOnTap: () =>
                    GoRouter.of(context).push(recommendedForYouPath),
              ),
            ),
            const Spacer(),
            const Expanded(
              flex: 25,
              child: BlocConsumerRecommendedForYou(),
            ),
          ],
        ),
      ),
    );
  }
}
