import 'package:cars/features/onBoarding/presentation/view/widgets/on_boarding_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/fade_animation_widget.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: FadeAnimation(
          millSeconds: 1000,
          child: OnBoardingBody(),
        ),
      ),
    );
  }
}
