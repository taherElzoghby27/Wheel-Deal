part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpLoaded extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String message;

  SignUpFailure({required this.message});
}

class GenderState extends SignUpState {}

class VisibleState extends SignUpState {}
