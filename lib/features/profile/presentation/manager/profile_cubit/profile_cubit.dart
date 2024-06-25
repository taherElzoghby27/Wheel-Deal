import 'package:bloc/bloc.dart';
import 'package:cars/features/profile/domain/entities/user_profile_entity.dart';
import 'package:cars/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:cars/features/profile/domain/use_cases/logout_use_case.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final LogoutUseCase _logoutUseCase;

  ProfileCubit(this._getProfileUseCase, this._logoutUseCase)
      : super(ProfileInitial());

  getProfile() async {
    emit(GetProfileLoading());
    await _getProfileUseCase.call().then(
          (value) => value.fold(
            (left) {
              emit(
                GetProfileFailure(message: left.message),
              );
            },
            (success) {
              emit(
                GetProfileLoaded(userProfileEntity: success),
              );
            },
          ),
        );
  }

  logout() async {
    emit(LogoutLoading());
    await _logoutUseCase.call().then(
          (value) => value.fold(
            (fail) {
              emit(LogoutFailure(message: fail.message));
            },
            (success) {
              emit(LogoutLoaded());
            },
          ),
        );
  }
}
