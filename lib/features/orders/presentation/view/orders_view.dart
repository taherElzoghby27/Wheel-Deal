import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/features/orders/presentation/view/widgets/orders_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/consts/strings.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarScaffold(
        title: StringsEn.orders,
      ),
      body: OrdersBody(),
    );
  }
}
