import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_radio_list_tile.dart';
import 'package:cars/features/search/presentation/view_model/condition_cubit/condition_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'condition_field.dart';

class BlocProviderConditionFieldDialog extends StatelessWidget {
  const BlocProviderConditionFieldDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConditionCubit(),
      child: BlocBuilder<ConditionCubit, ConditionState>(
        builder: (context, state) {
          ConditionCubit bloc = BlocProvider.of<ConditionCubit>(context);
          return Dialog(
            surfaceTintColor: Theme.of(context).splashColor,
            shape: AppConsts.dialogShape,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomRadiusListTile<Condition>(
                  label: Condition.Used.name,
                  value: Condition.Used,
                  groupValue: bloc.condition,
                  onChanged: (value) => bloc.changeCondition(value!),
                ),
                CustomRadiusListTile<Condition>(
                  label: Condition.New.name,
                  value: Condition.New,
                  groupValue: bloc.condition,
                  onChanged: (value) => bloc.changeCondition(value!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
