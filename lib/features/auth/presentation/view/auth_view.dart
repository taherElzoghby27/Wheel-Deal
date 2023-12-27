import 'package:cars/features/auth/presentation/view/widgets/auth_body.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AuthBody(),
      ),
    );
  }
}
