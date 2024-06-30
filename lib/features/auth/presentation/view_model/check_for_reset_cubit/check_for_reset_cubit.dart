import 'package:bloc/bloc.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/features/auth/data/models/user_model.dart';
import 'package:cars/features/auth/domain/usecases/checking_for_reset_password_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/helper/flutter_secure_storage.dart';

part 'check_for_reset_state.dart';

class CheckForResetCubit extends Cubit<CheckForResetState> {
  final VerifyEmailUseCase _verifyEmailUseCase;

  CheckForResetCubit(this._verifyEmailUseCase) : super(CheckForResetInitial());
  final GlobalKey<FormState> formKey = GlobalKey();
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;
  String? _email;
  String? _age;
  String? _last3DigitPhone;

  set email(String value) {
    _email = value;
  }

  set age(String value) {
    _age = value;
  }

  set last3DigitPhone(String value) {
    _last3DigitPhone = value;
  }

  String get email => _email!;

  String get age => _age!;

  String get last3DigitPhone => _last3DigitPhone!;

  changeFields(String status, String value) {
    if (status == StringsEn.email) {
      email = value;
    } else if (status == StringsEn.age) {
      age = value;
    } else {
      last3DigitPhone = value;
    }
    emit(CheckingForResetChangeState());
  }

  checkingForResetButton() async {
    ///create account
    if (formKey.currentState!.validate()) {
      //login
      if (controller.isAnimating) {
        stopAnimation();
      }
      _checkInfoForReset();
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

//check for reset password
  _checkInfoForReset() async {
    emit(CheckingForResetLoading());
    await _verifyEmailUseCase
        .call(
          UserModel(
            email: email,
            age: int.parse(age),
            last3DigitPhone: last3DigitPhone,
          ),
        )
        .then(
          (value) => value.fold(
            (failure) {
              emit(CheckingForResetFailure(message: failure.message));
            },
            (user) {
              saveTokenToResetPass(user.token!);
              emit(CheckingForResetLoaded());
            },
          ),
        );
  }

//save token to send for reset password
  saveTokenToResetPass(String token) async {
    await FlutterSecureStorageEncrypted.writeData(
      StringsEn.tokenForResetPass,
      token,
    );
  }
}
