class PreviousCarEntity {
  final String? model;
  final String? brand;
  final double? rating;
  final String? previousCar;
  final String? carName;

  factory PreviousCarEntity.fromMap(Map<String, dynamic> dataMap) {
    return PreviousCarEntity(
        model: dataMap['model'],
        brand: dataMap['brand'],
        carName: '${dataMap['brand']} ${dataMap['model']}');
  }

  PreviousCarEntity({
    this.model,
    this.brand,
    this.rating,
    this.previousCar,
    this.carName,
  });

  toMap() {
    return {
      'previous_car_brand': brand,
    };
  }
}
