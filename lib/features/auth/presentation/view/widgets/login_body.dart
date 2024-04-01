import 'package:cars/features/auth/presentation/view/widgets/auth_top_section.dart';
import 'package:flutter/material.dart';
import '../../../../../core/consts/style.dart';
import 'login_body_info.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 2,
          child: AuthTopSection(),
        ),
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppConsts.radiusTop15,
              color: Theme.of(context).splashColor,
            ),
            child: const LoginBodyInfo(),
          ),
        ),
      ],
    );
  }
}
