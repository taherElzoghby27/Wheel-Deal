import 'package:cars/core/helper/handle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/style.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.icon,
    this.title,
    this.subTitle,
  });

  final String icon;
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          SizedBox(height: size.height * .15.h),
          //icon
          HandleImageWidget(
            image: icon,
          ),
          // SvgPicture.asset(
          //   icon,
          //   fit: BoxFit.fill,
          //   height: size.height * .15.h,
          // ),
          SizedBox(height: size.height * .04.h),
          //title
          Text(
            title ?? '',
            style: AppConsts.style24,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * .01.h),
          //sub title
          SizedBox(
            width: size.width * .7.w,
            child: Text(
              subTitle ?? '',
              style: AppConsts.style16,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
