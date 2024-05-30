import 'package:cars/core/services/service_locator.dart';
import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:cars/features/home/data/repos/home_repo_impl.dart';
import 'package:cars/features/home/domain/usecases/get_best_offers.dart';
import 'package:cars/features/home/domain/usecases/get_recommended_for_you.dart';
import 'package:cars/features/home/domain/usecases/get_top_brands.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/consts/strings.dart';
import 'widgets/recommended_for_you_body.dart';

class RecommendedForYouView extends StatelessWidget {
  const RecommendedForYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: StringsEn.recommendedForYou,
      ),
      body: BlocProvider(
        create: (_) => HomeBloc(
          GetTopBrandsUseCase(
            homeRepo: getIt.get<HomeRepoImpl>(),
          ),
          GetBestOffersUseCase(
            homeRepo: getIt.get<HomeRepoImpl>(),
          ),
          GetFavouritesUseCase(
            homeRepo: getIt.get<HomeRepoImpl>(),
          ),
          GetRecommendedForYouUseCase(
            homeRepo: getIt.get<HomeRepoImpl>(),
          ),
        )..add(
            const AddRecommendedForYouEvent(),
          ),
        child: const SafeArea(
          child: RecommendedForYouBody(),
        ),
      ),
    );
  }
}
