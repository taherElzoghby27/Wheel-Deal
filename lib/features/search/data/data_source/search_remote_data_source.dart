import 'package:cars/core/networking/api.dart';
import 'package:cars/core/helper/methods.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/networking/api_service.dart';
import 'package:cars/features/search/domain/entities/search_entity.dart';
import 'package:dio/dio.dart';

abstract class SearchRemoteDataSource {
  Future<Response> search({
    required String searchWord,
  });

  Future<Response> searchFilter({
    required SearchFilterEntity searchEntity,
  });

  Future<Response> recentSearch();

  Future<Response> deleteRecentSearch({
    required String searchQuery,
  });

  Future<Response> bodyTypeFilter({
    required String brand,
  });

  Future<Response> getBrands();
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService _apiService;

  SearchRemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Response> recentSearch() async {
    String? token = await readFromCache(StringsEn.token);
    Response response = await _apiService.get(
      endPoint: ApiConsts.recentSearchEndPoint,
      token: token,
    );
    return response;
  }

  @override
  Future<Response> search({required String searchWord}) async {
    FormData data = convertMapToFormData(
      {'q': searchWord},
    );
    String? token = await readFromCache(StringsEn.token);
    Response response = await _apiService.post(
      endPoint: ApiConsts.searchEndPoint,
      token: token,
      data: data,
    );
    return response;
  }

  @override
  Future<Response> searchFilter({
    required SearchFilterEntity searchEntity,
  }) async {
    FormData data = convertMapToFormData(
      searchEntity.toMap(),
    );
    Response response = await _apiService.post(
      endPoint: ApiConsts.searchFilterEndPoint,
      data: data,
    );
    return response;
  }

  @override
  Future<Response> deleteRecentSearch({required String searchQuery}) async {
    FormData data = convertMapToFormData(
      {'search_query': searchQuery},
    );
    String? token = await readFromCache(StringsEn.token);
    Response response = await _apiService.post(
      endPoint: ApiConsts.deleteRecentSearchEndPoint,
      token: token,
      data: data,
    );
    return response;
  }

  @override
  Future<Response> bodyTypeFilter({required String brand}) async {
    FormData data = convertMapToFormData(
      {'brand': brand},
    );
    Response response = await _apiService.post(
      endPoint: ApiConsts.bodyTypeFilter,
      data: data,
    );
    return response;
  }

  @override
  Future<Response> getBrands() async {
    Response response = await _apiService.get(
      endPoint: ApiConsts.getBrandsFilter,
    );
    return response;
  }
}
