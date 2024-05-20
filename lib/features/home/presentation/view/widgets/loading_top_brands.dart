import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'loading_widget_top_brands.dart';

class LoadingTopBrandsListView extends StatelessWidget {
  const LoadingTopBrandsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: AppConsts.neutral800.withOpacity(.7),
        highlightColor: AppConsts.black,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            5,
            (c) => const LoadingWidgetTopBrand(),
          ),
        ),
      ),
    );
  }
}
