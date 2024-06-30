import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/core/helper/use_case.dart';
import 'package:cars/features/car_details/data/models/installment_model.dart';
import 'package:dartz/dartz.dart';
import '../repos/car_details_repo.dart';

class GetInstallmentAvailableUseCase
    extends BaseUseCase<List<InstallmentAvailableModel>, int> {
  final CarDetailsRepo _carDetailsRepo;

  GetInstallmentAvailableUseCase({required CarDetailsRepo carDetailsRepo})
      : _carDetailsRepo = carDetailsRepo;

  @override
  Future<Either<FailureServ, List<InstallmentAvailableModel>>> call(
    int parameter,
  ) async {
    return await _carDetailsRepo.getInstallmentAvailable(
      carId: parameter,
    );
  }
}
