import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/features/home/presentation/view/widgets/top_leading_trailing.dart';
import 'package:flutter/material.dart';
import 'section_fields_filter.dart';

class FilterBody extends StatelessWidget {
  const FilterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          //filter by
          TopLeadingTrailing(
            leading: StringsEn.filterBy,
            trailing: StringsEn.reset,
            trailingOnTap: () {},
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
          const SectionFieldsFilter(),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
          const TopLeadingTrailing(
            leading: StringsEn.priceRange,
          ),
        ],
      ),
    );
  }
}
