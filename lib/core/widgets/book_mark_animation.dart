import 'package:cars/features/favourites/presentation/manager/favourites_bloc.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../consts/style.dart';

class IconWidgetAnimation extends StatefulWidget {
  const IconWidgetAnimation({
    super.key,
    required this.icon,
    this.paddingIcon,
    required this.carEntity,
  });

  final IconData icon;
  final EdgeInsetsGeometry? paddingIcon;
  final CarEntity carEntity;

  @override
  State<IconWidgetAnimation> createState() => _IconWidgetAnimationState();
}

class _IconWidgetAnimationState extends State<IconWidgetAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late FavouritesBloc favouritesBloc;

  @override
  void initState() {
    favouritesBloc = context.read<FavouritesBloc>();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );
    sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween(begin: 25, end: 30),
          weight: 50,
        ),
        TweenSequenceItem(
          tween: Tween(begin: 30, end: 25),
          weight: 50,
        ),
      ],
    ).animate(controller);
    favouritesBloc.isSaved = favouritesBloc.checkIfFavOrNot(
      int.parse(widget.carEntity.id),
    );
    handleAnimation();
    super.initState();
  }

  void handleAnimation() {
    favouritesBloc.isSaved ? controller.forward() : controller.stop();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConsts.neutral100.withOpacity(.05),
        borderRadius: AppConsts.mainRadius,
      ),
      child: Center(
        child: BlocBuilder<FavouritesBloc, FavouritesState>(
          builder: (context, state) {
            return InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                favouritesBloc.isSaved = favouritesBloc.checkIfFavOrNot(
                  int.parse(widget.carEntity.id),
                );
                if (favouritesBloc.isSaved) {
                  favouritesBloc.add(
                    DeleteFavEvent(carEntity: widget.carEntity),
                  );
                  controller.reverse();
                } else {
                  favouritesBloc.add(
                    AddFavEvent(carEntity: widget.carEntity),
                  );
                  controller.forward();
                }
              },
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) => Padding(
                  padding: widget.paddingIcon ?? const EdgeInsets.all(0),
                  child: Icon(
                    widget.icon,
                    size: sizeAnimation.value,
                    color: favouritesBloc.isSaved
                        ? AppConsts.mainColor
                        : AppConsts.neutral500,
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
