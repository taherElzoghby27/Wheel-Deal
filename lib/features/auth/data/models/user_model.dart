import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? age;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? city;
  final String? state;
  final String? phone;
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
    this.gender,
    this.address,
    this.message,
    this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        message: data['Message'],
        token: data['jwt'],
      );

  toMapLogin() {
    return {
      'email': email,
      'password': password,
    };
  }

  toMapSignUp() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'age': age,
      'email': email,
      'password': password,
      'confirm_pwd': confirmPassword,
      'city': city,
      'state': state,
      'phone': phone,
      'gender': gender,
      'address': address,
    };
  }

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
