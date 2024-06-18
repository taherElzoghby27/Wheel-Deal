class SearchFilterEntity {
  String? condition;
  String? brand;
  String? bodyType;
  String? minPrice;
  String? maxPrice;
  String? airBag;
  String? touchScreen;
  String? airCondition;
  String? brakeAssist;
  String? navigationSystem;
  String? connectivity;
  String? remoteEngineStartStop;

  SearchFilterEntity({
    this.condition,
    this.brand,
    this.bodyType,
    this.minPrice,
    this.maxPrice,
    this.airBag,
    this.touchScreen,
    this.airCondition,
    this.brakeAssist,
    this.navigationSystem,
    this.connectivity,
    this.remoteEngineStartStop,
  });

  factory SearchFilterEntity.fromMap(Map<String, dynamic> data) =>
      SearchFilterEntity(
        bodyType: data['body_type'],
      );

  Map<String, dynamic> toMap() {
    return {
      'condition': condition,
      'brand': brand,
      'body_type': bodyType,
      'min_price': minPrice,
      'max_price': maxPrice,
      'airbag': airBag,
      'touch_screen': touchScreen,
      'air_conditioner': airCondition,
      'brake_assist': brakeAssist,
      'navigation_system': navigationSystem,
      'connectivity': connectivity,
      'remote_engine_start_stop': remoteEngineStartStop,
    };
  }
}
