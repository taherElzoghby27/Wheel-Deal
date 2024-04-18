import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/consts/style.dart';
import 'Filter_field.dart';
import 'bloc_provider_filter_field_dialog.dart';

class SectionFieldsFilter extends StatelessWidget {
  const SectionFieldsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //condition
        FilterField(
          label: StringsEn.condition,
          widget: BlocProviderConditionFieldFilterDialog(
            list: conditions,
            status: StringsEn.condition,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        //brand
        FilterField(
          label: StringsEn.brand,
          widget: BlocProviderConditionFieldFilterDialog(
            list: brands,
            status: StringsEn.brand,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        //body type
        FilterField(
          label: StringsEn.bodyType,
          widget: BlocProviderConditionFieldFilterDialog(
            list: bodyTypes,
            status: StringsEn.bodyType,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        //model
        FilterField(
          label: StringsEn.model,
          widget: BlocProviderConditionFieldFilterDialog(
            list: models,
            status: StringsEn.model,
          ),
        ),
      ],
    );
  }
}
