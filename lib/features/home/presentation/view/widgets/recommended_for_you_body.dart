import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:cars/features/favourites/presentation/view/widgets/brands_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';


class RecommendedForyouBody extends StatelessWidget {
  const RecommendedForyouBody({super.key});

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
            title: StringsEn.recommendedForYou,
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
