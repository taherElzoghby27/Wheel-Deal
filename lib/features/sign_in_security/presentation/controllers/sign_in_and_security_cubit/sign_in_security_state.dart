part of 'sign_in_security_cubit.dart';

@immutable
sealed class SignInSecurityState {}

final class SignInSecurityInitial extends SignInSecurityState {}

class VerifyEmailLoading extends SignInSecurityState {}

class VerifyEmailLoaded extends SignInSecurityState {
  final String message;

  VerifyEmailLoaded({required this.message});
}

class VerifyEmailFailure extends SignInSecurityState {
  final String message;

  VerifyEmailFailure({required this.message});
}

class UpdateEmailLoading extends SignInSecurityState {}

class UpdateEmailLoaded extends SignInSecurityState {
  final String message;

  UpdateEmailLoaded({required this.message});
}

class UpdateEmailFailure extends SignInSecurityState {
  final String message;

  UpdateEmailFailure({required this.message});
}

class UpdatePasswordLoading extends SignInSecurityState {}

class UpdatePasswordLoaded extends SignInSecurityState {
  final String message;

  UpdatePasswordLoaded({required this.message});
}

class UpdatePasswordFailure extends SignInSecurityState {
  final String message;

  UpdatePasswordFailure({required this.message});
}

class CheckCodeInputLoading extends SignInSecurityState {}

class CheckCodeInputLoaded extends SignInSecurityState {
  final String message;

  CheckCodeInputLoaded({required this.message});
}

class CheckCodeInputFailure extends SignInSecurityState {
  final String message;

  CheckCodeInputFailure({required this.message});
}
