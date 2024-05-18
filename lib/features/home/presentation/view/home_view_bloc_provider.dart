import 'package:cars/core/services/service_locator.dart';
import 'package:cars/features/home/data/repos/home_repo_impl.dart';
import 'package:cars/features/home/domain/usecases/get_best_offers.dart';
import 'package:cars/features/home/domain/usecases/get_favourites.dart';
import 'package:cars/features/home/domain/usecases/get_recommended_for_you.dart';
import 'package:cars/features/home/domain/usecases/get_top_brands.dart';
import 'package:cars/features/home/presentation/view/widgets/home_body.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBlocProvider extends StatelessWidget {
  const HomeViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        )
          ..add(AddTopBrandsEvent())
          ..add(AddBestOfferEvent())
          ..add(AddFavouritesEvent())
          ..add(AddRecommendedForYouEvent()),
        child: const SafeArea(
          child: HomeBody(),
        ),
      ),
    );
  }
}
