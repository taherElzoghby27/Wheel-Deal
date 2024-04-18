import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/verification_welcome_body.dart';

class VerificationWelcomeView extends StatelessWidget {
  const VerificationWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: StringsEn.verification,
      ),
      body: const SafeArea(
        child: VerificationWelcomeBody(),
      ),
    );
  }
}
