import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/strings.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey();
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;

  //
  String? _password;
  String? _confirmPassword;

  String get password => _password!;

  String get confirmPassword => _confirmPassword!;
  bool pass1Visible = true;
  bool pass2Visible = true;

  set password(String value) {
    _password = value;
  }

  set confirmPassword(String value) {
    _confirmPassword = value;
  }

  //change pass to visible or not
  changeVisible(String status) {
    if (status == StringsEn.password) {
      pass1Visible = !pass1Visible;
    } else if (status == StringsEn.confirmNewPass) {
      pass2Visible = !pass2Visible;
    }
    emit(VisibleChangeState());
  }

  onChangeFields(String status, String value) {
    if (status == StringsEn.password) {
      password = value;
    } else {
      confirmPassword = value;
    }
    emit(ResetPasswordChangeState());
  }

  createPassButton() async {
    if (formKey.currentState!.validate()) {
      //login
      if (controller.isAnimating) {
        stopAnimation();
      }
      resetPassword();
    } else {
      if (!controller.isAnimating) {
        startAnimation();
      }
      Future.delayed(
        const Duration(milliseconds: 500),
        () => stopAnimation(),
      );
    }
  }

  void stopAnimation() {
    controller.reset();
    controller.stop();
  }

  void startAnimation() {
    controller
      ..forward()
      ..repeat();
  }

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
