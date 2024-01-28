import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //fade
      const beginF = 0.0;
      const endF = 1.0;
      final tweenAnimF = Tween(begin: beginF, end: endF);
      final fadeTrans = animation.drive(tweenAnimF);
      //slide
      const beginS = Offset(-1, 0);
      const endS = Offset(0, 0);
      final tweenAnimS = Tween(begin: beginS, end: endS);
      final slideTrans = animation.drive(tweenAnimS);

      //slide
      return FadeTransition(
        opacity: fadeTrans,
        child: SlideTransition(
          position: slideTrans,
          child: child,
        ),
      );
    },
  );
}
