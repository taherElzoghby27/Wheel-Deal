import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/car_entity.dart';
import 'recommended_for_you_list_view.dart';
import 'shimmer_loading_widget_home.dart';

class BlocConsumerRecommendedForYou extends StatefulWidget {
  const BlocConsumerRecommendedForYou({super.key});

  @override
  State<BlocConsumerRecommendedForYou> createState() =>
      _BlocConsumerRecommendedForYouState();
}

class _BlocConsumerRecommendedForYouState
    extends State<BlocConsumerRecommendedForYou> {
  List<CarEntity> recommendedForYou = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.recommendedForYouState == RequestState.loaded ||
            state.recommendedForYouState == RequestState.loadingPagination ||
            state.recommendedForYouState == RequestState.failurePagination) {
          return RecommendedForYouListView(
            recommendedForYou: recommendedForYou,
          );
        } else if (state.recommendedForYouState == RequestState.failure) {
          return SomeThingErrorWidget(
            message: state.failureMessageBestOffers,
          );
        } else {
          return ShimmerLoadingHome(
            widthComponent: MediaQuery.of(context).size.width * .4,
          );
        }
      },
      listener: (context, state) {
        if (state.recommendedForYouState == RequestState.loaded) {
          //add data to list
          recommendedForYou.addAll(state.bestOffers);
        } else if (state.recommendedForYouState ==
            RequestState.failurePagination) {
          showSnack(
            context,
            message: state.failureMessageBestOffers,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
    );
  }
}
