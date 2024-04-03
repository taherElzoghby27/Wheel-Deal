import 'package:cars/core/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/create_new_pass_body.dart';
import 'widgets/leading_button_icon_app_bar.dart';

class CreatePassView extends StatelessWidget {
  const CreatePassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIconButtonAppBar(
          onTap: () => GoRouter.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(StringsEn.resetPass),
      ),
      body: const CreateNewPassBody(),
    );
  }
}
