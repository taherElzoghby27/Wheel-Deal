import 'package:cars/core/models/car_model.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/search/data/models/recent_search_model.dart';
import 'package:cars/features/search/domain/entities/search_entity.dart';
import 'package:dio/dio.dart';

import '../helper/flutter_secure_storage.dart';
import 'strings.dart';

FormData convertMapToFormData(Map<String, dynamic> data) {
  return FormData.fromMap(data);
}

saveTokenLocal(String token) async {
  await FlutterSecureStorageEncrypted.writeData(
    StringsEn.token,
    token,
  );
}

Future<String?> readFromCache(String key) async {
  return await FlutterSecureStorageEncrypted.readData(
    key,
  );
}

// EGP 2847354 -> EGP 2,847,354
String handlePrice(String num) {
  //String num = number.toString();
  String newNum = '';
  int count = 0;
  for (int i = num.length - 1; i >= 0; i--) {
    newNum = num[i] + newNum;
    count++;
    if (count == 3 && i != 0) {
      newNum = ',$newNum';
      count = 0;
    }
  }
  return newNum;
}

List<CarModel> convertListOfObjectToListOfModels(
  List<dynamic> data,
) {
  return List<CarModel>.from(
    data.map(
      (item) => CarModel.fromMap(item),
    ),
  );
}

List<SearchFilterEntity> convertListOfObjectToListOfBodyTypes(
  List<dynamic> data,
) {
  return List<SearchFilterEntity>.from(
    data.map(
      (item) => SearchFilterEntity.fromMap(item),
    ),
  );
}

//convert list of maps to list of cars
List<RecentSearchModel> convertMapsToRecentSearch(
  List<dynamic> data,
) {
  return List.from(
    data.map(
      (item) => RecentSearchModel.fromMap(item),
    ),
  );
}
