import 'package:cars/features/car_details/presentation/view/widgets/section_image.dart';
import 'package:flutter/material.dart';
import 'details_car_component.dart';

class CarDetailsBody extends StatelessWidget {
  const CarDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        //Section image
        SectionImage(),
        //details
        DetailsCarComponent(),
      ],
    );
  }
}
