import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_notification_top_home.dart';
import 'search_section.dart';
import 'section_best_offers.dart';
import 'section_recommended_for_you.dart';
import 'top_brands_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        //custom appBar
        CustomAppBar(
          title: StringsEn.home,
          color: AppConsts.mainColor,
          trailingWidget: CustomNotificationTopHome(),
        ),

        //search section
        SearchSection(),
        AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        //top brands
        SectionTopBrands(),
        AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        //Best Offers
        SectionBestOffers(),
        AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        //Recommended for you
        SectionRecommendedForYou(),
      ],
    );
  }
}
