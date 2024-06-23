import 'dart:convert';

import 'package:cars/core/consts/api.dart';
import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/user_profile_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileEntity> getProfile();
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
}
