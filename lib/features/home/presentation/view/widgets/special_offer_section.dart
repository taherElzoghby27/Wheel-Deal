
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/features/home/presentation/view/widgets/custom_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialOfferSection extends StatefulWidget {
  const SpecialOfferSection({super.key});

  @override
  State<SpecialOfferSection> createState() => _SpecialOfferSectionState();
}

class _SpecialOfferSectionState extends State<SpecialOfferSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title
        Padding(
          padding: AppConsts.mainPadding,
          child: Text(
            StringsEn.specialOffers,
            style: AppConsts.style20.copyWith(color: AppConsts.neutral900),
          ),
        ),
        SizedBox(height: size.height * .01.h),
        //carousel
        const CustomCarousel(),
      ],
    );
  }
}
