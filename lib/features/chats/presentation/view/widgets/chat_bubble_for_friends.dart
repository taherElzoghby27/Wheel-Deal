import 'package:cars/core/theming/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/features/chats/data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubbForFriend extends StatelessWidget {
  const ChatBubbForFriend({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: AppConsts.padding6,
            child: Padding(
              padding: AppConsts.padding4,
              child: Container(
                width: size.width * .65.w,
                decoration: AppConsts.decorationChatBubbleForFriend,
                child: Padding(
                  padding: AppConsts.padding8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.message,
                        style: AppConsts.style14Bubble.copyWith(
                          color: AppConsts.neutral100,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "10:21",
                          style: AppConsts.style12
                              .copyWith(color: AppConsts.neutral200),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(
                'https://media.proprofs.com/images/QM/user_images/2503852/-Type-Of-Person-.webp'),
          ),
        ],
      ),
    );
  }
}
