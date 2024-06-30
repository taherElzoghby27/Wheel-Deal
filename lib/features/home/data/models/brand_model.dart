import 'package:cars/core/helper/strings.dart';
import 'package:cars/features/home/domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  String? sourceName;
  String? sourceImage;

  BrandModel({this.sourceName, this.sourceImage})
      : super(
          name: sourceName ?? '',
          logo: sourceImage ?? '',
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
