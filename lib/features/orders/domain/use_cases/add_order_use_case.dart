import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/core/helper/use_case.dart';
import 'package:cars/features/orders/domain/repos/order_repo.dart';
import 'package:dartz/dartz.dart';

class AddOrderUseCase extends BaseUseCase<String, String> {
  final OrderRepo _orderRepo;

  AddOrderUseCase({required OrderRepo orderRepo}) : _orderRepo = orderRepo;

  @override
  Future<Either<FailureServ, String>> call(String parameter) async {
    return await _orderRepo.addOrder(
      carId: parameter,
    );
  }
}
