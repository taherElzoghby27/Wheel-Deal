import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/orders/domain/repos/order_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteOrderUseCase extends BaseUseCase<String, String> {
  final OrderRepo _orderRepo;

  DeleteOrderUseCase({required OrderRepo orderRepo}) : _orderRepo = orderRepo;

  @override
  Future<Either<FailureServ, String>> call(String parameter) async {
    return await _orderRepo.deleteOrder(
      carId: parameter,
    );
  }
}
