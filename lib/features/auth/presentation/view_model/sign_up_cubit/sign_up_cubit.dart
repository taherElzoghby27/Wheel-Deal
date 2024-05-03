import 'package:bloc/bloc.dart';
import 'package:cars/features/auth/presentation/view_model/change_current_sign_up_cubit/change_sign_up_current_page_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/routesPage.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final GlobalKey<FormState> formKey = GlobalKey();
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;

  registerButton(context, current) async {
    ///create account
    if (formKey.currentState!.validate()) {
      if (controller.isAnimating) {
        controller.stop();
        controller.reset();
      }
      current == 1
          ? BlocProvider.of<ChangeSignUpCurrentPageCubit>(context).change(2)
          : register(context);
    } else {
      if (!controller.isAnimating) {
        controller
          ..forward()
          ..repeat();
      }
    }
    Future.delayed(
      const Duration(seconds: 1),
      () {
        controller.stop();
        controller.reset();
      },
    );
  }

  register(context) {
    GoRouter.of(context).pushReplacement(navPath);
  }
}
