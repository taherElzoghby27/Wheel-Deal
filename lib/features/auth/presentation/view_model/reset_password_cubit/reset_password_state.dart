part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordLoaded extends ResetPasswordState {}

class ResetPasswordFailure extends ResetPasswordState {
  final String message;

  ResetPasswordFailure({required this.message});
}

class ResetPasswordChangeState extends ResetPasswordState {}

class VisibleChangeState extends ResetPasswordState {}
