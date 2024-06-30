import 'package:cars/core/helper/strings.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/home/domain/entities/brand_entity.dart';

class HiveDbBrandsHome {
  //init hive
  static init() async {
    await Hive.initFlutter();
    // Register Adapter
    Hive.registerAdapter(BrandEntityAdapter());
    //open box
    await Hive.openBox<BrandEntity>(StringsEn.kBrands);
  }

//add brands
  saveBrands({required List<BrandEntity> brands}) {
    final box = Hive.box<BrandEntity>(StringsEn.kBrands);
    box.addAll(brands);
  }

//get brands
  List<BrandEntity> getBrands() {
    Box<BrandEntity> box = Hive.box<BrandEntity>(StringsEn.kBrands);
    return box.values.toList();
  }

  clearBrands() {
    Hive.box<BrandEntity>(StringsEn.kBrands).clear();
  }
}
