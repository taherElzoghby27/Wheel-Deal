import 'package:cars/core/consts/style.dart';
import 'package:cars/features/splash/presentation/view/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConsts.whiteSplash,
      body: SafeArea(
        child: SplashBody(),
      ),
    );
  }
}
