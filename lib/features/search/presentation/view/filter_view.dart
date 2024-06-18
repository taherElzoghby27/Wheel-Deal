import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/service_locator.dart';
import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:cars/features/search/data/repos/search_repo_impl.dart';
import 'package:cars/features/search/domain/use_cases/recent_search_use_case.dart';
import 'package:cars/features/search/domain/use_cases/search_filter_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/use_cases/delete_recent_search_use_case.dart';
import '../../domain/use_cases/search_use_case.dart';
import '../manager/filter_cubit/filter_cubit.dart';
import '../manager/search_cubit/search_cubit.dart';
import '../widgets/filter_body.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: StringsEn.filter,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => FilterCubit(
              SearchFilterUseCase(
                searchRepo: getIt.get<SearchRepoImpl>(),
              ),
            ),
          ),
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
            )..recentSearch(),
          ),
        ],
        child: const SafeArea(
          child: FilterBody(),
        ),
      ),
    );
  }
}
