import 'package:cars/features/chats/presentation/view/widgets/chats_body.dart';
import 'package:flutter/material.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatsBody(),
    );
  }
}
