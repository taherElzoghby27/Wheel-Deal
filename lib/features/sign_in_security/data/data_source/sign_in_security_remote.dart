import 'dart:convert';

import 'package:cars/core/networking/api.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/networking/api_service.dart';
import 'package:dio/dio.dart';

import '../../../../core/helper/methods.dart';
import '../../domain/entities/sign_in_security_entity.dart';

abstract class SignInSecurityRemote {
  Future<String> verifyEmail({
    required String email,
  });

  Future<String> checkCodeInput({
    required SignInSecurityEntity model,
  });

  Future<String> updateEmail({
    required SignInSecurityEntity model,
  });

  Future<String> updatePassword({
    required SignInSecurityEntity model,
  });
}

class SignInSecurityRemoteImpl extends SignInSecurityRemote {
  final ApiService _apiService;

  SignInSecurityRemoteImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<String> checkCodeInput({
    required SignInSecurityEntity model,
  }) async {
    FormData data = convertMapToFormData(
      model.toMapCodeInput(),
    );
    String? token = await readFromCache(
      StringsEn.tokenVerifyEmail,
    );
    Response response = await _apiService.post(
      endPoint: ApiConsts.checkCodeInputEndPoint,
      token: token,
      data: data,
    );
    Map<String, dynamic> dataMap = jsonDecode(response.data);
    String message = dataMap['Message'];
    return message;
  }

  @override
  Future<String> updateEmail({
    required SignInSecurityEntity model,
  }) async {
    FormData data = convertMapToFormData(
      model.toMapUpdateEmail(),
    );
    String? token = await readFromCache(
      StringsEn.token,
    );
    Response response = await _apiService.post(
      endPoint: ApiConsts.updateEmailEndPoint,
      token: token,
      data: data,
    );
    String message = response.data['Message'];
    return message;
  }

  @override
  Future<String> updatePassword({
    required SignInSecurityEntity model,
  }) async {
    FormData data = convertMapToFormData(
      model.toMapUpdatePassword(),
    );
    String? token = await readFromCache(
      StringsEn.token,
    );
    Response response = await _apiService.post(
      endPoint: ApiConsts.updatePasswordEndPoint,
      token: token,
      data: data,
    );
    String message = response.data['Message'];
    return message;
  }

  @override
  Future<String> verifyEmail({required String email}) async {
    FormData data = convertMapToFormData(
      {'email': email},
    );
    String? token = await readFromCache(
      StringsEn.token,
    );
    Response response = await _apiService.post(
      endPoint: ApiConsts.emailVerifyEndPoint,
      token: token,
      data: data,
    );
    String jwt = response.data['jwt'];
    return jwt;
  }
}
