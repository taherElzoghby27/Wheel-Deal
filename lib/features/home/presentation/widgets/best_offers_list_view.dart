import 'package:cars/core/widgets/car_component.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestOffersListView extends StatefulWidget {
  const BestOffersListView({
    super.key,
    required this.bestOfferCars,
    required this.axisDirection,
  });

  final Axis axisDirection;

  final List<CarEntity> bestOfferCars;

  @override
  State<BestOffersListView> createState() => _BestOffersListViewState();
}

class _BestOffersListViewState extends State<BestOffersListView> {
  late ScrollController _scrollController;
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() => handleScroll());
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

//handle scroll
  void handleScroll() {
    double maxScrolls = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll > maxScrolls * .7) {
      isLoading = true;
      if (isLoading) {
        BlocProvider.of<HomeBloc>(context).add(AddBestOfferEvent(page: page++));
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      controller: _scrollController,
      scrollDirection: widget.axisDirection,
      itemBuilder: (context, index) => CarComponent(
        car: widget.bestOfferCars[index],
      ),
      itemCount: widget.bestOfferCars.length,
    );
  }
}
