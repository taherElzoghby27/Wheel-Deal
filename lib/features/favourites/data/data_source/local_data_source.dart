import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/hive_db/hive_db_cars_home.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';

abstract class FavouritesLocalDataSource {
  List<CarEntity> getFavourites();
}

class FavouritesLocalDataSourceImpl extends FavouritesLocalDataSource {
  final HiveDbCarsHome _hiveDbCarsHome;

  FavouritesLocalDataSourceImpl({required HiveDbCarsHome hiveDbCarsHome})
      : _hiveDbCarsHome = hiveDbCarsHome;

  @override
  List<CarEntity> getFavourites() {
    List<CarEntity> data = _hiveDbCarsHome.getCars(
      StringsEn.kFavourites,
    );
    return data;
  }
}
