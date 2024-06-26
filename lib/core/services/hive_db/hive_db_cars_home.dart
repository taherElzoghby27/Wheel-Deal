import 'package:cars/core/helper/strings.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDbCarsHome {
  //init hive
  static init() async {
    await Hive.initFlutter();
    // Register Adapter
    Hive.registerAdapter(CarEntityAdapter());
    //open boxes
    await Hive.openBox<CarEntity>(StringsEn.kBestOffers);
    await Hive.openBox<CarEntity>(StringsEn.kRecommendedForYou);
    await Hive.openBox<CarEntity>(StringsEn.kFavourites);
  }

//add brands
  saveCars({required String boxName, required List<CarEntity> cars}) {
    final box = Hive.box<CarEntity>(boxName);
    box.addAll(cars);
  }

//get brands
  List<CarEntity> getCars(String boxName) {
    Box<CarEntity> box = Hive.box<CarEntity>(boxName);
    return box.values.toList();
  }

  clearCars(String boxName) {
    Hive.box<CarEntity>(boxName).clear();
  }
}
