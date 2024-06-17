class SearchFilterEntity {
  final String condition;
  final String brand;
  final String bodyType;
  final String minPrice;
  final String maxPrice;
  final String airBag;
  final String touchScreen;
  final String airCondition;
  final String brakeAssist;
  final String navigationSystem;
  final String connectivity;
  final String remoteEngineStartStop;

  SearchFilterEntity({
    required this.condition,
    required this.brand,
    required this.bodyType,
    required this.minPrice,
    required this.maxPrice,
    required this.airBag,
    required this.touchScreen,
    required this.airCondition,
    required this.brakeAssist,
    required this.navigationSystem,
    required this.connectivity,
    required this.remoteEngineStartStop,
  });

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
