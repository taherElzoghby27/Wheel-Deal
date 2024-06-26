import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/home/presentation/view_model/recommendation_feature_cubit/recommendation_feature_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoneButtonBlocConsumer extends StatelessWidget {
  const DoneButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendationFeatureCubit, RecommendationFeatureState>(
      listener: (context, state) {
        if (state is PreviousCarLoaded) {
          GoRouter.of(context).pushReplacement(navPath);
        } else if (state is PreviousCarFailure) {
          showSnack(
            context,
            message: state.message,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        return Visibility(
          visible: state is PreviousCarLoading ? false : true,
          replacement: const LoadingWidget(),
          child: CustomButton(
            text: StringsEn.done,
            onTap: () =>
                context.read<RecommendationFeatureCubit>().previousCar(),
          ),
        );
      },
    );
  }
}
