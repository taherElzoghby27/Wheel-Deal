import 'package:bloc/bloc.dart';
import 'package:cars/features/auth/data/models/user_model.dart';
import 'package:cars/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit(
    this._resetPasswordUseCase,
  ) : super(ResetPasswordInitial());


  //reset password
  resetPassword() async {
    emit(ResetPasswordLoading());
    await _resetPasswordUseCase.call(UserModel()).then(
          (value) => value.fold(
            (failure) {
              emit(ResetPasswordFailure(message: failure.message));
            },
            (user) {
              emit(ResetPasswordLoaded());
            },
          ),
        );
  }
}
