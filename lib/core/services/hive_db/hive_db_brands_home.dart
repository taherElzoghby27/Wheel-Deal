import 'package:hive_flutter/hive_flutter.dart';
import '../../utilies/appStrings.dart';
import '../../../features/home/domain/entities/brand_entity.dart';

class HiveDbBrandsHome {
  //init hive
  static init() async {
    await Hive.initFlutter();
    // Register Adapter
    Hive.registerAdapter(BrandEntityAdapter());
    //open boxs
    await Hive.openBox<BrandEntity>(AppStrings.kBrands);
  }

//add brands
  saveBrands({required List<BrandEntity> brands}) {
    final box = Hive.box<BrandEntity>(AppStrings.kBrands);
    box.addAll(brands);
  }

//get brands
  List<BrandEntity> getBrands() {
    Box<BrandEntity> box = Hive.box<BrandEntity>(AppStrings.kBrands);
    return box.values.toList();
  }

  clearBrands() {
    Hive.box<BrandEntity>(AppStrings.kBrands).clear();
  }
}
