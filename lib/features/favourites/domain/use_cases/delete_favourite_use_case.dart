import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/usecases/use_case.dart';
import 'package:cars/features/favourites/domain/repos/favourites_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteFavUseCase extends BaseUseCase<void, int> {
  final FavouritesRepo _favouritesRepo;

  DeleteFavUseCase({required FavouritesRepo favouritesRepo})
      : _favouritesRepo = favouritesRepo;

  @override
  Future<Either<FailureServ, void>> call(int parameter) async {
    return await _favouritesRepo.deleteFav(carId: parameter);
  }
}
