import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/auth_top_section.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/auth/presentation/view/widgets/create_account_component1.dart';
import 'package:cars/features/auth/presentation/view/widgets/create_account_component2.dart';
import 'package:cars/features/auth/presentation/view/widgets/replacement_auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/customButton.dart';

class CreateAccountBody extends StatefulWidget {
  const CreateAccountBody({super.key});

  @override
  State<CreateAccountBody> createState() => _CreateAccountBodyState();
}

class _CreateAccountBodyState extends State<CreateAccountBody>
    with SingleTickerProviderStateMixin {
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
  int current = 1;

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
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            current == 1
                ? Container()
                : Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => setState(() => current = 1),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

            ///top section
            AuthTopSection(
              title: StringsEn.createAccount,
              subTitle: StringsEn.pleaseCreateAccount,
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

            //fields
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return AnimatedSlide(
                  offset: offsetAnimation.value,
                  duration: const Duration(milliseconds: 200),
                  child: current == 1
                      ? const CreateAccountComponent1()
                      : const CreateAccountComponent2(),
                );
              },
            ),
            current == 1
                ? const AspectRatio(aspectRatio: AppConsts.aspectRatio16on7)
                :  const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            //already have an account
            ReplacementAuthWidget(
              label: StringsEn.alreadyHaveAccount,
              trailing: StringsEn.login,
              onTap: () => GoRouter.of(context).pushReplacement(
                loginPath,
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),

            //register
            AspectRatio(
              aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
              child: Visibility(
                visible: !isLoading,
                replacement: const LoadingWidget(),
                child: CustomButton(
                  text: current == 1 ? StringsEn.next : StringsEn.register,
                  onTap: registerButton,
                ),
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
          ],
        ),
      ),
    );
  }

  registerButton() async {
    ///create account
    if (_formKey.currentState!.validate()) {
      if (controller.isAnimating) {
        controller.stop();
        controller.reset();
      }
      current == 1 ? setState(() => current = 2) : register();
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

  register() {
    GoRouter.of(context).pushReplacement(homePath);
  }
}
