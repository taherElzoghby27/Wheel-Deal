import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/home/domain/entities/previous_car_entity.dart';
import 'package:cars/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetModelBrandUseCase extends BaseUseCase<PreviousCarEntity, String> {
  final HomeRepo _homeRepo;

  GetModelBrandUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;

  @override
  Future<Either<FailureServ, PreviousCarEntity>> call(String parameter) async {
    return await _homeRepo.getModelBrand(brand: parameter);
  }
}
