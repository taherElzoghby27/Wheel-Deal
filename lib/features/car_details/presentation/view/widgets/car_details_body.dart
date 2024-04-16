import 'package:cars/core/consts/style.dart';
import 'package:cars/features/car_details/presentation/view/widgets/section_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'features_section.dart';
import 'section_add_to_orders.dart';
import 'specifications_car_component.dart';
import 'section_details.dart';

class CarDetailsBody extends StatelessWidget {
  const CarDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              SectionDetails(
                leading: 'BMW 320i M',
                trailing: 'EGP 2,500,000',
              ),
              //Section image
              SectionImages(),
              //specifications
              SpecificationsCarComponent(),
              //features
              FeaturesSection(),
            ],
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        //add to orders
        const SectionAddToOrders(),
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
      ],
    );
  }
}
