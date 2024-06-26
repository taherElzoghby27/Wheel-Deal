import 'package:cars/core/services/service_locator.dart';
import 'package:cars/features/favourites/data/repos/favourites_repo_impl.dart';
import 'package:cars/features/favourites/domain/use_cases/add_favourite_use_case.dart';
import 'package:cars/features/favourites/domain/use_cases/delete_favourite_use_case.dart';
import 'package:cars/features/favourites/domain/use_cases/get_favourites_use_case.dart';
import 'package:cars/features/home/data/repos/home_repo_impl.dart';
import 'package:cars/features/home/domain/usecases/get_best_offers.dart';
import 'package:cars/features/home/domain/usecases/get_recommended_for_you.dart';
import 'package:cars/features/home/domain/usecases/get_top_brands.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../favourites/presentation/manager/favourite_cubit.dart';
import '../widgets/home_body.dart';

class HomeViewBlocProvider extends StatelessWidget {
  const HomeViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
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
            )
              ..add(const AddTopBrandsEvent())
              ..add(const AddBestOfferEvent())
              ..add(const AddFavouritesEvent())
              ..add(const AddRecommendedForYouEvent()),
          ),
          BlocProvider(
            create: (_) => FavouriteCubit(
              GetFavouritesUseCase(
                favouritesRepo: getIt.get<FavouritesRepoImpl>(),
              ),
              AddFavUseCase(
                favouritesRepo: getIt.get<FavouritesRepoImpl>(),
              ),
              DeleteFavUseCase(
                favouritesRepo: getIt.get<FavouritesRepoImpl>(),
              ),
            )..getFav(),
          ),
        ],
        child: const SafeArea(
          child: HomeBody(),
        ),
      ),
    );
  }
}
