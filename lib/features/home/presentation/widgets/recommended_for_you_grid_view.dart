import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/car_component.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RecommendedForYouGridView extends StatefulWidget {
  const RecommendedForYouGridView({
    super.key,
    required this.recommendedForYou,
  });

  final List<CarEntity> recommendedForYou;

  @override
  State<RecommendedForYouGridView> createState() =>
      _RecommendedForYouGridViewState();
}

class _RecommendedForYouGridViewState extends State<RecommendedForYouGridView> {
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
    if (currentScroll >= maxScrolls * .7) {
      isLoading = true;
      if (isLoading) {
        BlocProvider.of<HomeBloc>(context).add(AddBestOfferEvent(page: page++));
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      gridDelegate: AppConsts.gridDelegate,
      itemCount: widget.recommendedForYou.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 575),
          columnCount: 2,
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: CarComponent(
                car: widget.recommendedForYou[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
