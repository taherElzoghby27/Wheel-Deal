import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetFavouritesUseCase extends BaseUseCase<List<CarEntity>, int> {
  final HomeRepo _homeRepo;

  GetFavouritesUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;

  @override
  Future<Either<FailureServ, List<CarEntity>>> call(int parameter) async {
    return await _homeRepo.getFavourites(page: parameter);
  }
}
