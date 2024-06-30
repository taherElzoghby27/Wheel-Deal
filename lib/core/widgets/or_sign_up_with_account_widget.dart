import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrSignUpOrSignInWithAccountWidget extends StatelessWidget {
  const OrSignUpOrSignInWithAccountWidget({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Divider(
            color: AppConsts.neutral300,
            endIndent: size.width * .05.w,
          ),
        ),
        Text(label, style: AppConsts.style14),
        Expanded(
          child: Divider(
            color: AppConsts.neutral300,
            indent: size.width * .05.w,
          ),
        ),
      ],
    );
  }
}
