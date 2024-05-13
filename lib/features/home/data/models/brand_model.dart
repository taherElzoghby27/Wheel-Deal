import 'dart:convert';

import 'package:cars/features/home/domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  String? sourceName;
  String? sourceImage;

  BrandModel({this.sourceName, this.sourceImage})
      : super(
          name: sourceName ?? '',
          logo: sourceImage ?? '',
        );

  factory BrandModel.fromJson(String json) => BrandModel.fromJson(
        jsonDecode(json),
      );

  factory BrandModel.fromMap(Map<String, dynamic> data) => BrandModel(
        sourceName: data['source_name'] ?? '',
        sourceImage: data['source_image'] ?? '',
      );
}
