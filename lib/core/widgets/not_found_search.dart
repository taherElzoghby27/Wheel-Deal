import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
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
        SizedBox(height: size.height * .02.h),
        Text(StringsEn.searchNotFound, style: AppConsts.style24),
        SizedBox(height: size.height * .02.h),
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
