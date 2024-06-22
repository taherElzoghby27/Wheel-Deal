part of 'order_cubit.dart';

class OrderState extends Equatable {
  final RequestState getOrdersState;
  final List<OrderModel> orders;
  final String failureGetOrderMessage;
  final RequestState addOrderState;
  final String resultAddOrder;
  final String failureAddOrderMessage;
  final RequestState deleteOrderState;
  final String resultDeleteOrder;
  final String failureDeleteOrderMessage;

  const OrderState({
    this.getOrdersState = RequestState.initial,
    this.orders = const [],
    this.failureGetOrderMessage = 'No data',
    this.addOrderState = RequestState.initial,
    this.resultAddOrder = 'No Data',
    this.failureAddOrderMessage = 'No data',
    this.deleteOrderState = RequestState.initial,
    this.resultDeleteOrder = 'No Data',
    this.failureDeleteOrderMessage = 'No data',
  });

  OrderState copyWith({
    RequestState? getOrdersState,
    List<OrderModel>? orders,
    String? failureGetOrderMessage,
    RequestState? addOrderState,
    String? resultAddOrder,
    String? failureAddOrderMessage,
    RequestState? deleteOrderState,
    String? resultDeleteOrder,
    String? failureDeleteOrderMessage,
  }) {
    return OrderState(
      getOrdersState: getOrdersState ?? this.getOrdersState,
      orders: orders ?? this.orders,
      failureGetOrderMessage:
          failureGetOrderMessage ?? this.failureGetOrderMessage,
      addOrderState: addOrderState ?? this.addOrderState,
      resultAddOrder: resultAddOrder ?? this.resultAddOrder,
      failureAddOrderMessage:
          failureAddOrderMessage ?? this.failureAddOrderMessage,
      deleteOrderState: deleteOrderState ?? this.deleteOrderState,
      resultDeleteOrder: resultDeleteOrder ?? this.resultDeleteOrder,
      failureDeleteOrderMessage:
          failureDeleteOrderMessage ?? this.failureDeleteOrderMessage,
    );
  }

  @override
  List<Object?> get props => [
        getOrdersState,
        orders,
        failureGetOrderMessage,
        addOrderState,
        resultAddOrder,
        failureAddOrderMessage,
        deleteOrderState,
        resultDeleteOrder,
        failureDeleteOrderMessage,
      ];
}
