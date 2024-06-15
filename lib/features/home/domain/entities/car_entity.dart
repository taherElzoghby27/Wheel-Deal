import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'car_entity.g.dart';

@HiveType(typeId: 1)
class CarEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String priceCar;

  CarEntity({
    required this.id,
    required this.image,
    required this.title,
    required this.priceCar,
  });
}
