part of 'two_step_verification_cubit.dart';

@immutable
abstract class TwoStepVerificationState {}

class TwoStepVerificationInitial extends TwoStepVerificationState {}

class Switched extends TwoStepVerificationState {
  final bool value;

  Switched({required this.value});
}

class SmsOrEmailState extends TwoStepVerificationState {
  final String value;

  SmsOrEmailState({required this.value});
}

class ChangePageStatus extends TwoStepVerificationState {
  final String value;

  ChangePageStatus({required this.value});
}
