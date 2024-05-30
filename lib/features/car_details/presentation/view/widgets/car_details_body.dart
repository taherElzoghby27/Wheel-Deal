import 'package:cars/core/consts/style.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:flutter/material.dart';

import 'section_add_to_orders.dart';
import 'top_car_details_body.dart';

class CarDetailsBody extends StatelessWidget {
  const CarDetailsBody({super.key, required this.carModel});

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopCarDetailsBody(carModel: carModel),
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        //add to orders
        const SectionAddToOrders(),
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
      ],
    );
  }
}
