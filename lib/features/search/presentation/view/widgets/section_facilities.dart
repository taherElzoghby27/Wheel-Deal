import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_checkbox_tile.dart';
import 'package:cars/features/search/presentation/view_model/filter_cubit/filter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/view/widgets/top_leading_trailing.dart';

class SectionFacilities extends StatelessWidget {
  const SectionFacilities({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        FilterCubit bloc = BlocProvider.of<FilterCubit>(context);
        return Wrap(
          direction: Axis.horizontal,
          children: [
            const TopLeadingTrailing(leading: StringsEn.facilities),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            ...facilities
                .map(
                  (e) => CustomCheckBoxTile(
                    label: e.label,
                    value: e.value,
                    onChanged: (value) => bloc.changeFacility(value!, e),
                  ),
                )
                .toList(),
          ],
        );
      },
    );
  }
}
