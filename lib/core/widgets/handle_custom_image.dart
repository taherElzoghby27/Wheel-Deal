import 'package:cars/core/helper/handle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
    required this.size,
  });

  final String image;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return handleImage(
      image: image,
      width: size.width * .9.w,
    );
  }
}
