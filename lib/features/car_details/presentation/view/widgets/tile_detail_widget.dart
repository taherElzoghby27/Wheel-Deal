import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_divider.dart';

class TileDetailPropertyWidget extends StatelessWidget {
  const TileDetailPropertyWidget({
    super.key,
    required this.ke,
    required this.value,
  });

  final String ke;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ke,
              style: AppConsts.style16.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              value,
              style: AppConsts.style16,
            ),
          ],
        ),
        const CustomDivider(),
      ],
    );
  }
}
