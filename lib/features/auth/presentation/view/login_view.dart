import 'package:flutter/material.dart';

import 'widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const SafeArea(
        child: LoginBody(),
      ),
    );
  }
}
