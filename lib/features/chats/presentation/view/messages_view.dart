import 'package:flutter/material.dart';

import 'widgets/messages_body.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MessagesBody(),
      ),
    );
  }
}
