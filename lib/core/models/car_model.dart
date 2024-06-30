import 'package:cars/core/helper/strings.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';

class CarModel extends CarEntity {
  String? carId;
  String? brand;
  String? model;
  String? bodyType;
  String? price;
  String? imagePath;
  String? fuelType;
  String? transmission;
  String? color;
  String? releaseDate;
  String? enginePower;
  String? topSpeed;
  String? fuelTankCapacity;
  String? airConditioner;
  String? brakeAssist;
  String? navigationSystem;
  String? touchScreen;
  String? connectivity;
  String? remoteEngineStartStop;
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
          id: carId ?? "",
          image: imagePath ?? "",
          title: model ?? '',
          priceCar: price ?? "0",
        );

  factory CarModel.fromMap(Map<String, dynamic> dataMap) {
    String imageAfterEdit = dataMap['image_path'] == null
        ? ''
        : dataMap['image_path'].replaceAll(
            StringsEn.oldImagesPath,
            StringsEn.newImagesPath,
          );
    return CarModel(
      carId: dataMap['car_id'] ?? "",
      brand: dataMap['brand'] ?? '',
      model: dataMap['model'] ?? '',
      bodyType: dataMap['body_type'] ?? '',
      price: dataMap['price'] ?? "",
      imagePath: imageAfterEdit,
      fuelType: dataMap['fuel_type'] ?? '',
      transmission: dataMap['transmission'] ?? '',
      color: dataMap['color'] ?? '',
      releaseDate: dataMap['release_date'] ?? "",
      enginePower: dataMap['engine_power'] ?? "",
      topSpeed: dataMap['top_speed'] ?? "",
      fuelTankCapacity: dataMap['fuel_tank_capacity'] ?? "",
      airConditioner: dataMap['air_conditioner'] ?? "",
      brakeAssist: dataMap['brake_assist'] ?? "",
      navigationSystem: dataMap['navigation_system'] ?? "",
      touchScreen: dataMap['touch_screen'] ?? "",
      connectivity: dataMap['connectivity'] ?? "",
      remoteEngineStartStop: dataMap['remote_engine_start_stop'] ?? "",
      newUsed: dataMap['new_used'] ?? '',
      installmentAvailability: dataMap['installment_availability'] ?? '',
    );
  }
}
