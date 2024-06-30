import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/core/helper/use_case.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetBestOffersUseCase extends BaseUseCase<List<CarEntity>, int> {
  final HomeRepo _homeRepo;

  GetBestOffersUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;

  @override
  Future<Either<FailureServ, List<CarEntity>>> call(int parameter) async {
    return await _homeRepo.getBestOffers(page: parameter);
  }
}
