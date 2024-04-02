import 'package:cars/core/consts/strings.dart';
import 'package:flutter/material.dart';

import 'widgets/create_account_body.dart';
import 'widgets/icon_button_sign_up_bloc_consumer.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButtonSignUpBlocConsumer(),
        centerTitle: true,
        title: const Text(StringsEn.signUp),
      ),
      body: const SafeArea(
        child: CreateAccountBody(),
      ),
    );
  }
}
