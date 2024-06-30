import 'package:cars/core/helper/enums.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/custom_radio_list_tile.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConditionBlocBuilder extends StatelessWidget {
  const ConditionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        SearchCubit bloc = BlocProvider.of<SearchCubit>(context);
        return Dialog(
          surfaceTintColor: Theme.of(context).splashColor.withOpacity(.3),
          backgroundColor: Theme.of(context).splashColor,
          shape: AppConsts.dialogShape,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: conditions
                .map(
                  (e) => CustomRadiusListTile<String>(
                    label: e,
                    value: e,
                    groupValue: bloc.state.condition,
                    onChanged: (value) => bloc.changeValue(
                      value: value!,
                      status: StringsEn.condition,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
