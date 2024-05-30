import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FavouritesRepo {
  Future<Either<FailureServ, void>> addFav({required int carId});

  Future<Either<FailureServ, void>> deleteFav({required int carId});

  Future<Either<FailureServ, List<CarEntity>>> getFav();
}
