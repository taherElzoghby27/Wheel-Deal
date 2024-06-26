import 'package:cars/features/home/domain/entities/brand_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/home_bloc/home_bloc.dart';
import 'brand_item.dart';

class TopBrandsListView extends StatefulWidget {
  const TopBrandsListView({
    super.key,
    required this.brands,
  });

  final List<BrandEntity> brands;

  @override
  State<TopBrandsListView> createState() => _TopBrandsListViewState();
}

class _TopBrandsListViewState extends State<TopBrandsListView> {
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
          AddTopBrandsEvent(page: page++),
        );
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      children: widget.brands
          .map(
            (item) => BrandItem(brand: item),
          )
          .toList(),
    );
  }
}
