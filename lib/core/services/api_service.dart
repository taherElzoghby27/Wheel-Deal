import 'package:cars/core/consts/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiService {
  static late Dio dio;
  static const String baseUrl = ApiConsts.baseUrl;

  static initDio() {
    dio = Dio();
  }

  Future<Response> get({
    required String endPoint,
    String? token,
  }) async {
    dio.options.headers = token == null
        ? {}
        : {
            'Authorization': 'Bearer $token',
          };
    Response response = await dio.get(
      '$baseUrl$endPoint',
    );
    return response;
  }

  Future<Response> post({
    required String endPoint,
    Object? data,
    String? token,
  }) async {
    dio.options.headers = token == null
        ? {}
        : {
            'Authorization': 'Bearer $token',
          };
    Response response = await dio.post(
      '$baseUrl$endPoint',
      data: data,
    );
    debugPrint("${response.data}--${response.data.runtimeType}");
    return response;
  }

  Future<Response> put({
    required String endPoint,
    String? token,
  }) async {
    dio.options.headers = token == null
        ? {}
        : {
            'Authorization': 'Bearer $token',
          };

    Response response = await dio.put(
      '$baseUrl$endPoint',
    );
    return response;
  }

  Future<Response> delete({
    required String endPoint,
    String? token,
  }) async {
    dio.options.headers = token == null
        ? {}
        : {
            'Authorization': 'Bearer $token',
          };
    Response response = await dio.delete(
      '$baseUrl$endPoint',
    );
    return response;
  }
}
