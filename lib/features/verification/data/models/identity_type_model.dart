import 'dart:io';

class IdentityTypeModel {
  String type;
  File? frontImage;
  File? backImage;
  File? selfieImage;

  IdentityTypeModel({
    required this.type,
    this.frontImage,
    this.backImage,
    this.selfieImage,
  });
}
