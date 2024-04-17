import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/text_field.dart';
import 'package:cars/features/home/presentation/view/widgets/search_section.dart';
import 'package:cars/features/search/presentation/view/widgets/recent_searchs.dart';
import 'package:cars/features/search/presentation/view/widgets/result_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'search_field.dart';
import 'search_section.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool initial = true;

    return ListView(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

        ///section search field
        const SearchField(),
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
