import 'package:flutter/material.dart';
import 'auth_top_page.dart';
import 'login_body_info.dart';
import 'package:cars/core/theming/style.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 2,
          child: AuthTopPage(),
        ),
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppConsts.radiusTop30,
              color: Theme.of(context).splashColor,
            ),
            child: const LoginBodyInfo(),
          ),
        ),
      ],
    );
  }
}
