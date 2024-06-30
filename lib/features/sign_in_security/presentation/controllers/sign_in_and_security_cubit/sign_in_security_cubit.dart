import 'package:bloc/bloc.dart';
import 'package:cars/core/helper/methods.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/features/sign_in_security/domain/entities/sign_in_security_entity.dart';
import 'package:cars/features/sign_in_security/domain/use_cases/check_code_input_use_case.dart';
import 'package:cars/features/sign_in_security/domain/use_cases/update_email_use_case.dart';
import 'package:cars/features/sign_in_security/domain/use_cases/update_password_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/verify_email_use_case.dart';

part 'sign_in_security_state.dart';

class SignInSecurityCubit extends Cubit<SignInSecurityState> {
  final VerifyEmailUseCase _verifyEmailUseCase;
  final UpdatePasswordUseCase _updatePasswordUseCase;
  final UpdateEmailUseCase _updateEmailUseCase;
  final CheckCodeInputUseCase _checkCodeInputUseCase;

  SignInSecurityCubit(
    this._verifyEmailUseCase,
    this._updatePasswordUseCase,
    this._updateEmailUseCase,
    this._checkCodeInputUseCase,
  ) : super(SignInSecurityInitial());
  GlobalKey<FormState> keyCode = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController code = TextEditingController();

  verifyEmail() async {
    if (email.text.isNotEmpty) {
      emit(VerifyEmailLoading());
      await _verifyEmailUseCase.call(email.text).then(
            (value) => value.fold(
              (left) {
                emit(VerifyEmailFailure(message: left.message));
              },
              (right) async {
                email.clear();
                await saveTokenLocal(StringsEn.tokenVerifyEmail, right);
                emit(VerifyEmailLoaded(message: right));
              },
            ),
          );
    } else {
      emit(
        VerifyEmailFailure(message: 'Please ,Enter Email to verify'),
      );
    }
  }

  updateEmail() async {
    if (email.text.isNotEmpty || password.text.isNotEmpty) {
      emit(UpdateEmailLoading());
      await _updateEmailUseCase
          .call(
            SignInSecurityEntity(
              email: email.text,
              password: password.text,
            ),
          )
          .then(
            (value) => value.fold(
              (left) {
                emit(UpdateEmailFailure(message: left.message));
              },
              (right) {
                email.clear();
                password.clear();
                emit(UpdateEmailLoaded(message: right));
              },
            ),
          );
    } else {
      emit(
        UpdateEmailFailure(
          message: 'Please ,Enter Email and password to update',
        ),
      );
    }
  }

  updatePassword() async {
    if (password.text.isNotEmpty ||
        newPassword.text.isNotEmpty ||
        confirmPassword.text.isNotEmpty) {
      emit(UpdatePasswordLoading());
      await _updatePasswordUseCase
          .call(
            SignInSecurityEntity(
              password: password.text,
              newPassword: newPassword.text,
              confirmNewPassword: confirmPassword.text,
            ),
          )
          .then(
            (value) => value.fold(
              (left) {
                emit(UpdatePasswordFailure(message: left.message));
              },
              (right) {
                password.clear();
                newPassword.clear();
                confirmPassword.clear();
                emit(UpdatePasswordLoaded(message: right));
              },
            ),
          );
    } else {
      emit(
        UpdatePasswordFailure(
          message:
              'Please ,Enter password , new password and confirm password to update',
        ),
      );
    }
  }

  checkCodeInput() async {
    if (code.text.isNotEmpty) {
      emit(CheckCodeInputLoading());
      await _checkCodeInputUseCase
          .call(
            SignInSecurityEntity(
              email: email.text,
              code: code.text,
            ),
          )
          .then(
            (value) => value.fold(
              (left) {
                emit(CheckCodeInputFailure(message: left.message));
              },
              (right) {
                email.clear();
                code.clear();
                emit(CheckCodeInputLoaded(message: right));
              },
            ),
          );
    } else {
      emit(
        CheckCodeInputFailure(
          message: 'Please ,Enter code to verify',
        ),
      );
    }
  }
}
