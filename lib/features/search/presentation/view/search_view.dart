import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/service_locator.dart';
import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:cars/features/search/data/repos/search_repo_impl.dart';
import 'package:cars/features/search/domain/use_cases/delete_recent_search_use_case.dart';
import 'package:cars/features/search/domain/use_cases/recent_search_use_case.dart';
import 'package:cars/features/search/domain/use_cases/search_use_case.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
      body: BlocProvider(
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
        child: const SafeArea(
          child: SearchBody(),
        ),
      ),
    );
  }
}
