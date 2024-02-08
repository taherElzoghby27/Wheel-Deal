import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCircleImage extends StatelessWidget {
  const CustomCircleImage({
    super.key,
    required this.image,
    required this.onTap,
  });

  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: size.height * .1.h,
          backgroundImage: NetworkImage(image),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppConsts.neutral700.withOpacity(.7),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            onPressed: onTap,
            icon: const Icon(
              FontAwesomeIcons.penToSquare,
              color: AppConsts.neutral100,
            ),
          ),
        ),
      ],
    );
  }
}
