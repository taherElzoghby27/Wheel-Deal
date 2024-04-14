import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/consts/strings.dart';
import 'cars_list_view.dart';
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
                trailingOnTap: () {},
              ),
            ),
            const Spacer(),
            const Expanded(
              flex: 25,
              child: CarsListView(),
            ),
          ],
        ),
      ),
    );
  }
}
