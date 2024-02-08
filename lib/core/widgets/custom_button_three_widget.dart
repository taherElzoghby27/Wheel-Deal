import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonThreeWidget extends StatelessWidget {
  const CustomButtonThreeWidget({
    super.key,
    this.leading,
    required this.title,
    required this.trailing,
    required this.onTap,
    this.decoration,
    this.color = AppConsts.neutral900,
  });

  final Widget? leading;
  final String title;
  final IconData trailing;
  final void Function() onTap;
  final Decoration? decoration;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: AppConsts.primary100,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: AspectRatio(
          aspectRatio: AppConsts.aspectRatioButtonAuth,
          child: Container(
            decoration: AppConsts.borderButton.copyWith(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Row(
                children: [
                  leading ?? Container(),
                  const Spacer(flex: 1),
                  Text(
                    title,
                    style: AppConsts.style32.copyWith(
                      fontSize: 16,
                      color: color,
                    ),
                  ),
                  const Spacer(flex: 7),
                  Icon(trailing,  color: color),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
