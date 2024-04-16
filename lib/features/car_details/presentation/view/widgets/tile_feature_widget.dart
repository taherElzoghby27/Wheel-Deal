import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_divider.dart';

class TileFeaturePropertyWidget extends StatelessWidget {
  const TileFeaturePropertyWidget({
    super.key,
    required this.ke,
    required this.value,
  });

  final String ke;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppConsts.padding4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ke,
                style: AppConsts.style16.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).canvasColor,
                ),
              ),
              Icon(
                value ? Icons.done : Icons.close,
                color: AppConsts.mainColor,
              ),
            ],
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
