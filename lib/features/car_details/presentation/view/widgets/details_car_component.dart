import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_button_icon.dart';
import 'package:cars/features/car_details/presentation/view/widgets/tile_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'box_decortaion_widget.dart';

class DetailsCarComponent extends StatelessWidget {
  const DetailsCarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AspectRatio(aspectRatio:  AppConsts.aspectRatioTopSpace),
          //price name
          BoxDecorationWidget(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EGP 3,000,000',
                  style: AppConsts.style20.copyWith(
                    color: AppConsts.neutral700,
                  ),
                ),
                Text(
                  'BMW 320i M ',
                  style: AppConsts.style16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: size.height * .015.h),
          //place  date
          const BoxDecorationWidget(
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      'Nasr City, Cairo',
                      style: AppConsts.style14,
                    ),
                  ],
                ),
                Text(
                  '15/12/2023',
                  style: AppConsts.style14,
                )
              ],
            ),
          ),
          SizedBox(height: size.height * .015.h),
          //details
          const BoxDecorationWidget(
            widget: Column(
              children: [
                TileDetailPropertyWidget(
                  ke: StringsEn.brand,
                  value: 'BMW',
                ),
                TileDetailPropertyWidget(
                  ke: StringsEn.model,
                  value: '320i M',
                ),
                TileDetailPropertyWidget(
                  ke: StringsEn.adType,
                  value: 'For Sale',
                ),
                TileDetailPropertyWidget(
                  ke: StringsEn.transmission,
                  value: 'Automatic',
                ),
                TileDetailPropertyWidget(
                  ke: StringsEn.km,
                  value: '70,000',
                ),
                TileDetailPropertyWidget(
                  ke: StringsEn.color,
                  value: 'Blue',
                ),
                TileDetailPropertyWidget(
                  ke: StringsEn.fuel,
                  value: 'Benzine',
                ),
                TileDetailPropertyWidget(
                  ke: StringsEn.year,
                  value: '2023',
                ),
                TileDetailPropertyWidget(
                  ke: StringsEn.condition,
                  value: 'Used',
                ),
                TileDetailPropertyWidget(
                  ke: StringsEn.paymentOptions,
                  value: 'Cash',
                ),
                TileDetailPropertyWidget(
                  ke: StringsEn.engineCapacity,
                  value: '1400-1500',
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * .015.h),
          //Description
          BoxDecorationWidget(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsEn.description,
                  style: AppConsts.style16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ex',
                  style: AppConsts.style14,
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * .015.h),
          //extra features
          BoxDecorationWidget(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsEn.extraFeatures,
                  style: AppConsts.style16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: size.height * .01.h),
                Wrap(
                  spacing: size.width * .2.w,
                  runSpacing: size.height * .015.h,
                  children: [
                    Text(
                      'Airbags',
                      style: AppConsts.style14,
                    ),
                    Text(
                      'ABS',
                      style: AppConsts.style14,
                    ),
                    Text(
                      'Air Conditioning',
                      style: AppConsts.style14,
                    ),
                    Text(
                      'AM/FM Radio',
                      style: AppConsts.style14,
                    ),
                    Text(
                      'Anti-Theft System',
                      style: AppConsts.style14,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * .015.h),
          Row(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: AppConsts.aspectRatioButtonDetailsCar.sp,
                  child: CustomButtonIcon(
                    label: StringsEn.chat,
                    icon: Icons.chat,
                    onTap: () {},
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: AppConsts.aspectRatioButtonDetailsCar.sp,
                  child: CustomButtonIcon(
                    label: StringsEn.call,
                    icon: Icons.call,
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
