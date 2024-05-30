import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import '../repos/car_details_repo.dart';

class GetCarDetailsUseCase extends BaseUseCase<CarModel, int> {
  final CarDetailsRepo _carDetailsRepo;

  GetCarDetailsUseCase({required CarDetailsRepo carDetailsRepo})
      : _carDetailsRepo = carDetailsRepo;

  @override
  Future<Either<FailureServ, CarModel>> call(int parameter) async {
    return await _carDetailsRepo.getDetailsCar(carId: parameter);
  }
}
