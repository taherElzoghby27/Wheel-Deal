import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/car_component.dart';
import 'shimmer_loading_widget_home.dart';

class BestOffersBlocConsumer extends StatelessWidget {
  const BestOffersBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.bestOffersState == RequestState.loaded) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CarComponent();
            },
            itemCount: 10,
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
      listener: (context, state) {},
    );
  }
}
