import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/auth_top_section.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/auth/presentation/view/widgets/login_fields_component.dart';
import 'package:cars/features/auth/presentation/view/widgets/remeber_me.dart';
import 'package:cars/features/auth/presentation/view/widgets/replacement_auth_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/small_loading_widget.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> with TickerProviderStateMixin {
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

  bool isLoading = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.padding15H10V,
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const AspectRatio(aspectRatio: AppConsts.aspectRatio16on3),

            ///top section
            AuthTopSection(
              title: StringsEn.login,
              subTitle: StringsEn.pleaseLoginToFindJop,
              widget: Container(),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

            //fields
            AspectRatio(
              aspectRatio: AppConsts.aspect16on14,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return AnimatedSlide(
                    offset: offsetAnimation.value,
                    duration: const Duration(milliseconds: 200),
                    child: const LoginFieldComponent(),
                  );
                },
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio16on7),
            //don't have an account
            ReplacementAuthWidget(
              label: StringsEn.dontHaveAccount,
              trailing: StringsEn.register,
              onTap: () => GoRouter.of(context).pushReplacement(
                createAccountPath,
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),

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
        controller.stop();
        controller.reset();
      }
      GoRouter.of(context).pushReplacement(homePath);
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
}
