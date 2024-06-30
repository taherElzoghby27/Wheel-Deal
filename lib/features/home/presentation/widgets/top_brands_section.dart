import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bloc_consumer_brands_list_view.dart';
import 'top_leading_trailing.dart';

class SectionTopBrands extends StatelessWidget {
  const SectionTopBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: const AspectRatio(
        aspectRatio: AppConsts.aspectRatio16on7,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: TopLeadingTrailing(leading: StringsEn.topBrands),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 8,
              child: BrandsListView(),
            ),
          ],
        ),
      ),
    );
  }
}
