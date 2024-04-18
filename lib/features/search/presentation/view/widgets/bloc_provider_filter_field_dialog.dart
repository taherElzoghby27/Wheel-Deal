import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_radio_list_tile.dart';
import 'package:cars/features/search/presentation/view_model/filter_cubit/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderConditionFieldFilterDialog extends StatelessWidget {
  const BlocProviderConditionFieldFilterDialog({
    super.key,
    required this.list,
    required this.status,
  });

  final List<String> list;
  final String status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(),
      child: BlocBuilder<FilterCubit, FilterState>(
        builder: (context, state) {
          FilterCubit bloc = BlocProvider.of<FilterCubit>(context);
          return Dialog(
            surfaceTintColor: Theme.of(context).splashColor,
            shape: AppConsts.dialogShape,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: list
                  .map(
                    (e) => CustomRadiusListTile<String>(
                      label: e,
                      value: e,
                      groupValue: status == StringsEn.condition
                          ? bloc.condition
                          : status == StringsEn.brand
                              ? bloc.brand
                              : status == StringsEn.bodyType
                                  ? bloc.bodyType
                                  : bloc.model,
                      onChanged: (value) => bloc.changeValue(
                        value: value!,
                        status: status,
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
