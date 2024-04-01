import 'package:cars/core/consts/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTopSection extends StatelessWidget {
  const AuthTopSection({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),

        ///create account sub title
        Text(subTitle, style: AppConsts.style16),
      ],
    );
  }
}
