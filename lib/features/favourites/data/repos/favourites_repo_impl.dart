import 'dart:ffi';
import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:cars/core/services/hive_db/hive_db_cars_home.dart';
import 'package:cars/features/favourites/data/data_source/remote_data_source.dart';
import 'package:cars/features/favourites/domain/repos/favourites_repo.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../data_source/local_data_source.dart';

class FavouritesRepoImpl extends FavouritesRepo {
  final FavouritesRemoteDataSourceImpl _favouritesRemoteDataSourceImpl;
  final FavouritesLocalDataSource _favouritesLocalDataSource;
  final HiveDbCarsHome _hiveDbCarsHome;

  FavouritesRepoImpl({
    required FavouritesRemoteDataSourceImpl favouritesRemoteDataSourceImpl,
    required FavouritesLocalDataSource favouritesLocalDataSource,
    required HiveDbCarsHome hiveDbCarsHome,
  })  : _favouritesRemoteDataSourceImpl = favouritesRemoteDataSourceImpl,
        _favouritesLocalDataSource = favouritesLocalDataSource,
        _hiveDbCarsHome = hiveDbCarsHome;

  @override
  Future<Either<FailureServ, void>> addFav({required int carId}) async {
    try {
      final response = await _favouritesRemoteDataSourceImpl.addFav(
        carId: carId,
      );
      if (response.statusCode == 200) {
        return const Right(Void);
      } else {
        return Left(
          ServerFailure.fromDioResponse(
            response.statusCode!,
            response.data,
          ),
        );
      }
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }

  @override
  Future<Either<FailureServ, void>> deleteFav({required int carId}) async {
    try {
      final response = await _favouritesRemoteDataSourceImpl.deleteFav(
        carId: carId,
      );
      if (response.statusCode == 200) {
        return const Right(Void);
      } else {
        return Left(
          ServerFailure.fromDioResponse(
            response.statusCode!,
            response.data,
          ),
        );
      }
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
      final response = await _favouritesRemoteDataSourceImpl.getFav();

      if (response.statusCode == 200) {
        debugPrint("data : ${response.data}");
        return _getFavSuccess(response, localFavourites);
      } else {
        return Left(
          ServerFailure.fromDioResponse(
            response.statusCode!,
            response.data,
          ),
        );
      }
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }

  Right<FailureServ, List<CarEntity>> _getFavSuccess(
    Response<dynamic> response,
    List<CarEntity> localFavourites,
  ) {
    Map<String, dynamic> data = response.data;
    List<CarEntity> favourites = convertListOfObjectToListOfModels(
      data['data'],
    );
    // Check if local and remote are in sync
    if (localFavourites.isNotEmpty &&
        localFavourites.length == favourites.length) {
      return Right(localFavourites);
    }
    //save data in local
    _hiveDbCarsHome.saveCars(
      boxName: StringsEn.kFavourites,
      cars: favourites,
    );

    return Right(favourites);
  }


}
