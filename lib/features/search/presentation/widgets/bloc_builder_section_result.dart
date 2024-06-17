import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/consts/strings.dart';
import '../manager/search_cubit/search_cubit.dart';
import 'recent_searchs.dart';
import 'search_bloc_consumer.dart';

class BlocBuilderSectionResult extends StatelessWidget {
  const BlocBuilderSectionResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return context.read<SearchCubit>().initial
            ? RecentSearch(
                tileHint: StringsEn.recentSearches,
              )
            : const SearchBlocConsumer();
      },
    );
  }
}
