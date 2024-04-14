import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/style.dart';
import '../../../../favourites/presentation/view/widgets/brands_detail.dart';

class BestOffersBody extends StatelessWidget {
  const BestOffersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const AspectRatio(aspectRatio:  AppConsts.aspectRatioTopSpace),
          CustomAppBar(
            leadingOnTap: () => GoRouter.of(context).pop(),
            title: StringsEn.bestOffers,
            trailingWidget: Container(),
          ),
          const AspectRatio(aspectRatio:  AppConsts.aspectRatioTopSpace),
          //favourites car

          const BrandsDetails(),
        ],
      ),
    );
  }
}
