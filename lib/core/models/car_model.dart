import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';

class CarModel extends CarEntity {
  num? carId;
  String? brand;
  String? model;
  String? bodyType;
  num? price;
  String? imagePath;
  String? fuelType;
  String? transmission;
  String? color;
  num? releaseDate;
  num? enginePower;
  num? topSpeed;
  num? fuelTankCapacity;
  num? airConditioner;
  num? brakeAssist;
  num? navigationSystem;
  num? touchScreen;
  num? connectivity;
  num? remoteEngineStartStop;
  String? newUsed;
  String? installmentAvailability;

  CarModel({
    this.carId,
    this.brand,
    this.model,
    this.bodyType,
    this.price,
    this.imagePath,
    this.fuelType,
    this.transmission,
    this.color,
    this.releaseDate,
    this.enginePower,
    this.topSpeed,
    this.fuelTankCapacity,
    this.airConditioner,
    this.brakeAssist,
    this.navigationSystem,
    this.touchScreen,
    this.connectivity,
    this.remoteEngineStartStop,
    this.newUsed,
    this.installmentAvailability,
  }) : super(
          id: carId ?? 0,
          image: imagePath ?? '',
          title: model ?? '',
          priceCar: price ?? 0,
        );



  factory CarModel.fromMap(Map<String, dynamic> dataMap) {
    String imageAfterEdit = dataMap['image_path'] == null
        ? ''
        : dataMap['image_path'].replaceAll(
            StringsEn.oldImagesPath,
            StringsEn.newImagesPath,
          );
    return CarModel(
      carId: dataMap['car_id'] ?? 0,
      brand: dataMap['brand'] ?? '',
      model: dataMap['model'] ?? '',
      bodyType: dataMap['body_type'] ?? '',
      price: dataMap['price'] ?? 0,
      imagePath: imageAfterEdit,
      fuelType: dataMap['fuel_type'] ?? '',
      transmission: dataMap['transmission'] ?? '',
      color: dataMap['color'] ?? '',
      releaseDate: dataMap['release_date'] ?? 0,
      enginePower: dataMap['engine_power'] ?? 0,
      topSpeed: dataMap['top_speed'] ?? 0,
      fuelTankCapacity: dataMap['fuel_tank_capacity'] ?? 0,
      airConditioner: dataMap['air_conditioner'] ?? 0,
      brakeAssist: dataMap['brake_assist'] ?? 0,
      navigationSystem: dataMap['navigation_system'] ?? 0,
      touchScreen: dataMap['touch_screen'] ?? 0,
      connectivity: dataMap['connectivity'] ?? 0,
      remoteEngineStartStop: dataMap['remote_engine_start_stop'] ?? 0,
      newUsed: dataMap['new_used'] ?? '',
      installmentAvailability: dataMap['installment_availability'] ?? '',
    );
  }
}
