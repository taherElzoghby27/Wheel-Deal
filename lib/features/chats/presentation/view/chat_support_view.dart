import 'package:flutter/material.dart';

import 'widgets/chat_support_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ChatBody(),
      ),
    );
  }
}
