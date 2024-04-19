class IdentityTypeModel {
  final String type;
  final String? frontImage;
  final String? backImage;
  final String? selfieImage;

  IdentityTypeModel({
    required this.type,
    this.frontImage,
    this.backImage,
    this.selfieImage,
  });
}
