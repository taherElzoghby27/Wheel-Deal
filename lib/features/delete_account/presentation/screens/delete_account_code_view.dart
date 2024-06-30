import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/strings.dart';
import '../widgets/delete_account_code_body.dart';

class DeleteAccountCodeView extends StatelessWidget {
  const DeleteAccountCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: StringsEn.deleteAccount,
      ),
      body: const SafeArea(
        child: DeleteAccountCodeBody(),
      ),
    );
  }
}
