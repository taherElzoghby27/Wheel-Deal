import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/consts/enums.dart';
import 'custom_popular_recent_search.dart';

class RecentSearchBlocBuilder extends StatelessWidget {
  const RecentSearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final listRecentSearches = state.recentSearchList;
        if (state.recentSearchState == RequestState.loaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CustomRecentOrPopularWidget(
                leading: FontAwesomeIcons.clock,
                searchWord: listRecentSearches[index].searchQuery!,
                trailingOnTap: () {},
                trailing: FontAwesomeIcons.circleXmark,
              );
            },
            itemCount: listRecentSearches.length,
          );
        } else if (state.recentSearchState == RequestState.error) {
          return SomeThingErrorWidget(
            message: state.failureMessageRecentSearch,
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
