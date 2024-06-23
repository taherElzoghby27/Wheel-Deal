import 'package:cars/core/consts/api.dart';
import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/api_service.dart';
import 'package:cars/core/services/hive_db/hive_db_cars_home.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:dio/dio.dart';

abstract class FavouritesRemoteDataSource {
  Future<void> addFav({required String carId});

  Future<void> deleteFav({required String carId});

  Future<List<CarEntity>> getFav();
}

class FavouritesRemoteDataSourceImpl extends FavouritesRemoteDataSource {
  final ApiService _apiService;
  final HiveDbCarsHome _hiveDbCarsHome;

  FavouritesRemoteDataSourceImpl({
    required ApiService apiService,
    required HiveDbCarsHome hiveDbCarsHome,
  })  : _apiService = apiService,
        _hiveDbCarsHome = hiveDbCarsHome;

  @override
  Future<void> addFav({required String carId}) async {
    FormData data = convertMapToFormData({'car_id': carId});
    String? token = await readFromCache(
      StringsEn.token,
    );
    await _apiService.post(
      endPoint: ApiConsts.addFavEndPoint,
      token: token,
      data: data,
    );
  }

  @override
  Future<void> deleteFav({required String carId}) async {
    FormData data = convertMapToFormData({'car_id': carId});
    String? token = await readFromCache(
      StringsEn.token,
    );
    await _apiService.post(
      endPoint: ApiConsts.deleteFavEndPoint,
      token: token,
      data: data,
    );
  }

  @override
  Future<List<CarEntity>> getFav() async {
    String? token = await readFromCache(
      StringsEn.token,
    );
    Response response = await _apiService.get(
      endPoint: ApiConsts.fetchFavEndPoint,
      token: token!,
    );
    List<CarEntity> favourites = convertListOfObjectToListOfModels(
      response.data['data'],
    );
    //save data in local
    _hiveDbCarsHome.saveCars(
      boxName: StringsEn.kFavourites,
      cars: favourites,
    );
    return favourites;
  }
}
