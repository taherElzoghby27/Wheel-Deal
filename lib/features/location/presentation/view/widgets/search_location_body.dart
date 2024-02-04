import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/search/presentation/view/widgets/recent_searchs.dart';
import 'package:cars/features/search/presentation/view/widgets/search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchLocationBody extends StatelessWidget {
  const SearchLocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        SizedBox(height: size.height * .02.h),

        ///section search field
        SectionSearch(
          hint: StringsEn.searchArea,
          onChanged: (String value) {},
        ),
        SizedBox(height: size.height * .015.h),
        SizedBox(height: size.height * .015.h),

        ///section result
        const RecentSearch(
          tileHint: StringsEn.chooseRegion,
        ),
      ],
    );
  }
}
