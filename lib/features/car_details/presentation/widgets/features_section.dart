import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:cars/features/home/presentation/widgets/top_leading_trailing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'box_decortaion_widget.dart';
import 'tile_feature_widget.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({
    super.key,
    required this.carModel,
  });

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          TopLeadingTrailing(
            leading: StringsEn.features,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
          //details
          BoxDecorationWidget(
            widget: Column(
              children: listOfFeatures(carModel)
                  .map(
                    (e) => TileFeaturePropertyWidget(
                      ke: e.key,
                      value: e.value,
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: size.height * .015.h),
        ],
      ),
    );
  }
}
