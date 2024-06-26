import 'package:cars/core/helper/strings.dart';
import 'package:cars/features/search/data/models/facilities_model.dart';

enum Gender { Male, Female }

//enum RequestState { initial, loading, loaded, error }
//filters

List<String> conditions = [ 'new', 'used'];

List<String> bodyTypes = [
  StringsEn.bodyType,
  'sedan',
  'suv',
  'coupe',
  'hatchback',
  'minivan',
  'sportsCar',
];
List<String> models = [
  StringsEn.model,
  '2012',
  '2020',
  '2024',
];
List<FacilityModel> facilities = [
  FacilityModel(label: StringsEn.airbag),
  FacilityModel(label: StringsEn.touchScreen),
  FacilityModel(label: StringsEn.connectivity),
  FacilityModel(label: StringsEn.airCondition),
  FacilityModel(label: StringsEn.breakAssist),
  FacilityModel(label: StringsEn.remoteEngine),
  FacilityModel(label: StringsEn.navigationSystem),
];
