import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? firstName;
  final String? lastName;
  final num? age;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? city;
  final String? state;
  final String? phone;
  final String? last3DigitPhone;
  final String? gender;
  final String? address;
  final String? message;
  final String? token;

  const UserModel({
    this.firstName,
    this.lastName,
    this.age,
    this.email,
    this.password,
    this.confirmPassword,
    this.city,
    this.state,
    this.phone,
    this.last3DigitPhone,
    this.gender,
    this.address,
    this.message,
    this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        message: data['Message'],
        token: data['jwt'],
      );

  factory UserModel.fromJson(String data) => UserModel.fromMap(
        jsonDecode(data),
      );

  Map<String, String?> toMapLogin() {
    return {
      'email': email,
      'password': password,
    };
  }

  Map<String, dynamic> toMapCheckingForResetPassword() {
    return {
      'email': email,
      'phone': last3DigitPhone,
      'age': age,
    };
  }

  Map<String, dynamic> toMapResetPass() {
    return {
      'password': password,
      'confirm_pwd': confirmPassword,
    };
  }

  Map<String, dynamic> toMapSignUp() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['age'] = age;
    data['email'] = email;
    data['password'] = password;
    data['confirm_pwd'] = confirmPassword;
    data['city'] = city;
    data['state'] = state;
    data['phone'] = phone;
    data['gender'] = gender;
    data['address'] = address;
    return data;
  }

  String toJsonSignUp() => jsonEncode(toMapSignUp());

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
        age,
        gender,
        city,
        state,
        phone,
        address,
      ];
}
