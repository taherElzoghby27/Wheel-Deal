import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/hive_db/hive_db_brands_home.dart';
import 'package:cars/core/services/hive_db/hive_db_cars_home.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';

import '../../domain/entities/brand_entity.dart';

abstract class HomeLocalDataSource {
  List<BrandEntity> getTopBrands();

  List<CarEntity> getRecommendedForYou();

  List<CarEntity> getBestOffers();

  List<CarEntity> getFavourites();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final HiveDbBrandsHome _hiveDbBrandsHome;
  final HiveDbCarsHome _hiveDbCarsHome;

  HomeLocalDataSourceImpl({
    required HiveDbBrandsHome hiveDbBrandsHome,
    required HiveDbCarsHome hiveDbCarsHome,
  })  : _hiveDbBrandsHome = hiveDbBrandsHome,
        _hiveDbCarsHome = hiveDbCarsHome;

  @override
  List<CarEntity> getBestOffers() {
    List<CarEntity> result = _hiveDbCarsHome.getCars(
      StringsEn.kBestOffers,
    );
    return result;
  }

  @override
  List<CarEntity> getFavourites() {
    List<CarEntity> result = _hiveDbCarsHome.getCars(
      StringsEn.kFavourites,
    );
    return result;
  }

  @override
  List<CarEntity> getRecommendedForYou() {
    List<CarEntity> result = _hiveDbCarsHome.getCars(
      StringsEn.kRecommendedForYou,
    );
    return result;
  }

  @override
  List<BrandEntity> getTopBrands() {
    List<BrandEntity> result = _hiveDbBrandsHome.getBrands();
    return result;
  }
}
