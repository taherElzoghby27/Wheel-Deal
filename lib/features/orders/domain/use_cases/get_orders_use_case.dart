import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/orders/domain/repos/order_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/order_model.dart';

class GetOrdersUseCase extends NoParameterUseCase<List<OrderModel>> {
  final OrderRepo _orderRepo;

  GetOrdersUseCase({required OrderRepo orderRepo}) : _orderRepo = orderRepo;

  @override
  Future<Either<FailureServ, List<OrderModel>>> call() async {
    return await _orderRepo.getOrders();
  }
}
