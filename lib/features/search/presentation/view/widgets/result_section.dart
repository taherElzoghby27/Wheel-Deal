import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/presentation/view/widgets/best_offers_bloc_consumer_grid_view.dart';

class SectionResult extends StatelessWidget {
  const SectionResult({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * .04.h,
          child: TileWidget(
            label: "${StringsEn.featuring} 23 ${StringsEn.cars}",
          ),
        ),

        ///searching cars
        const BestOffersBlocConsumer(),
      ],
    );
  }
}
