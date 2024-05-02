import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/delete_account_body.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: StringsEn.changePassword,
      ),
      body: const SafeArea(
        child: DeleteAccountBody(),
      ),
    );
  }
}
