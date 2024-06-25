import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/methods.dart';
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
  String? _firstName;
  String? _lastName;
  String? _phone;
  String? _age;
  String? _email;
  String? _address;
  String? _password;
  String? _confirmPassword;
  String? _city;
  String? _stat;

  String get firstName => _firstName!;

  String get lastName => _lastName!;

  String get phone => _phone!;

  String get age => _age!;

  String get email => _email!;

  String get address => _address!;

  String get password => _password!;

  String get confirmPassword => _confirmPassword!;

  String get city => _city!;

  String get stat => _stat!;

  void onChangeValue(String status, String value) {
    if (status == StringsEn.firstName) {
      _firstName = value;
    } else if (status == StringsEn.lastName) {
      _lastName = value;
    } else if (status == StringsEn.email) {
      _email = value;
    } else if (status == StringsEn.password) {
      _password = value;
    } else if (status == StringsEn.confirmNewPass) {
      _confirmPassword = value;
    } else if (status == StringsEn.age) {
      _age = value;
    } else if (status == StringsEn.phone) {
      _phone = value;
    } else if (status == StringsEn.state) {
      _stat = value;
    } else if (status == StringsEn.city) {
      _city = value;
    } else if (status == StringsEn.address) {
      _address = value;
    }
    emit(ChangeValueState());
  }

  Gender selectedGender = Gender.Male;
  bool visiblePass1 = true;
  bool visiblePass2 = true;

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
    emit(SignUpLoading());
    await _signUpUseCase
        .call(
          UserModel(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            age: int.parse(age),
            address: address,
            city: city,
            state: stat,
            gender: selectedGender.name,
            phone: phone,
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
              saveTokenLocal(StringsEn.token, user.token!);
              emit(SignUpLoaded());
            },
          ),
        );
  }
}
