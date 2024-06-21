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

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        userId: json['user_id'] ?? '',
        carId: json['car_id'] ?? '',
        brand: json['brand'] ?? '',
        model: json['model'] ?? '',
        bodyType: json['body_type'] ?? '',
        price: json['price'] ?? '',
        imagePath: json['image_path'] ?? '',
      );
}
