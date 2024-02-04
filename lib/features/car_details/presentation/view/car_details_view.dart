import 'package:cars/features/car_details/presentation/view/widgets/car_details_body.dart';
import 'package:flutter/material.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CarDetailsBody(),
    );
  }
}
