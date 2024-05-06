import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemSpecification extends StatelessWidget {
  const ItemSpecification({
    super.key,
    required this.ky,
    required this.value,
    required this.icon,
  });

  final String ky;
  final String value;
  final String icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: AppConsts.mainDecoration,
      width: size.width * .275.w,
      child: Padding(
        padding: AppConsts.padding8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HandleImageWidget(image: icon),
            SizedBox(height: size.height * .01),
            Text(
              ky,
              style: AppConsts.style22.copyWith(
                fontSize: 10,
                color: Theme.of(context).canvasColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: size.height * .01),
            Text(
              value,
              style: AppConsts.style12.copyWith(
                fontSize: 10,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
