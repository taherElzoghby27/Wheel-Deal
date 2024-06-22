import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/empty_widget.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
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
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state.getOrdersState == RequestState.loaded) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
              //orders car
              state.orders.isEmpty
                  ? const EmptyWidget(icon: Assets.orderAsset)
                  : Orders(orders: state.orders),
            ],
          );
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
