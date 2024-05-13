import 'dart:convert';

import 'package:cars/features/home/domain/entities/car_entity.dart';

class CarModel extends CarEntity {
  String? carId;
  String? brand;
  String? model;
  String? bodyType;
  String? price;
  String? imagePath;

  CarModel({
    this.carId,
    this.brand,
    this.model,
    this.bodyType,
    this.price,
    this.imagePath,
  }) : super(
          id: carId ?? '',
          image: imagePath ?? '',
          title: model ?? '',
          priceCar: price ?? '',
        );

  factory CarModel.fromJson(String json) => CarModel.fromMap(
        jsonDecode(json),
      );

  factory CarModel.fromMap(Map<String, dynamic> dataMap) => CarModel(
        carId: dataMap['car_id'] ?? '',
        brand: dataMap['brand'] ?? '',
        model: dataMap['model'] ?? '',
        bodyType: dataMap['body_type'] ?? '',
        price: dataMap['price'] ?? '',
        imagePath: dataMap['image_path'] ?? '',
      );
}
