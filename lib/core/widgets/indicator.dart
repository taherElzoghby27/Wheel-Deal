import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class indicator extends StatelessWidget {
  const indicator({
    super.key,
    required this.color,
    required this.height,
    required this.width,
  });
  final Color color;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.sp),
        ),
      ),
    );
  }
}
