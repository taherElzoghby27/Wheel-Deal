import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/home/presentation/view/widgets/top_leading_trailing.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/consts/style.dart';
import 'Filter_field.dart';
import 'bloc_builder_dialog.dart';

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
        //condition
        FilterField(
          label: StringsEn.condition,
          widget: BlocBuilderDialog(
            list: conditions,
            status: StringsEn.condition,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        //brand
        FilterField(
          label: StringsEn.brand,
          widget: BlocBuilderDialog(
            list: brands,
            status: StringsEn.brand,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        //body type
        FilterField(
          label: StringsEn.bodyType,
          widget: BlocBuilderDialog(
            list: bodyTypes,
            status: StringsEn.bodyType,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
      ],
    );
  }
}
