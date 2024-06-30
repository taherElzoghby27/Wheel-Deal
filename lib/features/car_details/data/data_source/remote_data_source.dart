import 'package:cars/core/networking/api.dart';
import 'package:cars/core/helper/methods.dart';
import 'package:cars/core/networking/api_service.dart';
import 'package:dio/dio.dart';

abstract class CarDetailsRemoteDataSource {
  Future<Response> getDetailsCar({required int carId});
  Future<Response> getInstallmentAvailable({required int carId});
}

class CarDetailsRemoteDataSourceImpl extends CarDetailsRemoteDataSource {
  final ApiService _apiService;

  CarDetailsRemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Response> getDetailsCar({required int carId}) async {
    FormData data = convertMapToFormData({'car_id': carId});
    Response result = await _apiService.post(
      endPoint: ApiConsts.carDetailsEndPoint,
      data: data,
    );
    return result;
  }

  @override
  Future<Response> getInstallmentAvailable({required int carId}) async{
    FormData data = convertMapToFormData({'car_id': carId});
    Response result = await _apiService.post(
      endPoint: ApiConsts.installmentAvailableEndPoint,
      data: data,
    );
    return result;
  }
}
