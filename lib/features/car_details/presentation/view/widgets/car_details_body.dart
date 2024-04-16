import 'package:cars/features/car_details/presentation/view/widgets/section_image.dart';
import 'package:flutter/material.dart';
import 'details_car_component.dart';
import 'section_details.dart';

class CarDetailsBody extends StatelessWidget {
  const CarDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        SectionDetails(
          leading: 'BMW 320i M',
          trailing: 'EGP 2,500,000',
        ),
        //Section image
        SectionImages(),
        //details
        DetailsCarComponent(),
      ],
    );
  }
}
