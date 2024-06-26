import 'package:cars/core/widgets/custom_radio_list_tile.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/features/home/domain/entities/previous_car_entity.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:cars/features/home/presentation/view_model/recommendation_feature_cubit/recommendation_feature_cubit.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/consts/style.dart';
import '../../../../core/widgets/small_loading_widget.dart';

class GetModelsBrandsDialogBlocBuilder extends StatefulWidget {
  const GetModelsBrandsDialogBlocBuilder({super.key});

  @override
  State<GetModelsBrandsDialogBlocBuilder> createState() =>
      _GetBrandsDialogBlocBuilderState();
}

class _GetBrandsDialogBlocBuilderState
    extends State<GetModelsBrandsDialogBlocBuilder> {
  @override
  void initState() {
    debugPrint('brand : ${context.read<SearchCubit>().state.brand}');
    context.read<RecommendationFeatureCubit>().getModelBrand(
          context.read<SearchCubit>().state.brand,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationFeatureCubit, RecommendationFeatureState>(
      builder: (context, state) {
        if (state.getModelsTypesState == RequestState.loaded) {
          RecommendationFeatureCubit cubit =
              context.read<RecommendationFeatureCubit>();
          List<PreviousCarEntity> brandsModels = state.carNames;
          return Dialog(
            surfaceTintColor: Theme.of(context).splashColor.withOpacity(.3),
            backgroundColor: Theme.of(context).splashColor,
            shape: AppConsts.dialogShape,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: brandsModels
                    .map(
                      (e) => CustomRadiusListTile<String>(
                        label: e.carName!,
                        value: e.carName!,
                        groupValue: cubit.previousCarController.text,
                        onChanged: (value) => cubit.changeValue(
                          value: value!,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        } else if (state.getModelsTypesState == RequestState.failure) {
          return SomeThingErrorWidget(
            message: state.failureGetModelsTypes,
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
