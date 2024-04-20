part of 'verification_cubit.dart';

@immutable
abstract class VerificationState {}

class VerificationInitial extends VerificationState {}

class IdentityChanged extends VerificationState {}

class PickedImagedLoadedFront extends VerificationState {}

class PickedImagedLoadedBack extends VerificationState {}

class PickedImagedLoadedSelfie extends VerificationState {}

class PickedImagedLoadingFront extends VerificationState {}

class PickedImagedLoadingBack extends VerificationState {}

class PickedImagedLoadingSelfie extends VerificationState {}

class PickedImagedFailure extends VerificationState {}
