import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionInfoUser extends StatelessWidget {
  const SectionInfoUser({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Column(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        CustomCircleImage(
          image:
              'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg',
          onTap: () {},
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        SizedBox(
          width: size.width*.5.w,
          child: Text(
            'Rock',
            style: AppConsts.style20.copyWith(
              color: AppConsts.neutral900,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
