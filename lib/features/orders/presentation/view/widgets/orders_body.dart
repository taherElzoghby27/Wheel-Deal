import 'package:cars/core/consts/style.dart';
import 'package:cars/features/orders/presentation/view/widgets/orders.dart';
import 'package:flutter/material.dart';

import 'checkout_orders.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
                //orders car
                Orders(),
              ],
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          //add to orders
          const CheckOutOrders(),
          const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        ],
      ),
    );
  }
}
