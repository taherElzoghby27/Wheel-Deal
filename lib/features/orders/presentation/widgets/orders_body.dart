import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

import 'bloc_builder_orders.dart';
import 'checkout_orders.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: const Column(
        children: [
          Expanded(
            child: BlocBuilderOrders(),
          ),
          AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          //add to orders
          CheckOutOrders(),
          AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        ],
      ),
    );
  }
}
