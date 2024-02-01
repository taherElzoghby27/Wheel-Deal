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
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: size.height * .04.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: active ? AppConsts.primary500 : AppConsts.neutral100,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
