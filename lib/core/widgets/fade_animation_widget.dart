import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  const FadeAnimation(
      {super.key, required this.child, required this.millSeconds});

  final Widget child;

  final int millSeconds;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .1, end: 1),
      duration: Duration(milliseconds: millSeconds),
      builder: (context, angle, child) => AnimatedOpacity(
        opacity: angle,
        duration: Duration(milliseconds: 250),
        child: child,
      ),
      child: child,
    );
  }
}
