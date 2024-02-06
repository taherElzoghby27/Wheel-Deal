import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.label,
    required this.active,
    this.onTap,
  });

  final String label;
  final bool active;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: active ? AppConsts.primary500 : AppConsts.neutral100,
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0.sp),
            child: Center(
              child: Text(
                label,
                style: AppConsts.style14Bubble.copyWith(
                  color: active ? AppConsts.neutral100 : AppConsts.neutral900,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
