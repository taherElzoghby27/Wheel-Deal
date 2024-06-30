import 'package:cars/core/theming/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/features/home/domain/entities/brand_entity.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shimmer_loading_widget_home.dart';
import 'top_brands_list_view.dart';

class BrandsListView extends StatefulWidget {
  const BrandsListView({super.key});

  @override
  State<BrandsListView> createState() => _BrandsListViewState();
}

class _BrandsListViewState extends State<BrandsListView> {
  List<BrandEntity> brands = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.topBrandsState == RequestState.loaded) {
          //add data to list
          brands.addAll(state.topBrands);
        } else if (state.topBrandsState == RequestState.failurePagination) {
          showSnack(
            context,
            message: state.failureMessageBestOffers,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        if (state.topBrandsState == RequestState.loaded) {
          return TopBrandsListView(brands: brands);
        } else if (state.topBrandsState == RequestState.failure) {
          return SomeThingErrorWidget(
            message: state.failureMessageBestOffers,
          );
        } else {
          return const ShimmerLoadingHome();
        }
      },
    );
  }
}
