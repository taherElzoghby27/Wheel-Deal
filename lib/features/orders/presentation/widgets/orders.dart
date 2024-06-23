import 'package:cars/features/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';

import 'order_component.dart';

class Orders extends StatelessWidget {
  const Orders({super.key, required this.orders});

  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderComponent(
          order: orders[index],
        );
      },
    );
  }
}
