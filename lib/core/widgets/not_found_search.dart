import 'package:cars/core/helper/assets.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotFoundSearch extends StatelessWidget {
  const NotFoundSearch({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: size.height * .2.h),
        SvgPicture.asset(Assets.imagesNotFoundSearch),
        const AspectRatio(aspectRatio:  AppConsts.aspectRatioTopSpace),
        Text(StringsEn.searchNotFound, style: AppConsts.style24),
        const AspectRatio(aspectRatio:  AppConsts.aspectRatioTopSpace),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            StringsEn.trySearchingWithDifferent,
            style: AppConsts.style16,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
