import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/core/helper/use_case.dart';
import 'package:cars/features/home/domain/entities/previous_car_entity.dart';
import 'package:cars/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class PreviousCarUseCase
    extends BaseUseCase<String, PreviousCarEntity> {
  final HomeRepo _homeRepo;

  PreviousCarUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;

  @override
  Future<Either<FailureServ, String>> call(
    PreviousCarEntity parameter,
  ) async {
    return await _homeRepo.previousCar(previousCar: parameter);
  }
}
