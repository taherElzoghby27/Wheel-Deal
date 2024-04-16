import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/features/home/presentation/view/widgets/top_leading_trailing.dart';
import 'package:flutter/material.dart';
import 'specifications.dart';

class SpecificationsCarComponent extends StatelessWidget {
  const SpecificationsCarComponent({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: AppConsts.mainPadding,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          TopLeadingTrailing(
            leading: StringsEn.specifications,
          ),
          AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
          Specifications(),
          AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        ],
      ),
    );
  }
}
