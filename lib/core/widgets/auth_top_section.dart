import 'package:cars/core/consts/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTopSection extends StatelessWidget {
  const AuthTopSection({
    super.key,
    required this.title,
    required this.subTitle,
    required this.widget,
  });

  final String title;
  final String subTitle;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppConsts.style28.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),

        ///create account sub title
        Text(subTitle, style: AppConsts.style16),
      ],
    );
  }
}
