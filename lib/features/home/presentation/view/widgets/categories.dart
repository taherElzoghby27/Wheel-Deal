import 'package:cars/core/consts/style.dart';
import 'package:cars/features/home/presentation/view/widgets/category_detail.dart';
import 'package:cars/features/home/presentation/view/widgets/tabs_widget.dart';
import 'package:flutter/cupertino.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //tabs
         TabsWidget(),
         AspectRatio(aspectRatio:  AppConsts.aspectRatioTopSpace),
        //category details
        //if empty
        // const EmptyWidget(
        //   icon: Assets.emptyCart,
        //   title: StringsEn.emptyFavourite,
        //   subTitle: StringsEn.subTitleEmptyFavourite,
        // ),
         CategoryDetails(),
      ],
    );
  }
}
