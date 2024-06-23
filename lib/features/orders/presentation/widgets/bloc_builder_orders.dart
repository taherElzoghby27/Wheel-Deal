import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/empty_widget.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:cars/features/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/consts/assets.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/small_loading_widget.dart';
import '../manager/order_cubit.dart';
import 'orders.dart';

class BlocBuilderOrders extends StatelessWidget {
  const BlocBuilderOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state.deleteOrderState == RequestState.failure) {
          showSnack(
            context,
            message: state.failureDeleteOrderMessage,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        if (state.getOrdersState == RequestState.loaded ||
            state.deleteOrderState == RequestState.loaded) {
          List<OrderModel> ordersList = context.read<OrderCubit>().orders;
          return ordersList.isEmpty
              ? const EmptyWidget(icon: Assets.orderAsset)
              : Orders(orders: ordersList);
        } else if (state.getOrdersState == RequestState.failure) {
          return SomeThingErrorWidget(
            message: state.failureGetOrderMessage,
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
