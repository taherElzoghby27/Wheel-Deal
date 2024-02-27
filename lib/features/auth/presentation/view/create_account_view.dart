import 'package:flutter/material.dart';

import 'widgets/create_account_body.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CreateAccountBody(),
      ),
    );
  }
}
