import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:cars/core/widgets/custom_circle_button.dart';
import 'package:cars/features/home/presentation/view/widgets/categories_section.dart';
import 'package:cars/features/home/presentation/view/widgets/special_offer_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'search_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //custom appBar
        CustomAppBar(
          title: StringsEn.home,
          color: AppConsts.mainColor,
          trailingWidget: CustomSquareButton(
            icon: Icons.notifications,
            color: AppConsts.neutral100.withOpacity(.05),
            onTap: () => GoRouter.of(context).push(favouritesPath),
          ),
        ),

        //search section
        const SearchSection(),
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        //special offer section
        const SpecialOfferSection(),
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        //categories section
        const CategoriesSection(),
      ],
    );
  }
}
