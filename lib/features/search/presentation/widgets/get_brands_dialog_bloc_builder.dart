import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/small_loading_widget.dart';
import '../../domain/entities/search_entity.dart';
import '../manager/search_cubit/search_cubit.dart';
import 'bloc_builder_dialog.dart';

class GetBrandsDialogBlocBuilder extends StatefulWidget {
  const GetBrandsDialogBlocBuilder({super.key});

  @override
  State<GetBrandsDialogBlocBuilder> createState() =>
      _GetBrandsDialogBlocBuilderState();
}

class _GetBrandsDialogBlocBuilderState
    extends State<GetBrandsDialogBlocBuilder> {
  @override
  void initState() {
    context.read<SearchCubit>().getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.brandsState == RequestState.loaded) {
          List<SearchFilterEntity> brands = state.brands;
          return BlocBuilderDialog(
            list: brands,
            status: StringsEn.brand,
          );
        } else if (state.brandsState == RequestState.failure) {
          return SomeThingErrorWidget(
            message: state.failureBrands,
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
