import 'dart:convert';
import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/features/home/data/data_sources/local_data_source.dart';
import 'package:cars/features/home/data/data_sources/remote_data_source.dart';
import 'package:cars/features/home/data/models/brand_model.dart';
import 'package:cars/features/home/data/models/car_model.dart';
import 'package:cars/features/home/domain/entities/brand_entity.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/consts/strings.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;

  HomeRepoImpl({
    required HomeRemoteDataSource homeRemoteDataSource,
    required HomeLocalDataSource homeLocalDataSource,
  })  : _homeRemoteDataSource = homeRemoteDataSource,
        _homeLocalDataSource = homeLocalDataSource;

  @override
  Future<Either<FailureServ, List<BrandEntity>>> getTopBrands() {
    return fetchBrands(
      () => _homeLocalDataSource.getTopBrands(),
      () => _homeRemoteDataSource.getTopBrands(),
    );
  }

  @override
  Future<Either<FailureServ, List<CarEntity>>> getBestOffers() {
    return fetchCars(
      () => _homeLocalDataSource.getBestOffers(),
      () => _homeRemoteDataSource.getBestOffers(),
    );
  }

  @override
  Future<Either<FailureServ, List<CarEntity>>> getFavourites() {
    return fetchCars(
      () => _homeLocalDataSource.getFavourites(),
      () => _homeRemoteDataSource.getFavourites(),
    );
  }

  @override
  Future<Either<FailureServ, List<CarEntity>>> getRecommendedForYou() {
    return fetchCars(
      () => _homeLocalDataSource.getRecommendedForYou(),
      () => _homeRemoteDataSource.getRecommendedForYou(),
    );
  }

  Future<Either<FailureServ, List<CarEntity>>> fetchCars(
    List<CarEntity> Function() localDataSourceCall,
    Future<Response> Function() remoteDataSourceCall,
  ) async {
    try {
      final localData = localDataSourceCall();
      if (localData.isNotEmpty) {
        return Right(localData);
      }

      final response = await remoteDataSourceCall();
      if (response.statusCode == 200) {
        debugPrint('very success');
        Map<String, dynamic> data = response.data;
        List<CarEntity> convertedData = convertMapToCarsModel(
          data['data'],
        );
        debugPrint('data after convert : $convertedData');
        // Cache data if needed
        return Right(convertedData);
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

  Future<Either<FailureServ, List<BrandEntity>>> fetchBrands(
    Function() localDataSourceCall,
    Function() remoteDataSourceCall,
  ) async {
    try {
      final localData = localDataSourceCall();
      if (localData.isNotEmpty) {
        return Right(localData);
      }

      final response = await remoteDataSourceCall();
      if (response.statusCode == 200) {
        debugPrint('success');
        Map<String, dynamic> data = response.data;
        List<BrandEntity> convertedData = convertMapToBrandsModel(
          data['data'] as List<Map<String, dynamic>>,
        );
        debugPrint('data after convert:$convertedData');
        // Cache data if needed
        return Right(convertedData);
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
      return Left(ServerFailure(message: error.toString()));
    }
  }

  //convert map to brand models
  List<BrandModel> convertMapToBrandsModel(List<dynamic> data) {
    return List<BrandModel>.from(
      (data).map(
        (e) => BrandModel.fromMap(e),
      ),
    );
  }

  //convert map to car models
  List<CarModel> convertMapToCarsModel(List<dynamic> data) {
    return List<CarModel>.from(
      data.map(
        (car) => CarModel.fromMap(car),
      ),
    );
  }
}
