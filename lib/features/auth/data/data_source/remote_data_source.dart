import 'package:cars/core/consts/api.dart';
import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/services/api_service.dart';
import 'package:cars/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<UserModel> signUp({required UserModel userEntity});

  Future<UserModel> login({required UserModel userEntity});

  Future<UserModel> resetPassword({required UserModel userEntity});

  Future<UserModel> verifyEmail({required UserModel userEntity});
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiService _apiService;

  RemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<UserModel> login({required UserModel userEntity}) async {
    FormData data = convertMapToFormData(userEntity.toMapLogin());
    Map<String, dynamic> result = await _apiService.post(
      endPoint: ApiConsts.loginEndpoint,
      data: data,
    );
    UserModel userModel = UserModel.fromMap(result);
    return userModel;
  }

  @override
  Future<UserModel> signUp({required UserModel userEntity}) async {
    FormData data = convertMapToFormData(userEntity.toMapSignUp());
    Map<String, dynamic> result = await _apiService.post(
      endPoint: ApiConsts.signUpEndpoint,
      data: data,
    );
    UserModel userModel = UserModel.fromMap(result);
    return userModel;
  }

  @override
  Future<UserModel> verifyEmail({required UserModel userEntity}) async {
    FormData data = convertMapToFormData(
      userEntity.toMapCheckingForResetPassword(),
    );
    Map<String, dynamic> result = await _apiService.post(
      endPoint: ApiConsts.checkingForResetPasswordEndpoint,
      data: data,
    );
    UserModel userModel = UserModel.fromMap(result);
    return userModel;
  }

  @override
  Future<UserModel> resetPassword({required UserModel userEntity}) async {
    FormData data = convertMapToFormData(
      userEntity.toMapResetPass(),
    );
    Map<String, dynamic> result = await _apiService.post(
      endPoint: ApiConsts.resetPassEndPoint,
      data: data,
    );
    UserModel userModel = UserModel.fromMap(result);
    return userModel;
  }
}
