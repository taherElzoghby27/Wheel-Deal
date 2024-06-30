import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/services/hive_db/hive_db_brands_home.dart';
import 'package:cars/core/services/hive_db/hive_db_cars_home.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';

import '../../domain/entities/brand_entity.dart';

abstract class HomeLocalDataSource {
  List<BrandEntity> getTopBrands({required int page});

  List<CarEntity> getRecommendedForYou({required int page});

  List<CarEntity> getBestOffers({required int page});
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
  List<CarEntity> getBestOffers({required int page}) {
    List<CarEntity> result = _hiveDbCarsHome.getCars(
      StringsEn.kBestOffers,
    );
    int bestOffersCarsLength = result.length;
    int startPage = (page - 1) * 10; //0
    int endPage = page * 10; //10
    if (startPage >= bestOffersCarsLength || endPage > bestOffersCarsLength) {
      return [];
    }
    return result.sublist(startPage, endPage);
  }

  @override
  List<CarEntity> getRecommendedForYou({required int page}) {
    List<CarEntity> result = _hiveDbCarsHome.getCars(
      StringsEn.kRecommendedForYou,
    );
    int recommendationsCarsLength = result.length;
    int startPage = (page - 1) * 10; //0
    int endPage = page * 10; //10
    if (startPage >= recommendationsCarsLength ||
        endPage > recommendationsCarsLength) {
      return [];
    }
    return result.sublist(startPage, endPage);
  }

  @override
  List<BrandEntity> getTopBrands({required int page}) {
    List<BrandEntity> result = _hiveDbBrandsHome.getBrands();
    int brandsLength = result.length;
    int startPage = (page - 1) * 10; //0
    int endPage = page * 10; //10
    if (startPage >= brandsLength || endPage > brandsLength) {
      return [];
    }
    return result.sublist(startPage, endPage);
  }
}
