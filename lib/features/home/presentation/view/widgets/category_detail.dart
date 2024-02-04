import 'package:flutter/material.dart';
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 10, // spacing between rows
          crossAxisSpacing: 10, // spacing between columns
          childAspectRatio: 2.25 / 3,
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
