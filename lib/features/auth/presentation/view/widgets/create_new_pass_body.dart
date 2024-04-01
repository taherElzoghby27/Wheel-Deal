import 'package:cars/core/consts/routesPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/auth_top_section.dart';
import '../../../../../core/widgets/customButton.dart';
import 'create_pass_component.dart';

class CreatePassBody extends StatefulWidget {
  const CreatePassBody({super.key});

  @override
  State<CreatePassBody> createState() => _CreatePassBodyState();
}

class _CreatePassBodyState extends State<CreatePassBody>
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
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => GoRouter.of(context).pushReplacement(
                  loginPath,
                ),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

            ///top section
            AuthTopSection(
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
                text: StringsEn.resetPass,
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
