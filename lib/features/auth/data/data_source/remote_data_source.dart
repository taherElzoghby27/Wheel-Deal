import 'dart:convert';

import 'package:cars/core/consts/api.dart';
import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/services/api_service.dart';
import 'package:cars/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import '../../../../core/consts/strings.dart';

abstract class RemoteDataSource {
  Future<UserModel> signUp({required UserModel userEntity});

  Future<Response> login({required UserModel userEntity});

  Future<UserModel> resetPassword({required UserModel userEntity});

  Future<UserModel> verifyEmail({required UserModel userEntity});
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiService _apiService;

  RemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Response> login({required UserModel userEntity}) async {
    FormData data = convertMapToFormData(
      userEntity.toMapLogin(),
    );
    Response result = await _apiService.post(
      endPoint: ApiConsts.loginEndpoint,
      data: data,
    );

    return result;
  }

  @override
  Future<UserModel> signUp({required UserModel userEntity}) async {
    FormData data = convertMapToFormData(userEntity.toMapSignUp());
    Response result = await _apiService.post(
      endPoint: ApiConsts.signUpEndpoint,
      data: data,
    );
    UserModel model = UserModel.fromMap(
      jsonDecode(result.data),
    );
    return model;
  }

  @override
  Future<UserModel> verifyEmail({required UserModel userEntity}) async {
    FormData data = convertMapToFormData(
      userEntity.toMapCheckingForResetPassword(),
    );
    Response result = await _apiService.post(
      endPoint: ApiConsts.checkingForResetPasswordEndpoint,
      data: data,
    );
    UserModel model = UserModel.fromMap(
      jsonDecode(result.data),
    );
    return model;
  }

  @override
  Future<UserModel> resetPassword({required UserModel userEntity}) async {
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
    UserModel model = UserModel.fromMap(
      jsonDecode(result.data),
    );
    return model;
  }
}
