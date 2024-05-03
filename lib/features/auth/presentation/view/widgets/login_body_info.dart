import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/auth_top_section.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/small_loading_widget.dart';
import 'login_fields_component.dart';
import 'replacement_auth_widget.dart';

class LoginBodyInfo extends StatefulWidget {
  const LoginBodyInfo({super.key});

  @override
  State<LoginBodyInfo> createState() => _LoginBodyInfoState();
}

class _LoginBodyInfoState extends State<LoginBodyInfo>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    //init controller
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    //offset animation

    offsetAnimation = TweenSequence(itemsSequences).animate(controller);
    super.initState();
  }

  bool isLoading = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Form(
        key: _formKey,
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
              animation: controller,
              builder: (context, child) {
                return AnimatedSlide(
                  offset: offsetAnimation.value,
                  duration: const Duration(milliseconds: 200),
                  child: const LoginFieldComponent(),
                );
              },
            ),
            const AspectRatio(
              aspectRatio: AppConsts.aspectRatio20on1,
            ),
            //login
            AspectRatio(
              aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
              child: Visibility(
                visible: !isLoading,
                replacement: const LoadingWidget(),
                child: CustomButton(
                  text: StringsEn.login,
                  onTap: loginButton,
                ),
              ),
            ),
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

  loginButton() async {
    ///create account
    if (_formKey.currentState!.validate()) {
      //login
      if (controller.isAnimating) {
        stopAnimation();
      }
      GoRouter.of(context).pushReplacement(navPath);
    } else {
      if (!controller.isAnimating) {
        startAnimation();
      }
      Future.delayed(
        const Duration(seconds: 1),
        () {
          stopAnimation();
        },
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
}
