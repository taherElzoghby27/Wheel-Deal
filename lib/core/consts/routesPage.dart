import 'package:cars/features/auth/presentation/view/auth_view.dart';
import 'package:cars/features/auth/presentation/view/create_new_pass_view.dart';
import 'package:cars/features/home/presentation/view/home_view.dart';
import 'package:cars/features/onBoarding/presentation/view/on_boarding_view.dart';
import 'package:cars/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../helper/custom_animation.dart';

const String splashPath = '/';
const String boardPath = '/board';
const String authPath = '/auth';
const String homePath = '/home';
const String createPassPath = '/resetPassPath';
// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: splashPath,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: authPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const AuthView(),
      ),
    ),
    GoRoute(
      path: createPassPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const CreatePassView(),
      ),
    ),
    GoRoute(
      path: boardPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const OnBoardingView(),
      ),
    ),
    GoRoute(
      path: homePath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const HomeView(),
      ),
    ),
  ],
);
