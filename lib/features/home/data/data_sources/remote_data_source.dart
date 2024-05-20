import 'package:cars/core/consts/api.dart';
import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class HomeRemoteDataSource {
  Future<Response> getTopBrands();

  Future<Response> getRecommendedForYou();

  Future<Response> getBestOffers();

  Future<Response> getFavourites();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Response> getTopBrands() async {
    String? token = await readFromCache(
      StringsEn.token,
    );

    Response response = await _apiService.get(
      endPoint: ApiConsts.topBrandsEndpoint,
      token: token,
    );
    debugPrint(response.toString());
    return response;
  }

  @override
  Future<Response> getBestOffers() async {
    String? token = await readFromCache(
      StringsEn.token,
    );

    Response response = await _apiService.get(
      endPoint: ApiConsts.bestOffersEndpoint,
      token: token,
    );
    debugPrint(response.toString());
    return response;
  }

  @override
  Future<Response> getFavourites() async {
    String? token = await readFromCache(
      StringsEn.token,
    );

    Response response = await _apiService.get(
      endPoint: ApiConsts.favouritesEndpoint,
      token: token,
    );
    return response;
  }

  @override
  Future<Response> getRecommendedForYou() async {
    String? token = await readFromCache(
      StringsEn.token,
    );

    Response response = await _apiService.get(
      endPoint: ApiConsts.recommendedForYouEndPoint,
      token: token,
    );
    return response;
  }
}
