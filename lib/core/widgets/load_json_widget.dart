import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadJsonWidget extends StatelessWidget {
  const LoadJsonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppConsts.neutral300.withOpacity(.45),
      height: size.height,
      child: Center(
        child: Lottie.asset(
          Assets.imagesLoad,
          height: size.height * .075.h,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
