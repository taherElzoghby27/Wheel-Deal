import 'package:cars/core/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/leading_button_icon_app_bar.dart';
import 'widgets/reset_pass_body.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: LeadingIconButtonAppBar(
          onTap: () => GoRouter.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(StringsEn.forgotPasswordLabel),
      ),
      body: const SafeArea(
        child: ResetPassBody(),
      ),
    );
  }
}
