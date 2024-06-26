import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/core/widgets/tile_widget.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/presentation/widgets/loading_shimmer_grid_view.dart';
import 'search_list_grid_view.dart';

class SearchBlocConsumer extends StatefulWidget {
  const SearchBlocConsumer({super.key});

  @override
  State<SearchBlocConsumer> createState() => _SearchBlocConsumerState();
}

class _SearchBlocConsumerState extends State<SearchBlocConsumer> {
  List<CarEntity> searchList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      builder: (context, state) {
        Size size = MediaQuery.of(context).size;
        if (state.searchState == RequestState.loaded ||
            state.searchFilterState == RequestState.loaded) {
          return Column(
            children: [
              SizedBox(
                height: size.height * .04.h,
                child: TileWidget(
                  label:
                      "${StringsEn.featuring} ${searchList.length} ${StringsEn.cars}",
                ),
              ),
              SearchListGridView(searchList: searchList),
            ],
          );
        } else if (state.searchState == RequestState.failure) {
          return SomeThingErrorWidget(
            message: state.failureMessageSearch,
          );
        } else {
          return const LoadingCarsGridViewShimmer();
        }
      },
      listener: (context, state) {
        if (state.searchState == RequestState.loaded) {
          searchList.addAll(state.searchList);
        } else if (state.searchState == RequestState.failurePagination) {
          showSnack(
            context,
            message: state.failureMessageSearch,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
    );
  }
}
