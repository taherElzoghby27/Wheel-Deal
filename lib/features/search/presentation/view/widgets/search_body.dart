
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
        SizedBox(height: size.height * .02.h),

        ///section search field
        SectionSearch(
          onChanged: (String value) {},
        ),
        SizedBox(height: size.height * .015.h),
        SizedBox(height: size.height * .015.h),

        ///section result
        initial ? const RecentSearch() : const SectionResult(),
      ],
    );
  }
}
