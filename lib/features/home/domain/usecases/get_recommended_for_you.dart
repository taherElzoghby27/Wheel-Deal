import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/core/helper/use_case.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetRecommendedForYouUseCase extends BaseUseCase<List<CarEntity>, int> {
  final HomeRepo _homeRepo;

  GetRecommendedForYouUseCase({required HomeRepo homeRepo})
      : _homeRepo = homeRepo;

  @override
  Future<Either<FailureServ, List<CarEntity>>> call(int parameter) async {
    return await _homeRepo.getRecommendedForYou(page: parameter);
  }
}
