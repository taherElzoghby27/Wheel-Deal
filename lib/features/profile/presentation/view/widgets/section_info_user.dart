import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionInfoUser extends StatelessWidget {
  const SectionInfoUser({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        CircleAvatar(
          radius: size.height * .1.h,
          backgroundImage: const NetworkImage(
            'https://www.mnp.ca/-/media/foundation/integrations/personnel/2020/12/16/13/57/personnel-image-4483.jpg?h=800&w=600&hash=9D5E5FCBEE00EB562DCD8AC8FDA8433D',
          ),
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
