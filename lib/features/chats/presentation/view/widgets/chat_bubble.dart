import 'package:cars/core/consts/style.dart';
import 'package:cars/features/chats/data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: size.width * .75.w,
          decoration: AppConsts.decorationChatBubble,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //message
                Text(
                  message.message,
                  style: AppConsts.style14Bubble,
                ),
                //time
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    message.time,
                    style:
                        AppConsts.style12.copyWith(color: AppConsts.neutral500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
