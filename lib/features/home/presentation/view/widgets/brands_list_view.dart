import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shimmer_loading_widget_home.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        // if (state.topBrandsState == RequestState.loaded) {
        //   List<BrandEntity> brands = state.topBrands;
        //   return ListView(
        //     scrollDirection: Axis.horizontal,
        //     children: brands
        //         .map(
        //           (item) => BrandItem(brand: item),
        //         )
        //         .toList(),
        //   );
        // } else if (state.topBrandsState == RequestState.failure) {
        //   return const Center(child: Text('no data'));
        // } else {
        return const ShimmerLoadingHome();
        // }
      },
    );
  }
}
