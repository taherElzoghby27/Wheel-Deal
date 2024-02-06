import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:cars/features/orders/presentation/view/widgets/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

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
            leadingOnTap: () => GoRouter.of(context).pushReplacement(navPath),
            title: StringsEn.orders,
            trailingWidget: Container(),
          ),
          SizedBox(height: size.height * .02.h),
          //favourites car

          const Orders(),
        ],
      ),
    );
  }
}
