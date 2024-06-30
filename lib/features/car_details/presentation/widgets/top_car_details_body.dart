import 'package:cars/core/helper/methods.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:flutter/material.dart';

import 'features_section.dart';
import 'section_details.dart';
import 'section_image.dart';
import 'specifications_car_component.dart';

class TopCarDetailsBody extends StatelessWidget {
  const TopCarDetailsBody({
    super.key,
    required this.carModel,
  });

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SectionDetails(
            leading: carModel.title,
            trailing:'EGP ${handlePrice(carModel.priceCar)}',
          ),
          //Section image
          SectionImages(carModel: carModel),
          //specifications
          SpecificationsCarComponent(carModel: carModel),
          //features
          FeaturesSection(carModel: carModel),
        ],
      ),
    );
  }
}
