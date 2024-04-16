import 'package:cars/core/consts/style.dart';
import 'package:cars/features/orders/presentation/view/widgets/orders.dart';
import 'package:flutter/material.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          //orders car
          Orders(),
        ],
      ),
    );
  }
}
