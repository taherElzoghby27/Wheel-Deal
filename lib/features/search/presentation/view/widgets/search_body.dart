import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/features/search/presentation/view/widgets/recent_searchs.dart';
import 'package:cars/features/search/presentation/view/widgets/result_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'search_section.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool initial = false;

    return ListView(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

        ///section search field
        SectionSearch(
          hint: StringsEn.typeSomething,
          onChanged: (String value) {},
        ),
        SizedBox(height: size.height * .015.h),
        SizedBox(height: size.height * .015.h),

        ///section result
        initial
            ? RecentSearch(
                tileHint: StringsEn.recentSearches,
              )
            : const SectionResult(),
      ],
    );
  }
}
