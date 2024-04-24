import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardStructure extends StatelessWidget {
  const BoardStructure({
    super.key,
    required this.image,
    required this.subTitle,
    required this.titles,
  });

  final String image;
  final List<InlineSpan> titles;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          SizedBox(height: size.height * .1.h),
          //image
          Image.asset(
            image,
            height: size.height * .4.h,
          ),
          SizedBox(height: size.height * .025.h),
          Padding(
            padding: EdgeInsets.all(12.sp),
            child: Column(
              children: [
                ///title
                Text.rich(
                  TextSpan(children: titles),
                  style: AppConsts.style32,
                ),

                ///sub title
                Text(
                  subTitle,
                  style: AppConsts.style16,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
