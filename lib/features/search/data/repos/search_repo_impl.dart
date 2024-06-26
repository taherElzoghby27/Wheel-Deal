import 'dart:ffi';
import 'package:cars/core/helper/methods.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/networking/failure_message.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/search/data/data_source/search_remote_data_source.dart';
import 'package:cars/features/search/data/models/recent_search_model.dart';
import 'package:cars/features/search/domain/entities/search_entity.dart';
import 'package:cars/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource _searchRemoteDataSource;

  SearchRepoImpl({
    required SearchRemoteDataSource searchRemoteDataSource,
  }) : _searchRemoteDataSource = searchRemoteDataSource;

  @override
  Future<Either<FailureServ, List<RecentSearchModel>>> recentSearch() async {
    try {
      final response = await _searchRemoteDataSource.recentSearch();

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        List<RecentSearchModel> recentSearchCars = convertMapsToRecentSearch(
          data['data'],
        );

        return Right(recentSearchCars);
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
  Future<Either<FailureServ, List<CarEntity>>> search({
    required String searchWord,
  }) async {
    try {
      final response = await _searchRemoteDataSource.search(
        searchWord: searchWord,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        List<CarEntity> cars = convertListOfObjectToListOfModels(
          data['data'],
        );

        return Right(cars);
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
  Future<Either<FailureServ, void>> deleteRecentSearch({
    required String searchQuery,
  }) async {
    try {
      final response = await _searchRemoteDataSource.deleteRecentSearch(
        searchQuery: searchQuery,
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
  Future<Either<FailureServ, List<CarEntity>>> searchFilter({
    required SearchFilterEntity searchEntity,
  }) async {
    try {
      final response = await _searchRemoteDataSource.searchFilter(
        searchEntity: searchEntity,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        List<CarEntity> cars = convertListOfObjectToListOfModels(
          data['data'],
        );

        return Right(cars);
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
  Future<Either<FailureServ, List<SearchFilterEntity>>> bodyTypeFilter({
    required String brand,
  }) async {
    try {
      final response = await _searchRemoteDataSource.bodyTypeFilter(
        brand: brand,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        List<SearchFilterEntity> bodyTypes =
            convertListOfObjectToListOfBodyTypes(
          data['data'],
        );

        return Right(bodyTypes);
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
  Future<Either<FailureServ, List<SearchFilterEntity>>> getBrands() async {
    try {
      final response = await _searchRemoteDataSource.getBrands();

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        List<SearchFilterEntity> brands = convertListOfObjectToListOfBrands(
          data['data'],
        );

        return Right(brands);
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
}
