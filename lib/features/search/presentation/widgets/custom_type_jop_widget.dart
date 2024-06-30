import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cars/core/theming/style.dart';

class CustomTypeJopWidget extends StatelessWidget {
  const CustomTypeJopWidget({
    super.key,
    required this.label,
    required this.labelColor,
    required this.onTap,
  });

  final String label;
  final Color labelColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * .05.h,
        width: size.width * .25.w,
        decoration: BoxDecoration(
          color: labelColor == AppConsts.neutral500
              ? AppConsts.neutral100
              : labelColor.withOpacity(.3),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: labelColor),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
            child: Text(
              label,
              style: AppConsts.style16.copyWith(
                fontSize: 12,
                color: labelColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
