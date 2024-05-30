import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/errors/failure_message.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:cars/features/car_details/data/data_source/remote_data_source.dart';
import 'package:cars/features/car_details/domain/repos/car_details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CarDetailsRepoImpl extends CarDetailsRepo {
  final CarDetailsRemoteDataSource _carDetailsRemoteDataSource;

  CarDetailsRepoImpl(
      {required CarDetailsRemoteDataSource carDetailsRemoteDataSource})
      : _carDetailsRemoteDataSource = carDetailsRemoteDataSource;

  @override
  Future<Either<FailureServ, CarModel>> getDetailsCar(
      {required int carId}) async {
    try {
      final response = await _carDetailsRemoteDataSource.getDetailsCar(
        carId: carId,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        CarModel convertedData = CarModel.fromMap(data['data']);
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
}
