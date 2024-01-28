import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:cars/features/home/presentation/view/widgets/categories_section.dart';
import 'package:cars/features/home/presentation/view/widgets/search_location_section.dart';
import 'package:cars/features/home/presentation/view/widgets/special_offer_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          ///custom appBar
          CustomAppBar(
            image: Assets.imagesLogo,
            title: StringsEn.logo,
            trailingOnTap: () {},
            trailingWidget: const Icon(
              Icons.favorite_outline,
              color: AppConsts.primary300,
            ),
          ),

          //search section
          const SearchLocationSection(),
          //special offer section
          const SpecialOfferSection(),
          //categories section
          const CategoriesSection(),
        ],
      ),
    );
  }
}
