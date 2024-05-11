import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/auth_top_section.dart';
import 'package:cars/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'login_button_widget.dart';
import 'login_fields_component.dart';
import 'replacement_auth_widget.dart';

class LoginBodyInfo extends StatefulWidget {
  const LoginBodyInfo({super.key});

  @override
  State<LoginBodyInfo> createState() => _LoginBodyInfoState();
}

class _LoginBodyInfoState extends State<LoginBodyInfo>
    with TickerProviderStateMixin {
  late LoginCubit loginCubit;

  @override
  void initState() {
    loginCubit = context.read<LoginCubit>();
    //init controller
    loginCubit.controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    //offset animation

    loginCubit.offsetAnimation = TweenSequence(itemsSequences).animate(
      loginCubit.controller,
    );
    super.initState();
  }

  @override
  void dispose() {
    loginCubit.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Form(
        key: loginCubit.formKey,
        child: ListView(
          children: [
            const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),

            ///top section
            const AuthTopSection(
              title: StringsEn.welcome,
              subTitle: StringsEn.enterYourDetailsBelow,
            ),
            const AspectRatio(
              aspectRatio: AppConsts.aspectRatioTopSpace,
            ),

            //fields
            AnimatedBuilder(
              animation: loginCubit.controller,
              builder: (context, child) {
                return AnimatedSlide(
                  offset: loginCubit.offsetAnimation.value,
                  duration: const Duration(milliseconds: 200),
                  child: const LoginFieldComponent(),
                );
              },
            ),
            const AspectRatio(
              aspectRatio: AppConsts.aspectRatio20on1,
            ),
            //login
            const LoginButtonWidget(),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            //don't have an account
            ReplacementAuthWidget(
              label: StringsEn.dontHaveAccount,
              trailing: StringsEn.register,
              onTap: () => GoRouter.of(context).pushReplacement(
                createAccountPath,
              ),
            ),

            const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
          ],
        ),
      ),
    );
  }
}
