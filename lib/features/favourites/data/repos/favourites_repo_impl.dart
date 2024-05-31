import 'dart:ffi';

import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:cars/features/favourites/data/data_source/remote_data_source.dart';
import 'package:cars/features/favourites/domain/repos/favourites_repo.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FavouritesRepoImpl extends FavouritesRepo {
  final FavouritesRemoteDataSourceImpl _favouritesRemoteDataSourceImpl;

  FavouritesRepoImpl({
    required FavouritesRemoteDataSourceImpl favouritesRemoteDataSourceImpl,
  }) : _favouritesRemoteDataSourceImpl = favouritesRemoteDataSourceImpl;

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
      final response = await _favouritesRemoteDataSourceImpl.getFav();
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        List<CarEntity> favourites = convertListOfObjectToListOfModels(
          data['data'],
        );

        return Right(favourites);
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

  List<CarEntity> convertListOfObjectToListOfModels(
    List<Map<String, dynamic>> data,
  ) {
    return List.from(
      data.map(
        (e) => CarModel.fromMap(e),
      ),
    );
  }
}
