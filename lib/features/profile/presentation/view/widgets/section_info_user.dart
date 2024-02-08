import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_circle_image.dart';
import 'package:flutter/material.dart';

class SectionInfoUser extends StatelessWidget {
  const SectionInfoUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        CustomCircleImage(
          image:
              'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg',
          onTap: () {},
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        Text(
          'Taher Elzoghby',
          style: AppConsts.style20.copyWith(
            color: AppConsts.neutral900,
          ),
        ),
      ],
    );
  }
}
