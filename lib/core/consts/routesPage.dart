import 'package:cars/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

const String splashPath = '/';
// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: splashPath,
      builder: (context, state) => const SplashView(),
    ),
  ],
);
