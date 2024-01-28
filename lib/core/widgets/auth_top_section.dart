import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AuthTopSection extends StatelessWidget {
  const AuthTopSection({
    super.key,
    required this.title,
    required this.subTitle,
    required this.widget,
  });

  final String title;
  final String subTitle;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * .02.h),

        ///logo
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget,
              SizedBox(
                height: size.height * .1,
                child: Lottie.asset(Assets.imagesLoadCar, fit: BoxFit.fitWidth),
              )
            ],
          ),
        ),
        SizedBox(height: size.height * .01.h),

        ///create account title
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppConsts.style28.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * .01.h),

            ///create account sub title
            Text(subTitle, style: AppConsts.style16),
          ],
        ),

        SizedBox(height: size.height * .055.h),
      ],
    );
  }
}
