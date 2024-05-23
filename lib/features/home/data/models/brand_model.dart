import 'dart:convert';

import 'package:cars/core/consts/strings.dart';
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

  factory BrandModel.fromMap(Map<String, dynamic> data) {
    String imageAfterEdit = data['source_image'] == null
        ? ''
        : data['source_image'].replaceAll(
            StringsEn.oldImagesPath,
            StringsEn.newImagesPath,
          );
    return BrandModel(
      sourceName: data['source_name'] ?? '',
      sourceImage: imageAfterEdit,
    );
  }
}
