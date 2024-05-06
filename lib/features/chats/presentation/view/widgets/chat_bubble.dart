import 'package:cars/core/consts/assets.dart';
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Theme.of(context).canvasColor,
            backgroundImage: const AssetImage(Assets.callCenter),
          ),
          Padding(
            padding: AppConsts.padding6,
            child: Container(
              width: size.width * .65.w,
              decoration: AppConsts.decorationChatBubble.copyWith(
                color: Theme.of(context).canvasColor.withOpacity(.05),
              ),
              child: Padding(
                padding: AppConsts.padding8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //message
                    Text(
                      message.message,
                      style: AppConsts.style14Bubble.copyWith(
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                    //time
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        message.time,
                        style: AppConsts.style12
                            .copyWith(color: AppConsts.neutral500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
