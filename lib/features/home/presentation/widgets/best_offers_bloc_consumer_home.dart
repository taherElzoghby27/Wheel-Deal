import 'package:cars/core/theming/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/car_entity.dart';
import 'best_offers_list_view.dart';
import 'shimmer_loading_widget_home.dart';

class BestOffersBlocConsumerHome extends StatefulWidget {
  const BestOffersBlocConsumerHome({super.key});

  @override
  State<BestOffersBlocConsumerHome> createState() =>
      _BestOffersBlocConsumerHomeState();
}

class _BestOffersBlocConsumerHomeState
    extends State<BestOffersBlocConsumerHome> {
  List<CarEntity> bestOfferCars = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.bestOffersState == RequestState.loaded ||
            state.bestOffersState == RequestState.loadingPagination ||
            state.bestOffersState == RequestState.failurePagination) {
          return BestOffersListView(
            bestOfferCars: bestOfferCars.reversed.toList(),
            axisDirection: Axis.horizontal,
          );
        } else if (state.bestOffersState == RequestState.failure) {
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
        if (state.bestOffersState == RequestState.loaded) {
          //add data to list
          bestOfferCars.addAll(state.bestOffers);
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
