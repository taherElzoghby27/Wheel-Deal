import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

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
      () => GoRouter.of(context).pushReplacement(boardPath),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          const Text(StringsEn.logo, style: AppConsts.style30),
          SizedBox(height: size.height * .0025),
          //animation
          SizedBox(
            height: size.height * .15,
            child: Lottie.asset(Assets.imagesLoadCar),
          ),
        ],
      ),
    );
  }
}
