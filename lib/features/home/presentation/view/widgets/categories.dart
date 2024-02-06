import 'package:cars/features/home/presentation/view/widgets/category_detail.dart';
import 'package:cars/features/home/presentation/view/widgets/tabs_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        //tabs
        const TabsWidget(),
        const AspectRatio(aspectRatio:  AppConsts.aspectRatioTopSpace),
        //category details
        //if empty
        // const EmptyWidget(
        //   icon: Assets.emptyCart,
        //   title: StringsEn.emptyFavourite,
        //   subTitle: StringsEn.subTitleEmptyFavourite,
        // ),
        const CategoryDetails(),
      ],
    );
  }
}
