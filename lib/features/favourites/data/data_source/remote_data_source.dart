import 'package:cars/core/consts/api.dart';
import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

abstract class FavouritesRemoteDataSource {
  Future<Response> addFav({required int carId});

  Future<Response> deleteFav({required int carId});

  Future<Response> getFav();
}

class FavouritesRemoteDataSourceImpl extends FavouritesRemoteDataSource {
  final ApiService _apiService;

  FavouritesRemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Response> addFav({required int carId}) async {
    FormData data = convertMapToFormData({'car_id': carId});
    String? token = await readFromCache(
      StringsEn.token,
    );
    Response response = await _apiService.post(
      endPoint: ApiConsts.addFavEndPoint,
      token: token,
      data: data,
    );
    return response;
  }

  @override
  Future<Response> deleteFav({required int carId}) async {
    FormData data = convertMapToFormData({'car_id': carId});
    String? token = await readFromCache(
      StringsEn.token,
    );
    Response response = await _apiService.post(
      endPoint: ApiConsts.deleteFavEndPoint,
      token: token,
      data: data,
    );
    return response;
  }

  @override
  Future<Response> getFav() async {
    String? token = await readFromCache(
      StringsEn.token,
    );
    Response response = await _apiService.get(
      endPoint: ApiConsts.fetchFavEndPoint,
      token: token,
    );
    return response;
  }
}
