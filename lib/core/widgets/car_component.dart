import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../consts/style.dart';
import 'book_mark_animation.dart';

class CarComponent extends StatelessWidget {
  const CarComponent({super.key, required this.car});

  final CarEntity car;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => GoRouter.of(context).push(
        carDetailsPath,
        extra: car.id,
      ),
      child: Padding(
        padding: AppConsts.padding8,
        child: Container(
          width: size.width * .375,
          decoration: AppConsts.mainDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //image
              Expanded(
                flex: 8,
                child: ClipRRect(
                  borderRadius: AppConsts.radiusTop15,
                  child: HandleImageWidget(image: car.image),
                ),
              ),
              const Spacer(),
              //name
              Expanded(
                flex: 4,
                child: Padding(
                  padding: AppConsts.mainPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Text(
                          car.title,
                          overflow: TextOverflow.ellipsis,
                          style: AppConsts.style16,
                        ),
                      ),
                      const Spacer(),
                      //price
                      Expanded(
                        flex: 10,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Text(
                                'EGP ${car.priceCar}',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: AppConsts.style12.copyWith(
                                  color: AppConsts.mainColor,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Expanded(
                              flex: 5,
                              child: IconWidgetAnimation(icon: Icons.favorite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
