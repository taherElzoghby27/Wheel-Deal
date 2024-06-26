import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_offers_grid_view.dart';
import 'loading_shimmer_grid_view.dart';

class BestOffersBlocConsumer extends StatefulWidget {
  const BestOffersBlocConsumer({super.key});

  @override
  State<BestOffersBlocConsumer> createState() => _BestOffersBlocConsumerState();
}

class _BestOffersBlocConsumerState extends State<BestOffersBlocConsumer> {
  List<CarEntity> bestOffers = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.bestOffersState == RequestState.loaded ||
            state.bestOffersState == RequestState.loadingPagination ||
            state.bestOffersState == RequestState.failurePagination) {
          return BestOffersGridView(bestOffers: bestOffers);
        } else if (state.bestOffersState == RequestState.failure) {
          return SomeThingErrorWidget(
            message: state.failureMessageBestOffers,
          );
        } else {
          return const LoadingCarsGridViewShimmer();
        }
      },
      listener: (context, state) {
        if (state.bestOffersState == RequestState.loaded) {
          bestOffers.addAll(state.bestOffers);
        } else if (state.bestOffersState == RequestState.failurePagination) {
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
