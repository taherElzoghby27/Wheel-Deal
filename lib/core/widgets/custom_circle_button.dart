import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    super.key,
    this.onTap,
    required this.icon,
    this.color,
    this.colorIcon,
  });

  final String icon;
  final void Function()? onTap;
  final Color? color;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25.sp),
      child: Container(
        height: size.height * .055.h,
        width: size.width * .12.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25.sp),
          border: Border.all(color: color ?? AppConsts.neutral300),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            color: colorIcon,
          ),
        ),
      ),
    );
  }
}
