import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxDecorationWidget extends StatelessWidget {
  const BoxDecorationWidget({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:AppConsts.decorationShadow15White,
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: widget,
      ),
    );
  }
}