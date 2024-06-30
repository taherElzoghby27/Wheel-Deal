import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:cars/features/search/domain/entities/search_entity.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/small_loading_widget.dart';
import 'bloc_builder_dialog.dart';

class GetBodyTypesBlocBuilder extends StatefulWidget {
  const GetBodyTypesBlocBuilder({super.key});

  @override
  State<GetBodyTypesBlocBuilder> createState() =>
      _GetBodyTypesBlocBuilderState();
}

class _GetBodyTypesBlocBuilderState extends State<GetBodyTypesBlocBuilder> {
  @override
  void initState() {
    context.read<SearchCubit>().getBodyTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state.bodyTypesState == RequestState.loaded) {
              List<SearchFilterEntity> bodyTypes = state.bodyTypes;
              return BlocBuilderDialog(
                list: bodyTypes,
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
      },
    );
  }
}
