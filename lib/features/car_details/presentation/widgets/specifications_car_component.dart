import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:flutter/material.dart';
import '../../../home/presentation/widgets/top_leading_trailing.dart';
import 'specifications.dart';

class SpecificationsCarComponent extends StatelessWidget {
  const SpecificationsCarComponent({
    super.key,
    required this.carModel,
  });

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          const TopLeadingTrailing(
            leading: StringsEn.specifications,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
          Specifications(carModel: carModel),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        ],
      ),
    );
  }
}
