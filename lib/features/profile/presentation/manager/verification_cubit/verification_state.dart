part of 'verification_cubit.dart';

class VerificationState {
  //front
  final File? frontImage;
  final RequestState frontImageState;

  //back
  final File? backImage;
  final RequestState backImageState;

  //selfie
  final File? selfieImage;
  final RequestState selfieImageState;

  //error
  final String imageError;
  final RequestState userVerificationState;
  final String userVerificationResult;
  final String failureUserVerification;

  const VerificationState({
    this.frontImage,
    this.frontImageState = RequestState.initial,
    this.backImage,
    this.backImageState = RequestState.initial,
    this.selfieImage,
    this.selfieImageState = RequestState.initial,
    this.imageError = 'No Image',
    this.userVerificationState = RequestState.initial,
    this.userVerificationResult = 'No Data',
    this.failureUserVerification = 'No Data',
  });

  VerificationState copyWith({
    File? frontImage,
    RequestState? frontImageState,
    File? backImage,
    RequestState? backImageState,
    File? selfieImage,
    RequestState? selfieImageState,
    String? imageError,
    RequestState? userVerificationState,
    String? userVerificationResult,
    String? failureUserVerification,
  }) {
    return VerificationState(
      frontImage: frontImage ?? this.frontImage,
      frontImageState: frontImageState ?? this.frontImageState,
      backImage: backImage ?? this.backImage,
      backImageState: backImageState ?? this.backImageState,
      selfieImage: selfieImage ?? this.selfieImage,
      selfieImageState: selfieImageState ?? this.selfieImageState,
      imageError: imageError ?? this.imageError,
      userVerificationState:
          userVerificationState ?? this.userVerificationState,
      userVerificationResult:
          userVerificationResult ?? this.userVerificationResult,
      failureUserVerification:
          failureUserVerification ?? this.failureUserVerification,
    );
  }
}

class IdentityChanged extends VerificationState {}

class CurrentLoadingChanged extends VerificationState {
  final int value;

  CurrentLoadingChanged(this.value);
}
