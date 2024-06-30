import 'package:cars/core/widgets/custom_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/strings.dart';
import 'widgets/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarScaffold(
        title: StringsEn.chat,
      ),
      body: SafeArea(
        child: ChatBody(),
      ),
    );
  }
}
