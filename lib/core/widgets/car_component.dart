import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../consts/style.dart';
import 'book_mark_animation.dart';

class CarComponent extends StatelessWidget {
  const CarComponent({
    super.key,
    this.car,
  });

  final CarModel? car;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(carDetailsPath),
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Container(
          decoration:AppConsts.decorationShadow15White,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //image
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: AppConsts.aspectRatioImage.sp,
                    child: ClipRRect(
                      borderRadius: AppConsts.mainRadius,
                      child: handleImage(image: Assets.car3),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: IconWidgetAnimation(icon: Icons.favorite),
                  ),
                ],
              ),
              const Spacer(),
              //name
              Padding(
                padding: AppConsts.mainPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'BMW 320i M Sport',
                      style: AppConsts.style16,
                    ),
                    //price
                    Text(
                      'EGP 3,000,000',
                      style: AppConsts.style16.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppConsts.primary500,
                      ),
                    ),
                  ],
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
