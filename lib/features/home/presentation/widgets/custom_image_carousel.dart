import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/handle_custom_image.dart';

class CustomImageCarousel extends StatelessWidget {
  const CustomImageCarousel({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: AppConsts.decoration,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CustomImage(
          image: image,
          size: size,
        ),
      ),
    );
  }
}
