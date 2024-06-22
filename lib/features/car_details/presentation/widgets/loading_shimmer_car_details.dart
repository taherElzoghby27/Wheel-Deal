
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCarDetails extends StatelessWidget {
  const LoadingCarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size sizeOf = MediaQuery.sizeOf(context);
    return Shimmer.fromColors(
      direction: ShimmerDirection.ttb,
      baseColor: AppConsts.neutral800.withOpacity(.5),
      highlightColor: AppConsts.black,
      child: Padding(
        padding: AppConsts.mainPadding,
        child: Column(
          children: [
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            AspectRatio(
              aspectRatio: AppConsts.aspectRatio16on2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: sizeOf.width * .4,
                    decoration: BoxDecoration(
                      color: AppConsts.neutral800,
                      borderRadius: AppConsts.mainRadius,
                    ),
                  ),
                  Container(
                    width: sizeOf.width * .4,
                    decoration: BoxDecoration(
                      color: AppConsts.neutral800,
                      borderRadius: AppConsts.mainRadius,
                    ),
                  ),
                ],
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: sizeOf.height * .03,
                width: sizeOf.width * .3,
                decoration: BoxDecoration(
                  color: AppConsts.neutral800,
                  borderRadius: AppConsts.mainRadius,
                ),
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            AspectRatio(
              aspectRatio: AppConsts.aspect16on14,
              child: Container(
                width: sizeOf.width * .35,
                decoration: BoxDecoration(
                  color: AppConsts.neutral800,
                  borderRadius: AppConsts.mainRadius,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
