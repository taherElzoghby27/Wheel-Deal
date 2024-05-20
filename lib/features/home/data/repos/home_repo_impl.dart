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
  Future<Either<FailureServ, List<BrandEntity>>> getTopBrands() async {
    return fetchData<BrandEntity>(
      () => _homeLocalDataSource.getTopBrands(),
      () async => await _homeRemoteDataSource.getTopBrands(),
      (_) => convertMapToBrandsModel as List<BrandEntity>,
    );
  }

  @override
  Future<Either<FailureServ, List<CarEntity>>> getBestOffers() async {
    return fetchData<CarEntity>(
      () => _homeLocalDataSource.getBestOffers(),
      () async => await _homeRemoteDataSource.getBestOffers(),
      (_) => convertMapToCarsModel as List<CarEntity>,
    );
  }

  @override
  Future<Either<FailureServ, List<CarEntity>>> getFavourites() async {
    return fetchData<CarEntity>(
      () => _homeLocalDataSource.getFavourites(),
      () async => await _homeRemoteDataSource.getFavourites(),
      (_) => convertMapToCarsModel as List<CarEntity>,
    );
  }

  @override
  Future<Either<FailureServ, List<CarEntity>>> getRecommendedForYou() async {
    return fetchData<CarEntity>(
      () => _homeLocalDataSource.getRecommendedForYou(),
      () async => await _homeRemoteDataSource.getRecommendedForYou(),
      (_) => convertMapToCarsModel as List<CarEntity>,
    );
  }

  Future<Either<FailureServ, List<T>>> fetchData<T>(
    List<T> Function() localDataSourceCall,
    Future<Response> Function() remoteDataSourceCall,
    List<T> Function(List<Map<String, dynamic>>) convertData,
  ) async {
    try {
      final localData = localDataSourceCall();
      if (localData.isNotEmpty) {
        return Right(localData);
      }

      final response = await remoteDataSourceCall();
      if (response.statusCode == 200) {
        debugPrint('success:');
        dynamic data = jsonDecode(response.data);
        debugPrint('data after json:$data');
        List<T> convertedData = convertData(data['data']);
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
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }

  //convert map to brand models
  List<BrandEntity> convertMapToBrandsModel(List<Map<String, dynamic>> data) {
    return List<BrandModel>.from(
      (data).map(
        (e) => BrandModel.fromMap(e),
      ),
    );
  }

  //convert map to car models
  List<CarEntity> convertMapToCarsModel(List<Map<String, dynamic>> data) {
    return List<CarModel>.from(
      (data).map(
        (e) => CarModel.fromMap(e),
      ),
    );
  }
}
