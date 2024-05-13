import 'package:cars/core/consts/api.dart';
import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/helper/flutter_secure_storage.dart';
import 'package:cars/core/services/api_service.dart';
import 'package:cars/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/consts/strings.dart';

abstract class RemoteDataSource {
  Future<Response> signUp({required UserModel userEntity});

  Future<Response> login({required UserModel userEntity});

  Future<Response> resetPassword({required UserModel userEntity});

  Future<Response> verifyEmail({required UserModel userEntity});
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiService _apiService;

  RemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Response> login({required UserModel userEntity}) async {
    FormData data = convertMapToFormData(userEntity.toMapLogin());
    Response result = await _apiService.post(
      endPoint: ApiConsts.loginEndpoint,
      data: data,
    );
    debugPrint(result.toString());
    return result;
  }

  @override
  Future<Response> signUp({required UserModel userEntity}) async {
    FormData data = convertMapToFormData(userEntity.toMapSignUp());
    Response result = await _apiService.post(
      endPoint: ApiConsts.signUpEndpoint,
      data: data,
    );
    return result;
  }

  @override
  Future<Response> verifyEmail({required UserModel userEntity}) async {
    FormData data = convertMapToFormData(
      userEntity.toMapCheckingForResetPassword(),
    );
    Response result = await _apiService.post(
      endPoint: ApiConsts.checkingForResetPasswordEndpoint,
      data: data,
    );
    return result;
  }

  @override
  Future<Response> resetPassword({required UserModel userEntity}) async {
    FormData data = convertMapToFormData(
      userEntity.toMapResetPass(),
    );
    String? tokenForResetPass = await readFromCache(
      StringsEn.tokenForResetPass,
    );
    Response result = await _apiService.post(
      endPoint: ApiConsts.resetPassEndPoint,
      data: data,
      token: tokenForResetPass,
    );
    return result;
  }

  Future<String?> readFromCache(String token) async {
    return await FlutterSecureStorageEncrypted.readData(
      token,
    );
  }
}
