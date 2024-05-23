import 'package:cars/core/widgets/car_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/car_entity.dart';
import '../../view_model/home_bloc/home_bloc.dart';

class RecommendedForYouListView extends StatefulWidget {
  const RecommendedForYouListView({
    super.key,
    required this.recommendedForYou,
  });

  final List<CarEntity> recommendedForYou;

  @override
  State<RecommendedForYouListView> createState() =>
      _RecommendedForYouListViewState();
}

class _RecommendedForYouListViewState extends State<RecommendedForYouListView> {
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

  void handleScroll() {
    double maxScrolls = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll > maxScrolls * .7) {
      isLoading = true;
      if (isLoading) {
        BlocProvider.of<HomeBloc>(context).add(
          AddRecommendedForYouEvent(page: page++),
        );
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      itemBuilder: (context, index) => CarComponent(
        car: widget.recommendedForYou[index],
      ),
      itemCount: widget.recommendedForYou.length,
    );
  }
}
