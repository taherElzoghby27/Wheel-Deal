import 'package:cars/core/helper/data.dart';
import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

import 'chat_bubble.dart';
import 'chat_bubble_for_friends.dart';
import 'section_send_message.dart';

class ChatSupportBody extends StatelessWidget {
  const ChatSupportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //list of messages
        Expanded(
          child: Container(
            padding: AppConsts.padding8h,
            child: ListView.builder(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemCount: messagesLists.length,
              itemBuilder: (BuildContext context, int index) {
                return 1 == messagesLists[index].id
                    ? ChatBubble(message: messagesLists[index])
                    : ChatBubbForFriend(message: messagesLists[index]);
              },
            ),
          ),
        ),
        //field ->write a messsage
        const SectionSendMessage(),
      ],
    );
  }
}
