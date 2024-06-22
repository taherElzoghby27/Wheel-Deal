import 'package:cars/core/services/service_locator.dart';
import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/features/orders/data/repos/order_repo_impl.dart';
import 'package:cars/features/orders/domain/use_cases/add_order_use_case.dart';
import 'package:cars/features/orders/domain/use_cases/delete_order_use_case.dart';
import 'package:cars/features/orders/domain/use_cases/get_orders_use_case.dart';
import 'package:cars/features/orders/presentation/manager/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/consts/strings.dart';
import '../widgets/orders_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarScaffold(
        title: StringsEn.orders,
      ),
      body: BlocProvider(
        create: (_) => OrderCubit(
          GetOrdersUseCase(
            orderRepo: getIt.get<OrderRepoImpl>(),
          ),
          AddOrderUseCase(
            orderRepo: getIt.get<OrderRepoImpl>(),
          ),
          DeleteOrderUseCase(
            orderRepo: getIt.get<OrderRepoImpl>(),
          ),
        ),
        child: const SafeArea(
          child: OrdersBody(),
        ),
      ),
    );
  }
}
