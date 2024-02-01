import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarComponent extends StatelessWidget {
  const CarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppConsts.neutral100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //image
            Stack(
              children: [
                SizedBox(
                  height: size.height * .2.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: handleImage(image: Assets.car3),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outline_rounded),
                  ),
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
    );
  }
}
