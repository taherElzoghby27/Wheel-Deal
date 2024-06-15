import 'dart:ffi';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/features/favourites/data/data_source/remote_data_source.dart';
import 'package:cars/features/favourites/domain/repos/favourites_repo.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../data_source/local_data_source.dart';

class FavouritesRepoImpl extends FavouritesRepo {
  final FavouritesRemoteDataSource _favouritesRemoteDataSource;
  final FavouritesLocalDataSource _favouritesLocalDataSource;

  FavouritesRepoImpl({
    required FavouritesRemoteDataSource favouritesRemoteDataSource,
    required FavouritesLocalDataSource favouritesLocalDataSource,
  })  : _favouritesRemoteDataSource = favouritesRemoteDataSource,
        _favouritesLocalDataSource = favouritesLocalDataSource;

  @override
  Future<Either<FailureServ, void>> addFav({required String carId}) async {
    try {
      await _favouritesRemoteDataSource.addFav(
        carId: carId,
      );
      return const Right(Void);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }

  @override
  Future<Either<FailureServ, void>> deleteFav({required String carId}) async {
    try {
      await _favouritesRemoteDataSource.deleteFav(
        carId: carId,
      );
      return const Right(Void);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }

  @override
  Future<Either<FailureServ, List<CarEntity>>> getFav() async {
    try {
      final localFavourites = _favouritesLocalDataSource.getFavourites();
      final favourites = await _favouritesRemoteDataSource.getFav();
      // Check if local and remote are in sync
      if (localFavourites.isNotEmpty &&
          localFavourites.length == favourites.length) {
        return Right(localFavourites);
      }
      return Right(favourites);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }
}
