import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../home/presentation/view/widgets/category_detail.dart';

class FavouritesBody extends StatelessWidget {
  const FavouritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: size.height * .02.h),
          CustomAppBar(
            leadingOnTap: () => GoRouter.of(context).pop(),
            title: StringsEn.favourites,
            trailingWidget: Container(),
          ),
          SizedBox(height: size.height * .02.h),
          //favourites car

          const CategoryDetails(),
        ],
      ),
    );
  }
}
