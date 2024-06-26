import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/home/presentation/view_model/recommendation_feature_cubit/recommendation_feature_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/text_field.dart';
import 'get_models_brands_bloc_builder.dart';

class BlocBuilderPrevCar extends StatelessWidget {
  const BlocBuilderPrevCar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationFeatureCubit, RecommendationFeatureState>(
      builder: (context, state) {
        String status = '';
        if (state is ChangedValue) {
          status = state.value;
        }
        return Builder(
          builder: (builderContext) {
            return CustomTextField(
              filled: Theme.of(context).canvasColor.withOpacity(.05),
              hint: status.isEmpty ? StringsEn.prevCar : status,
              readOnly: true,
              suffixIcon: IconButton(
                onPressed: () => _onTapSubmit(builderContext),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).canvasColor,
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _onTapSubmit(BuildContext builderContext) {
    showDialog(
      context: builderContext,
      barrierColor: Theme.of(builderContext).canvasColor.withOpacity(.5),
      builder: (_) {
        return BlocProvider.value(
          value: builderContext.read<RecommendationFeatureCubit>(),
          child: const GetModelsBrandsDialogBlocBuilder(),
        );
      },
    );
  }
}
