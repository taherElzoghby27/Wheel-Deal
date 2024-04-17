import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/consts/strings.dart';
import 'widgets/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: StringsEn.chat,
      ),
      body: const SafeArea(
        child: ChatBody(),
      ),
    );
  }
}
