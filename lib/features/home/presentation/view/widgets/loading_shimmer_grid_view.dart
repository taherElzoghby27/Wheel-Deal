import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';

import 'load_widget.dart';

class LoadingCarsGridViewShimmer extends StatelessWidget {
  const LoadingCarsGridViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ttb,
      baseColor: AppConsts.neutral800.withOpacity(.7),
      highlightColor: AppConsts.black,
      child: AnimationLimiter(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: AppConsts.gridDelegate,
          itemCount: 6,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 875),
              columnCount: 2,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: LoadWidget(
                    width: MediaQuery.sizeOf(context).width * .4,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
