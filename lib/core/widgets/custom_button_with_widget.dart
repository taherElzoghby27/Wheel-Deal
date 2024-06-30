import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWithWidget extends StatelessWidget {
  const CustomButtonWithWidget({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final String icon;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * .065.h,
        decoration: AppConsts.borderButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon),
            SizedBox(width: size.width * .01.w),
            Text(
              label,
              style: AppConsts.style14.copyWith(
                color: AppConsts.neutral900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
