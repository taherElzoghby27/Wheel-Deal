import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/features/home/presentation/view_model/recommendation_feature_cubit/recommendation_feature_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes_page.dart';
import '../../../../core/helper/custom_snack.dart';
import '../../../../core/widgets/customButton.dart';
import '../../../../core/widgets/small_loading_widget.dart';

class ContinueButtonBlocConsumer extends StatelessWidget {
  const ContinueButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendationFeatureCubit, RecommendationFeatureState>(
      listener: (context, state) {
        if (state is UserInfoLoaded) {
          GoRouter.of(context).pushReplacement(prevCarPath);
        } else if (state is UserInfoFailure) {
          showSnack(
            context,
            message: state.message,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        return Visibility(
          visible: state is UserInfoLoading ? false : true,
          replacement: const LoadingWidget(),
          child: CustomButton(
            text: StringsEn.continueLabel,
            //onTap: () => context.read<RecommendationFeatureCubit>().userInfo(),
            onTap: () => GoRouter.of(context).push(prevCarPath),
          ),
        );
      },
    );
  }
}
