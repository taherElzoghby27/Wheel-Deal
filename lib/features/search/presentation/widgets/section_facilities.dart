import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_checkbox_tile.dart';
import 'package:cars/features/home/presentation/view/widgets/top_leading_trailing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/search_cubit/search_cubit.dart';


class SectionFacilities extends StatelessWidget {
  const SectionFacilities({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        SearchCubit bloc = BlocProvider.of<SearchCubit>(context);
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
