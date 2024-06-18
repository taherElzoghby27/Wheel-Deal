import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/home/presentation/view/widgets/top_leading_trailing.dart';
import 'package:flutter/material.dart';
import '../../../../../core/consts/style.dart';
import 'Filter_field.dart';
import 'condition_bloc_builder.dart';
import 'get_body_types_bloc_builder.dart';
import 'get_brands_dialog_bloc_builder.dart';

class SectionFieldsFilter extends StatelessWidget {
  const SectionFieldsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopLeadingTrailing(
          leading: StringsEn.filterBy,
          trailing: StringsEn.reset,
          trailingOnTap: () {},
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        //brand
        const FilterField(
          label: StringsEn.brand,
          widget: GetBrandsDialogBlocBuilder(),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        //body type
        const FilterField(
          label: StringsEn.bodyType,
          widget: GetBodyTypesBlocBuilder(),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        //condition
        const FilterField(
          label: StringsEn.condition,
          widget: ConditionBlocBuilder(),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
      ],
    );
  }
}
