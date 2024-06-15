import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FavouritesRepo {
  Future<Either<FailureServ, void>> addFav({required String carId});

  Future<Either<FailureServ, void>> deleteFav({required String carId});

  Future<Either<FailureServ, List<CarEntity>>> getFav();
}
