import 'dart:convert';
import 'package:cars/core/networking/api.dart';
import 'package:cars/core/helper/methods.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/networking/api_service.dart';
import 'package:cars/features/profile/domain/entities/user_verification_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/user_profile_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileEntity> getProfile();

  Future<String> userVerification({
    required UserVerificationEntity userVerificationEntity,
  });
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService _apiService;

  ProfileRemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<UserProfileEntity> getProfile() async {
    String? token = await readFromCache(
      StringsEn.token,
    );
    Response response = await _apiService.get(
      endPoint: ApiConsts.profileEndPoint,
      token: token,
    );
    Map<String, dynamic> result = jsonDecode(response.data);
    debugPrint('type ${result.runtimeType}');
    UserProfileEntity user = UserProfileEntity.fromMap(
      result['data'][0],
    );
    return user;
  }

  @override
  Future<String> userVerification({
    required UserVerificationEntity userVerificationEntity,
  }) async {
    String? token = await readFromCache(
      StringsEn.token,
    );
    debugPrint('path : ${userVerificationEntity.image.path}');
    String fileName = userVerificationEntity.image.path.split('/').last;
    debugPrint('path : $fileName');
    FormData formData = FormData.fromMap(
      {
        "image": await MultipartFile.fromFile(
          userVerificationEntity.image.path,
          filename: fileName,
        ),
      },
    );
    Response response = await _apiService.post(
      endPoint: ApiConsts.userVerificationEndPoint,
      token: token,
      data: formData,
    );
    Map<String, dynamic> result = jsonDecode(response.data);

    return result['data'];
  }
}
