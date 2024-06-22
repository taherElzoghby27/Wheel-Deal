import 'package:bloc/bloc.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:cars/features/orders/data/models/order_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/use_cases/add_order_use_case.dart';
import '../../domain/use_cases/delete_order_use_case.dart';
import '../../domain/use_cases/get_orders_use_case.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final GetOrdersUseCase _getOrdersUseCase;
  final AddOrderUseCase _addOrderUseCase;
  final DeleteOrderUseCase _deleteOrderUseCase;

  OrderCubit(
    this._getOrdersUseCase,
    this._addOrderUseCase,
    this._deleteOrderUseCase,
  ) : super(const OrderState());
  List<OrderModel> orders = [];

  addOrder(String carId) async {
    emit(
      state.copyWith(
        addOrderState: RequestState.loading,
      ),
    );
    await _addOrderUseCase.call(carId).then(
          (value) => value.fold(
            (failure) {
              emit(
                state.copyWith(
                  addOrderState: RequestState.failure,
                  failureAddOrderMessage: failure.message,
                ),
              );
            },
            (success) {
              emit(
                state.copyWith(
                  addOrderState: RequestState.loaded,
                  resultAddOrder: success,
                ),
              );
            },
          ),
        );
  }

  deleteOrder(OrderModel order) async {
    emit(
      state.copyWith(
        deleteOrderState: RequestState.loading,
      ),
    );
    await _deleteOrderUseCase.call(order.carId).then(
          (value) => value.fold(
            (failure) {
              emit(
                state.copyWith(
                  deleteOrderState: RequestState.failure,
                  failureDeleteOrderMessage: failure.message,
                ),
              );
            },
            (success)  {
              removeFromList(order);
              emit(
                state.copyWith(
                  deleteOrderState: RequestState.loaded,
                  resultDeleteOrder: success,
                ),
              );
            },
          ),
        );
  }

  getOrders() async {
    emit(
      state.copyWith(
        getOrdersState: RequestState.loading,
      ),
    );
    await _getOrdersUseCase.call().then(
          (value) => value.fold(
            (failure) {
              emit(
                state.copyWith(
                  getOrdersState: RequestState.failure,
                  failureGetOrderMessage: failure.message,
                ),
              );
            },
            (success) {
              orders = success;
              emit(
                state.copyWith(
                  getOrdersState: RequestState.loaded,
                  orders: success,
                ),
              );
            },
          ),
        );
  }

  removeFromList(OrderModel order) {
    orders.removeWhere((item) => item.carId == order.carId);
  }
}
