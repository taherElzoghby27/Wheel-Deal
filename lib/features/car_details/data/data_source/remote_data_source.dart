import 'package:cars/core/consts/api.dart';
import 'package:cars/core/services/api_service.dart';
import 'package:dio/dio.dart';

abstract class CarDetailsRemoteDataSource {
  Future<Response> getDetailsCar({required int carId});
}

class CarDetailsRemoteDataSourceImpl extends CarDetailsRemoteDataSource {
  final ApiService _apiService;

  CarDetailsRemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Response> getDetailsCar({required int carId}) async {
    Response result = await _apiService.post(
      endPoint: '${ApiConsts.carDetailsEndPoint}',
    );
    return result;
  }
}
