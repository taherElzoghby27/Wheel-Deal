import 'package:cars/features/orders/presentation/view/widgets/orders_body.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrdersBody(),
    );
  }
}
