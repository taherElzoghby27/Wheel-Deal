part of 'check_for_reset_cubit.dart';

@immutable
abstract class CheckForResetState {}

class CheckForResetInitial extends CheckForResetState {}

class CheckingForResetLoading extends CheckForResetState {}

class CheckingForResetLoaded extends CheckForResetState {}

class CheckingForResetFailure extends CheckForResetState {
  final String message;

  CheckingForResetFailure({required this.message});
}

class CheckingForResetChangeState extends CheckForResetState {}
