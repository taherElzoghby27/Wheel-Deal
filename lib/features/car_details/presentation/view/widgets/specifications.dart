import 'package:cars/core/consts/data.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:flutter/material.dart';

import 'item_specification.dart';

class Specifications extends StatelessWidget {
  const Specifications({super.key, required this.carModel});

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        runSpacing: 10,
        spacing: 7,
        children: listOfSpecification(carModel)
            .map(
              (e) => ItemSpecification(
                ky: e.key,
                value: e.value,
                icon: e.icon,
              ),
            )
            .toList(),
      ),
    );
  }
}
