import 'package:bloc/bloc.dart';
import 'package:cars/features/sign_in_security/domain/entities/sign_in_security_entity.dart';
import 'package:cars/features/sign_in_security/domain/use_cases/check_code_input_use_case.dart';
import 'package:cars/features/sign_in_security/domain/use_cases/update_email_use_case.dart';
import 'package:cars/features/sign_in_security/domain/use_cases/update_password_use_case.dart';
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
  String? email;
  String? password;
  String? newPassword;
  String? confirmPassword;
  String? code;

  verifyEmail() async {
    if (email != null) {
      emit(VerifyEmailLoading());
      await _verifyEmailUseCase.call(email!).then(
            (value) => value.fold(
              (left) {
                emit(VerifyEmailFailure(message: left.message));
              },
              (right) {
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
    if (email != null || password != null) {
      emit(UpdateEmailLoading());
      await _updateEmailUseCase
          .call(
            SignInSecurityEntity(
              email: email,
              password: password,
            ),
          )
          .then(
            (value) => value.fold(
              (left) {
                emit(UpdateEmailFailure(message: left.message));
              },
              (right) {
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
    if (password != null || newPassword != null || confirmPassword != null) {
      emit(UpdatePasswordLoading());
      await _updatePasswordUseCase
          .call(
            SignInSecurityEntity(
              password: password,
              newPassword: newPassword,
              confirmNewPassword: confirmPassword,
            ),
          )
          .then(
            (value) => value.fold(
              (left) {
                emit(UpdatePasswordFailure(message: left.message));
              },
              (right) {
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
    if (code != null) {
      emit(CheckCodeInputLoading());
      await _checkCodeInputUseCase
          .call(
            SignInSecurityEntity(
              code: code,
            ),
          )
          .then(
            (value) => value.fold(
              (left) {
                emit(CheckCodeInputFailure(message: left.message));
              },
              (right) {
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
