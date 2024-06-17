import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'alert_dialog_delete_search.dart';
import 'custom_popular_recent_search.dart';

class RecentSearchBlocBuilder extends StatelessWidget {
  const RecentSearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state.deleteRecentSearchState == RequestState.failure) {
          showSnack(
            context,
            message: state.failureMessageDeleteRecentSearch,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        final listRecentSearches = state.recentSearchList;
        if (state.recentSearchState == RequestState.loaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Builder(
                builder: (BuildContext contextBuilder) =>
                    CustomRecentOrPopularWidget(
                  leading: FontAwesomeIcons.clock,
                  searchWord: listRecentSearches[index].searchQuery!,
                  trailingOnTap: () => showDialog(
                    context: contextBuilder,
                    builder: (_) => BlocProvider.value(
                      value: contextBuilder.read<SearchCubit>(),
                      child: AlertDialogDeleteHistory(
                        searchWord: listRecentSearches[index].searchQuery!,
                      ),
                    ),
                  ),
                  trailing: FontAwesomeIcons.circleXmark,
                ),
              );
            },
            itemCount: listRecentSearches.length,
          );
        } else if (state.recentSearchState == RequestState.failure) {
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
