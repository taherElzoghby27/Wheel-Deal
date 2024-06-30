import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'load_widget.dart';

class ShimmerLoadingHome extends StatelessWidget {
  const ShimmerLoadingHome({
    super.key,
    this.widthComponent,
    this.direction,
  });

  final double? widthComponent;
  final Axis? direction;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ttb,
      baseColor: AppConsts.neutral800.withOpacity(.7),
      highlightColor: AppConsts.black,
      child: ListView(
        scrollDirection: direction ?? Axis.horizontal,
        children: List.generate(
          5,
          (c) => LoadWidget(width: widthComponent),
        ),
      ),
    );
  }
}
