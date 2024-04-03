import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/auth_top_section.dart';
import '../../../../../core/widgets/customButton.dart';
import 'create_pass_component.dart';

class CreateNewPasswordBodyInfo extends StatefulWidget {
  const CreateNewPasswordBodyInfo({super.key});

  @override
  State<CreateNewPasswordBodyInfo> createState() =>
      _CreateNewPasswordBodyInfoState();
}

class _CreateNewPasswordBodyInfoState extends State<CreateNewPasswordBodyInfo>
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
            const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

            ///top section
            const AuthTopSection(
              title: StringsEn.createNewPassword,
              subTitle: StringsEn.setYourNewPass,
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
                    child: const CreatePassComponent(),
                  );
                },
              ),
            ),

            const AspectRatio(aspectRatio: AppConsts.aspectRatio16on7),

            ///Create account or login or reset pass
            AspectRatio(
              aspectRatio: AppConsts.aspectRatioButtonAuth,
              child: CustomButton(
                text: StringsEn.createNewPassword,
                onTap: createPassButton,
              ),
            ),
          ],
        ),
      ),
    );
  }

  createPassButton() async {
    if (_formKey.currentState!.validate()) {
      //login
      if (controller.isAnimating) {
        stopAnimation();
      }
      GoRouter.of(context).pushReplacement(homePath);
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
}
