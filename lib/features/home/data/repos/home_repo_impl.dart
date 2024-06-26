import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/services/hive_db/hive_db_brands_home.dart';
import 'package:cars/core/services/hive_db/hive_db_cars_home.dart';
import 'package:cars/features/home/data/data_sources/local_data_source.dart';
import 'package:cars/features/home/data/data_sources/remote_data_source.dart';
import 'package:cars/features/home/data/models/brand_model.dart';
import 'package:cars/features/home/domain/entities/brand_entity.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/domain/entities/previous_car_entity.dart';
import 'package:cars/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/consts/strings.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;
  final HiveDbCarsHome _hiveDbCarsHome;
  final HiveDbBrandsHome _hiveDbBrandsHome;

  HomeRepoImpl({
    required HomeRemoteDataSource homeRemoteDataSource,
    required HomeLocalDataSource homeLocalDataSource,
    required HiveDbCarsHome hiveDbCarsHome,
    required HiveDbBrandsHome hiveDbBrandsHome,
  })  : _homeRemoteDataSource = homeRemoteDataSource,
        _homeLocalDataSource = homeLocalDataSource,
        _hiveDbCarsHome = hiveDbCarsHome,
        _hiveDbBrandsHome = hiveDbBrandsHome;

  @override
  Future<Either<FailureServ, List<BrandEntity>>> getTopBrands({
    required int page,
  }) {
    return fetchBrands(
      () => _homeLocalDataSource.getTopBrands(page: page),
      () => _homeRemoteDataSource.getTopBrands(page: page),
    );
  }

  @override
  Future<Either<FailureServ, List<CarEntity>>> getBestOffers({
    required int page,
  }) {
    return fetchCars(
      () => _homeLocalDataSource.getBestOffers(page: page),
      () => _homeRemoteDataSource.getBestOffers(page: page),
      boxName: StringsEn.kBestOffers,
    );
  }

  @override
  Future<Either<FailureServ, List<CarEntity>>> getRecommendedForYou({
    required int page,
  }) {
    return fetchCars(
      () => _homeLocalDataSource.getRecommendedForYou(page: page),
      () => _homeRemoteDataSource.getRecommendedForYou(page: page),
      boxName: StringsEn.kRecommendedForYou,
    );
  }

//fetch cars (best offers , recommended for you , favourites) from api
  Future<Either<FailureServ, List<CarEntity>>> fetchCars(
    List<CarEntity> Function() localDataSourceCall,
    Future<Response> Function() remoteDataSourceCall, {
    required String boxName,
  }) async {
    try {
      final localData = localDataSourceCall();
      if (localData.isNotEmpty) {
        return Right(localData);
      }

      final response = await remoteDataSourceCall();
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        List<CarEntity> convertedData = convertListOfObjectToListOfModels(
          data['data'],
        );
        //save cars in local
        _hiveDbCarsHome.saveCars(
          boxName: boxName,
          cars: convertedData,
        );
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
        Map<String, dynamic> data = response.data;
        List<BrandEntity> convertedData = convertMapToBrandsModel(
          data['data'],
        );
        //save brand in local
        _hiveDbBrandsHome.saveBrands(brands: convertedData);
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
  List<BrandModel> convertMapToBrandsModel(List<dynamic> data) {
    return List<BrandModel>.from(
      (data).map(
        (e) => BrandModel.fromMap(e),
      ),
    );
  }

  @override
  Future<Either<FailureServ, List<PreviousCarEntity>>> getModelBrand({
    required String brand,
  }) async {
    try {
      final response = await _homeRemoteDataSource.getModelBrand(
        brand: brand,
      );
      return Right(response);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }

  @override
  Future<Either<FailureServ, String>> previousCar({
    required PreviousCarEntity previousCar,
  }) async {
    try {
      final response = await _homeRemoteDataSource.previousCar(
        previousCar: previousCar,
      );
      return Right(response);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }

  @override
  Future<Either<FailureServ, String>> userInfo({
    required String income,
  }) async {
    try {
      final response = await _homeRemoteDataSource.userInfo(
        income: income,
      );
      return Right(response);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(message: StringsEn.errorMessage));
    }
  }
}
