import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/car_component.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FavouritesGridView extends StatelessWidget {
  const FavouritesGridView({
    super.key,
    required this.favourites,
  });

  final List<CarEntity> favourites;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: AppConsts.gridDelegate,
      itemCount: favourites.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 575),
          columnCount: 2,
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: CarComponent(
                car: favourites[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
