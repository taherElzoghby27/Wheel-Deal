import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/favourites/domain/repos/favourites_repo.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:dartz/dartz.dart';

class GetFavouritesUseCase extends NoParameterUseCase<List<CarEntity>> {
  final FavouritesRepo _favouritesRepo;

  GetFavouritesUseCase({required FavouritesRepo favouritesRepo})
      : _favouritesRepo = favouritesRepo;

  @override
  Future<Either<FailureServ, List<CarEntity>>> call() async {
    return await _favouritesRepo.getFav();
  }
}
