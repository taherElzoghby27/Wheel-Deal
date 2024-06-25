import 'dart:convert';

import 'package:cars/core/consts/api.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/api_service.dart';
import 'package:dio/dio.dart';

import '../../../../core/consts/methods.dart';
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
      StringsEn.token,
    );
    Response response = await _apiService.post(
      endPoint: ApiConsts.checkCodeInputEndPoint,
      token: token,
      data: data,
    );
    return convertJsonToMessage(response);
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
    return convertJsonToMessage(response);
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
    return convertJsonToMessage(response);
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
    return convertJsonToMessage(response);
  }

  String convertJsonToMessage(Response<dynamic> response) {
    Map<String, dynamic> mapData = jsonDecode(response.data);
    String message = mapData['Message'];
    return message;
  }
}
