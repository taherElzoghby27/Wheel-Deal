import 'package:cars/core/helper/assets.dart';
import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    _navigateToAnotherScreen();
    super.initState();
  }

//navigate to auth view
  _navigateToAnotherScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () => GoRouter.of(context).pushReplacement(gatePath),
      //() => GoRouter.of(context).pushReplacement(moreInfoPath),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: HandleImageWidget(image: Assets.logo),
    );
  }
}
