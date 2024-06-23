part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class GetProfileLoading extends ProfileState {}

class GetProfileLoaded extends ProfileState {
  final UserProfileEntity userProfileEntity;

  GetProfileLoaded({required this.userProfileEntity});
}

class GetProfileFailure extends ProfileState {
  final String message;

  GetProfileFailure({required this.message});
}
