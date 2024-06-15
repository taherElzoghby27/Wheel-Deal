import 'dart:convert';
import 'dart:io';

import 'package:cars/core/consts/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  static late Dio dio;
  static const String baseUrl = ApiConsts.baseUrl;

  static initDio() {
    dio = Dio(
      BaseOptions(
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
  }

  Future<Response> get({
    required String endPoint,
    String? token,
  }) async {
    debugPrint(token);
    Response response = await dio.get(
      "$baseUrl$endPoint",
      options: Options(
        headers: {
          //'Content-Type':'application/x-www-form-urlencoded;charset=UTF-8;application/json;multipart/form-data',
          //'Accept': 'application/json',
          'Authorization': 'Bearer ${token ?? ''}',
        },
      ),
    );
    debugPrint(
        '$endPoint ---- data : ${response.data.runtimeType} ${response.data}');
    return response;
  }

  Future<Response> post({
    required String endPoint,
    Object? data,
    String? token,
  }) async {
    Response response = await dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${token ?? ''}',
        },
      ),
    );
    debugPrint("post ${response.data} -- ${response.data.runtimeType}");
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
