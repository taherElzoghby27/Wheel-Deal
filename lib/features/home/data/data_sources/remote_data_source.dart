import 'package:cars/core/consts/api.dart';
import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/api_service.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<Response> getTopBrands({required int page});

  Future<Response> getRecommendedForYou({required int page});

  Future<Response> getBestOffers({required int page});

  Future<Response> getFavourites({required int page});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Response> getTopBrands({required int page}) async {
    String? token = await readFromCache(
      StringsEn.token,
    );

    Response response = await _apiService.get(
      endPoint: "${ApiConsts.topBrandsEndpoint}?page=$page",
      token: token,
    );

    return response;
  }

  @override
  Future<Response> getBestOffers({required int page}) async {
    String? token = await readFromCache(
      StringsEn.token,
    );

    Response response = await _apiService.get(
      endPoint: "${ApiConsts.bestOffersEndpoint}?page=$page",
      token: token,
    );
    return response;
  }

  @override
  Future<Response> getFavourites({required int page}) async {
    String? token = await readFromCache(
      StringsEn.token,
    );

    Response response = await _apiService.get(
      endPoint: "${ApiConsts.favouritesEndpoint}?page=$page",
      token: token,
    );
    return response;
  }

  @override
  Future<Response> getRecommendedForYou({required int page}) async {
    String? token = await readFromCache(
      StringsEn.token,
    );

    Response response = await _apiService.get(
      endPoint: "${ApiConsts.recommendedForYouEndPoint}?page=$page",
      token: token,
    );
    return response;
  }
}
