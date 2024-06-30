import '../../../../core/helper/strings.dart';

class OrderModel {
  final String userId;
  final String carId;
  final String brand;
  final String model;
  final String bodyType;
  final String price;
  final String imagePath;

  OrderModel({
    required this.userId,
    required this.carId,
    required this.brand,
    required this.model,
    required this.bodyType,
    required this.price,
    required this.imagePath,
  });

  factory OrderModel.fromMap(Map<String, dynamic> dataMap) {
    String imageAfterEdit = dataMap['image_path'] == null
        ? ''
        : dataMap['image_path'].replaceAll(
            StringsEn.oldImagesPath,
            StringsEn.newImagesPath,
          );
    return OrderModel(
      userId: dataMap['user_id'] ?? '',
      carId: dataMap['car_id'] ?? '',
      brand: dataMap['brand'] ?? '',
      model: dataMap['model'] ?? '',
      bodyType: dataMap['body_type'] ?? '',
      price: dataMap['price'] ?? '',
      imagePath: imageAfterEdit ?? '',
    );
  }
}
