import 'package:hive/hive.dart';
part 'brand_entity.g.dart';
@HiveType(typeId: 0)
class BrandEntity {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String logo;

  BrandEntity({
    required this.name,
    required this.logo,
  });
}
