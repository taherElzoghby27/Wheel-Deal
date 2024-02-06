// ignore_for_file: constant_identifier_names

import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/widgets/or_sign_up_with_account_widget.dart';
import 'package:cars/features/auth/presentation/view/widgets/remeber_me_widget.dart';
import 'package:cars/features/auth/presentation/view/widgets/sign_with_google_and_facebook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/auth_top_section.dart';
import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/fade_animation_widget.dart';
import '../../../../../core/widgets/small_loading_widget.dart';
import '../../../../../core/widgets/text_form_field.dart';

enum AuthMode { SignUp, Login, ResetPassword }

class AuthBody extends StatefulWidget {
  const AuthBody({super.key});

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> with TickerProviderStateMixin {
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
    offsetAnimation = TweenSequence(
      <TweenSequenceItem<Offset>>[
        TweenSequenceItem(
          tween: Tween(begin: const Offset(0, 0), end: const Offset(-.04, 0)),
          weight: 25,
        ),
        TweenSequenceItem(
          tween: Tween(begin: const Offset(-.04, 0), end: const Offset(0, 0)),
          weight: 25,
        ),
        TweenSequenceItem(
          tween: Tween(begin: const Offset(0, 0), end: const Offset(.04, 0)),
          weight: 25,
        ),
        TweenSequenceItem(
          tween: Tween(begin: const Offset(.04, 0), end: const Offset(0, 0)),
          weight: 25,
        ),
      ],
    ).animate(controller);
    super.initState();
  }

  AuthMode _authMode = AuthMode.SignUp;
  String? name;
  String? email;
  String? password;

  bool visible = true;
  bool isLoading = false;

  ///switch auth mode
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() => _authMode = AuthMode.SignUp);
    } else {
      setState(() => _authMode = AuthMode.Login);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Form(
        key: _formKey,
        child: FadeAnimation(
          millSeconds: 1000,
          child: ListView(
            children: [
              ///top section
              AuthTopSection(
                title: _authMode == AuthMode.ResetPassword
                    ? StringsEn.resetPass
                    : _authMode == AuthMode.Login
                        ? StringsEn.login
                        : StringsEn.createAccount,
                subTitle: _authMode == AuthMode.ResetPassword
                    ? StringsEn.enterEmailAddressYouUsed
                    : _authMode == AuthMode.Login
                        ? StringsEn.pleaseLoginToFindJop
                        : StringsEn.pleaseCreateAccount,
                widget: Container(),
              ),
              //fields
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return AnimatedSlide(
                    offset: offsetAnimation.value,
                    duration: const Duration(milliseconds: 200),
                    child: SizedBox(
                      height: size.height * .375.h,
                      child: Column(
                        children: [
                          ///username
                          _authMode == AuthMode.ResetPassword
                              ? Container()
                              : _authMode == AuthMode.Login
                                  ? Container()
                                  : CustomTextFormField(
                                      perfixIcon:
                                          Image.asset(Assets.imagesProfilePng),
                                      hint: StringsEn.userName,
                                      onChanged: (String? value) =>
                                          name = value,
                                    ),
                          SizedBox(height: size.height * .0175.h),

                          ///Email

                          CustomTextFormField(
                            perfixIcon: Image.asset(Assets.imagesSms),
                            hint: StringsEn.email,
                            onChanged: (String? value) => email = value,
                          ),
                          SizedBox(height: size.height * .0175.h),

                          ///Password
                          _authMode == AuthMode.ResetPassword
                              ? Container()
                              : CustomTextFormField(
                                  perfixIcon: Image.asset(Assets.imagesLockPng),
                                  hint: StringsEn.password,
                                  obscureText: visible,
                                  onChanged: (String? value) =>
                                      password = value,
                                ),
                          _authMode == AuthMode.Login
                              ?

                              ///remeber me
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const RemeberMeWidget(),
                                    SizedBox(width: size.width * .2.w),
                                    TextButton(
                                      onPressed: () => setState(
                                        () =>
                                            _authMode = AuthMode.ResetPassword,
                                      ),
                                      child: Text(
                                        StringsEn.forgotPass,
                                        style: AppConsts.style14.copyWith(
                                          color: AppConsts.primary500,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  );
                },
              ),

              ///already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _authMode == AuthMode.ResetPassword
                        ? StringsEn.youRemeberYourPassword
                        : _authMode == AuthMode.Login
                            ? StringsEn.dontHaveAccount
                            : StringsEn.alreadyHaveAccount,
                    style: AppConsts.style14,
                  ),
                  TextButton(
                    onPressed: () => _switchAuthMode(),
                    child: Text(
                      _authMode == AuthMode.Login &&
                              _authMode != AuthMode.ResetPassword
                          ? StringsEn.register
                          : StringsEn.login,
                      style: AppConsts.style14.copyWith(
                        color: AppConsts.primary500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * .01.h),

              ///Create account or login or reset pass
              AspectRatio(
                aspectRatio:AppConsts.aspectRatioButtonAuth.sp,
                child: Visibility(
                  visible: !isLoading,
                  replacement: const LoadingWidget(),
                  child: CustomButton(
                    text: _authMode == AuthMode.ResetPassword
                        ? StringsEn.requestPass
                        : _authMode == AuthMode.Login
                            ? StringsEn.login
                            : StringsEn.createAccount,
                    onTap: () {
                      ///create account
                      if (_formKey.currentState!.validate()) {
                        _authMode == AuthMode.SignUp ? register() : login();
                        if (controller.isAnimating) {
                          controller.stop();
                          controller.reset();
                        }
                        navigateToAnotherPage();
                      } else {
                        if (!controller.isAnimating) {
                          controller
                            ..forward()
                            ..repeat();
                        }
                      }
                      Future.delayed(const Duration(seconds: 1), () {
                        controller.stop();
                        controller.reset();
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height * .015.h),
              _authMode == AuthMode.ResetPassword
                  ? Container()
                  : Column(
                      children: [
                        ///or sign up with account
                        OrSignUpOrSignInWithAccountWidget(
                          label: _authMode == AuthMode.Login
                              ? StringsEn.orLoginWithAccount
                              : StringsEn.orSignUp,
                        ),
                        SizedBox(height: size.height * .0175.h),
                        SignWithGoogleAndFaceBookWidget(size: size),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

//login
  login() {}

  //register
  register() {}

  //navigate to another page
  navigateToAnotherPage() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    // ignore: use_build_context_synchronously
    GoRouter.of(context).pushReplacement(
      _authMode == AuthMode.ResetPassword
          ? createPassPath
          : _authMode == AuthMode.Login
              ? navPath
              : navPath,
    );
  }
}
