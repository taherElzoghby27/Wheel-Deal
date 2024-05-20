import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/car_component.dart';
import '../../../domain/entities/car_entity.dart';
import 'shimmer_loading_widget_home.dart';

class BestOffersBlocConsumer extends StatefulWidget {
  const BestOffersBlocConsumer({super.key});

  @override
  State<BestOffersBlocConsumer> createState() => _BestOffersBlocConsumerState();
}

class _BestOffersBlocConsumerState extends State<BestOffersBlocConsumer> {
  List<CarEntity> bestOfferCars = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.bestOffersState == RequestState.loaded ||
            state.bestOffersState == RequestState.loadingPagination ||
            state.bestOffersState == RequestState.failurePagination) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CarComponent(car: bestOfferCars[index]);
            },
            itemCount: bestOfferCars.length,
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
