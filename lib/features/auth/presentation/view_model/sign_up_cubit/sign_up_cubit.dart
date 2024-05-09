import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/helper/flutter_secure_storage.dart';
import 'package:cars/features/auth/data/models/user_model.dart';
import 'package:cars/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:cars/features/auth/presentation/view_model/change_current_sign_up_cubit/change_sign_up_current_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit(this._signUpUseCase) : super(SignUpInitial());
  final GlobalKey<FormState> formKey = GlobalKey();
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;

  //variables
  String? firstName;
  String? lastName;
  String? phone;
  String? age;
  String? email;
  String? address;
  String? password;
  String? confirmPassword;
  String? city;
  String? stat;
  Gender selectedGender = Gender.Male;
  bool visiblePass1 = false;
  bool visiblePass2 = false;

  changeGender(Gender value) {
    selectedGender = value;
    emit(GenderState());
  }

//change pass to visible or not
  changeVisible(String status) {
    if (status == StringsEn.password) {
      visiblePass1 = !visiblePass1;
    } else if (status == StringsEn.confirmNewPass) {
      visiblePass2 = !visiblePass2;
    }
    emit(VisibleState());
  }

  registerButton(context, current) async {
    ///create account
    if (formKey.currentState!.validate()) {
      if (controller.isAnimating) {
        stopResetController();
      }
      current == 1
          ? BlocProvider.of<ChangeSignUpCurrentPageCubit>(context).change(2)
          : signUp();
    } else {
      if (!controller.isAnimating) {
        controller
          ..forward()
          ..repeat();
      }
    }
    Future.delayed(
      const Duration(seconds: 1),
      () => stopResetController(),
    );
  }

  void stopResetController() {
    controller.stop();
    controller.reset();
  }

  signUp() async {
    await _signUpUseCase
        .call(
          UserModel(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            age: age,
            address: address,
            city: city,
            state: stat,
            gender: selectedGender.name,
          ),
        )
        .then(
          (value) => value.fold(
            (failure) {
              emit(
                SignUpFailure(message: failure.message),
              );
            },
            (user) {
              saveTokenLocal(user.token!);
              emit(SignUpLoaded());
            },
          ),
        );
  }

  saveTokenLocal(String token) async {
    await FlutterSecureStorageEncrypted.writeData(
      StringsEn.token,
      token,
    );
  }
}
