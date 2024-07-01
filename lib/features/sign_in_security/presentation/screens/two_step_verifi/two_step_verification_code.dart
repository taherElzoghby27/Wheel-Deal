
import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:cars/features/sign_in_security/presentation/widgets/two_step_verification_code_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TwoStepVerificationCodeView extends StatelessWidget {
  const TwoStepVerificationCodeView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: title,
      ),
      body: const SafeArea(
        child: TwoStepVerificationCodeBody(),
      ),
    );
  }
}
