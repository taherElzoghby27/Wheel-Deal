import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/features/orders/data/models/order_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderRepo {
  //get orders
  Future<Either<FailureServ, List<OrderModel>>> getOrders();

  //add order
  Future<Either<FailureServ, String>> addOrder({
    required String carId,
  });

  //delete order
  Future<Either<FailureServ, String>> deleteOrder({
    required String carId,
  });
}
