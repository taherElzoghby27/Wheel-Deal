import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/service_locator.dart';
import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:cars/features/favourites/data/repos/favourites_repo_impl.dart';
import 'package:cars/features/favourites/domain/use_cases/get_favourites_use_case.dart';
import 'package:cars/features/home/domain/usecases/get_best_offers.dart';
import 'package:cars/features/home/domain/usecases/get_recommended_for_you.dart';
import 'package:cars/features/home/domain/usecases/get_top_brands.dart';
import 'package:cars/features/home/presentation/view/widgets/best_offers_body.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/repos/home_repo_impl.dart';

class BlocProviderBestOffersView extends StatelessWidget {
  const BlocProviderBestOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: StringsEn.bestOffers,
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
            favouritesRepo: getIt.get<FavouritesRepoImpl>(),
          ),
          GetRecommendedForYouUseCase(
            homeRepo: getIt.get<HomeRepoImpl>(),
          ),
        )..add(const AddBestOfferEvent()),
        child: const SafeArea(
          child: BestOffersBody(),
        ),
      ),
    );
  }
}
