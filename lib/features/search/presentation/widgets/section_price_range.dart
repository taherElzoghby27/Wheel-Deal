import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/widgets/top_leading_trailing.dart';

class SectionPriceRange extends StatelessWidget {
  const SectionPriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopLeadingTrailing(
          leading: StringsEn.priceRange,
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            SearchCubit bloc = BlocProvider.of<SearchCubit>(context);

            return RangeSlider(
              labels: RangeLabels(
                bloc.currentRangeValues.start.round().toString(),
                bloc.currentRangeValues.end.round().toString(),
              ),
              min: 200000,
              max: 5000000,
              divisions: 500,
              inactiveColor: Theme.of(context).canvasColor.withOpacity(.1),
              onChanged: (RangeValues values) => bloc.changePriceRange(values),
              activeColor: AppConsts.mainColor,
              values: bloc.currentRangeValues,
            );
          },
        ),
      ],
    );
  }
}
