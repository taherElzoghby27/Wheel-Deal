import 'package:cars/features/auth/presentation/view/auth_view.dart';
import 'package:cars/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

const String splashPath = '/';
const String authPath = '/auth';
// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: splashPath,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: authPath,
      builder: (context, state) => const AuthView(),
    ),
  ],
);
