import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../core/widgets/car_component.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 10, // spacing between rows
          crossAxisSpacing: 10, // spacing between columns
          childAspectRatio: AppConsts.aspectRatioComponentCategory.sp,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 575),
            columnCount: 2,
            child: const ScaleAnimation(
              child: FadeInAnimation(
                child: CarComponent(),
              ),
            ),
          );
        },
      ),
    );
  }
}
