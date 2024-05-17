import 'package:cars/features/home/domain/entities/car_entity.dart';

import '../../domain/entities/brand_entity.dart';

abstract class HomeLocalDataSource {
  List<BrandEntity> getTopBrands();

  List<CarEntity> getRecommendedForYou();

  List<CarEntity> getBestOffers();

  List<CarEntity> getFavourites();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {

  @override
  List<CarEntity> getBestOffers() {
    // TODO: implement getBestOffers
    throw UnimplementedError();
  }

  @override
  List<CarEntity> getFavourites() {
    // TODO: implement getFavourites
    throw UnimplementedError();
  }

  @override
  List<CarEntity> getRecommendedForYou() {
    // TODO: implement getRecommendedForYou
    throw UnimplementedError();
  }

  @override
  List<BrandEntity> getTopBrands() {
    // TODO: implement getTopBrands
    throw UnimplementedError();
  }
}
