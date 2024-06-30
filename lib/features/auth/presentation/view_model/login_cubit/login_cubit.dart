import 'package:bloc/bloc.dart';
import 'package:cars/core/helper/methods.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/features/auth/data/models/user_model.dart';
import 'package:cars/features/auth/domain/usecases/login_use_case.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitial());
  final GlobalKey<FormState> formKey = GlobalKey();
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;

  //email - password
  String? _email;
  String? _password;
  bool visible = true;

  set email(String value) => _email = value;

  set password(String value) => _password = value;

  String get email => _email!;

  String get password => _password!;

  onChangeFields(String status, String value) {
    if (status == StringsEn.email) {
      email = value;
    } else {
      password = value;
    }
    emit(LoginChangedState());
  }

//change visible to true or false
  changeVisible() {
    visible = !visible;
    emit(ChangeVisibleLogin());
  }

//login button
  loginButton() async {
    ///create account
    if (formKey.currentState!.validate()) {
      //login
      if (controller.isAnimating) {
        _stopAnimation();
      }
      await _login();
    } else {
      if (!controller.isAnimating) {
        _startAnimation();
      }
      Future.delayed(
        const Duration(seconds: 1),
        () => _stopAnimation(),
      );
    }
  }

  void _stopAnimation() {
    controller.reset();
    controller.stop();
  }

  void _startAnimation() {
    controller
      ..forward()
      ..repeat();
  }

//login method
  _login() async {
    emit(LoginLoading());
    await _loginUseCase
        .call(
          UserModel(
            email: email,
            password: password,
          ),
        )
        .then(
          (value) => value.fold(
            (failure) {
              emit(LoginFailure(message: failure.message));
            },
            (user) {
              //debugPrint(user.token);
              saveTokenLocal(StringsEn.token,user.token!);
              emit(LoginLoaded());
            },
          ),
        );
  }
}
