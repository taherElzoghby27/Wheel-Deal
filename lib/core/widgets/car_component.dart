import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/features/home/data/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../consts/style.dart';
import 'book_mark_animation.dart';

class CarComponent extends StatelessWidget {
  const CarComponent({super.key, this.car});

  final CarModel? car;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => GoRouter.of(context).push(carDetailsPath),
      child: Padding(
        padding: AppConsts.padding8,
        child: Container(
          width: size.width * .375,
          decoration: AppConsts.mainDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //image
              const Expanded(
                flex: 8,
                child: ClipRRect(
                  borderRadius: AppConsts.radiusTop15,
                  child: HandleImageWidget(
                      image:
                          'https://i0.wp.com/citymagazine.si/wp-content/uploads/2023/05/bmw-i5-edrive40-2023-10.jpg?fit=1920%2C1080&ssl=1'),
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
                      const Expanded(
                        flex: 10,
                        child: Text(
                          'BMW 320i M Sport',
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
                                'EGP 3,000,000',
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
