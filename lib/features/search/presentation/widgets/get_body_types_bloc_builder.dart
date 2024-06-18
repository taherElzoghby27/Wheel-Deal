import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/small_loading_widget.dart';
import 'bloc_builder_dialog.dart';

class GetBodyTypesBlocBuilder extends StatelessWidget {
  const GetBodyTypesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.bodyTypesState == RequestState.loaded) {
          return BlocBuilderDialog(
            list: state.bodyTypes,
            status: StringsEn.bodyType,
          );
        } else if (state.bodyTypesState == RequestState.failure) {
          return SomeThingErrorWidget(
            message: state.failureBodyTypes,
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
