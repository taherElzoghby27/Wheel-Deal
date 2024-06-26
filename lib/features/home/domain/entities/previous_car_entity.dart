class PreviousCarEntity {
  final String? model;
  final String? brand;
  final double? rating;
  final String? previousCar;

  factory PreviousCarEntity.fromMap(Map<String, dynamic> dataMap) {
    return PreviousCarEntity(
      model: dataMap['model'],
      brand: dataMap['brand'],
    );
  }

  PreviousCarEntity({
    this.model,
    this.brand,
    this.rating,
    this.previousCar,
  });
  toMap(){
    return {};
  }
}
