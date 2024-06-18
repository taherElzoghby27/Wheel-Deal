import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/service_locator.dart';
import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:cars/features/favourites/data/repos/favourites_repo_impl.dart';
import 'package:cars/features/favourites/domain/use_cases/add_favourite_use_case.dart';
import 'package:cars/features/favourites/domain/use_cases/delete_favourite_use_case.dart';
import 'package:cars/features/favourites/domain/use_cases/get_favourites_use_case.dart';
import 'package:cars/features/favourites/presentation/manager/favourite_cubit.dart';
import 'package:cars/features/home/domain/usecases/get_best_offers.dart';
import 'package:cars/features/home/domain/usecases/get_top_brands.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:cars/features/search/data/repos/search_repo_impl.dart';
import 'package:cars/features/search/domain/use_cases/body_type_filter_use_case.dart';
import 'package:cars/features/search/domain/use_cases/delete_recent_search_use_case.dart';
import 'package:cars/features/search/domain/use_cases/get_brands_use_case.dart';
import 'package:cars/features/search/domain/use_cases/recent_search_use_case.dart';
import 'package:cars/features/search/domain/use_cases/search_filter_use_case.dart';
import 'package:cars/features/search/domain/use_cases/search_use_case.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../home/data/repos/home_repo_impl.dart';
import '../../../home/domain/usecases/get_recommended_for_you.dart';
import '../widgets/search_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: StringsEn.searchLabel,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SearchCubit(
              GetRecentSearchUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              SearchUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              DeleteRecentSearchUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              SearchFilterUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              BodyTypeFilterUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
              GetBrandsUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
            )..recentSearch(),
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
            ),
          ),
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
            ),
          ),
        ],
        child: const SafeArea(
          child: SearchBody(),
        ),
      ),
    );
  }
}
