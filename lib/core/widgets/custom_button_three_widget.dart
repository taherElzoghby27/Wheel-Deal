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
  });

  final Widget? leading;
  final String title;
  final IconData trailing;
  final void Function() onTap;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      highlightColor: AppConsts.primary100,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: size.height * .07.h,
        width: size.width * .9.w,
        decoration: decoration ??
            AppConsts.borderButton.copyWith(
              borderRadius: BorderRadius.circular(100),
            ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              leading ?? Container(),
              const Spacer(flex: 1),
              Text(
                title,
                style: AppConsts.style32.copyWith(fontSize: 16),
              ),
              const Spacer(flex: 7),
              Icon(trailing, weight: 100),
            ],
          ),
        ),
      ),
    );
  }
}
