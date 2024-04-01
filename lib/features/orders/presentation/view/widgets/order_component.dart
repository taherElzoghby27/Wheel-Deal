import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderComponent extends StatelessWidget {
  const OrderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: AspectRatio(
        aspectRatio: AppConsts.aspectRatioComponentOrder.sp,
        child: Container(
          decoration: AppConsts.decorationShadow15White,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AspectRatio(
                      aspectRatio: AppConsts.aspectRatioImage.sp,
                      child: const HandleImageWidget(image: Assets.car1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BMW 320i M Sport',
                            style: AppConsts.style16.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'EGP 3,000,000',
                            style: AppConsts.style14.copyWith(
                              color: AppConsts.primary500,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.w, right: 10.w),
                        child: AspectRatio(
                          aspectRatio: AppConsts.aspectRatioButtonComponent.sp,
                          child: CustomButton(
                            text: StringsEn.trackOrder,
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
