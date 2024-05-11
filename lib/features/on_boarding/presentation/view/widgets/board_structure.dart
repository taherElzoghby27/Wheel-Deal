import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardStructure extends StatelessWidget {
  const BoardStructure({
    super.key,
    required this.image,
    required this.subTitle,
    required this.title,
  });

  final String image;
  final String title;
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
            padding: AppConsts.mainPadding,
            child: Column(
              children: [
                ///title
                Text(
                  title,
                  style: AppConsts.style24.copyWith(
                    color: AppConsts.mainColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                ///sub title
                Padding(
                  padding: AppConsts.mainPadding,
                  child: Text(
                    subTitle,
                    style: AppConsts.style14.copyWith(
                      color: Theme.of(context).canvasColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
