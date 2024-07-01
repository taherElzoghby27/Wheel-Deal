part of 'two_step_verification_cubit.dart';

@immutable
abstract class TwoStepVerificationState {}

class TwoStepVerificationInitial extends TwoStepVerificationState {}

class ChangePageStatus extends TwoStepVerificationState {
  final String value;

  ChangePageStatus({required this.value});
}
