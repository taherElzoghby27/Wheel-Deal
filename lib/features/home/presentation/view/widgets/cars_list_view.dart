
import 'package:flutter/material.dart';

import '../../../../../core/widgets/car_component.dart';

class CarsListView extends StatelessWidget {
  const CarsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const CarComponent();
      },
      itemCount: 10,
    );
  }
}
