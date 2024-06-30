import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:cars/features/sign_in_security/presentation/widgets/email_address/change_email_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeEmailView extends StatelessWidget {
  const ChangeEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: StringsEn.changeEmailAddressLabel,
      ),
      body: const SafeArea(
        child: ChangeEmailBody(),
      ),
    );
  }
}
