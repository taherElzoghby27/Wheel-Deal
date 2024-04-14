import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:cars/core/widgets/text_field.dart';
import 'package:cars/features/chats/presentation/view/widgets/chat_bubble.dart';
import 'package:cars/features/chats/presentation/view/widgets/chat_bubble_for_friends.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionChat extends StatelessWidget {
  const SectionChat({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Column(
        children: [
          //list of messages
          Expanded(
            child: Container(
              color: AppConsts.neutral200.withOpacity(.5),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView.builder(
                reverse: true,
                physics: const BouncingScrollPhysics(),
                itemCount: messages_lists.length,
                itemBuilder: (BuildContext context, int index) {
                  return 1 == messages_lists[index].id
                      ? ChatBubble(message: messages_lists[index])
                      : ChatBubbForFriend(message: messages_lists[index]);
                },
              ),
            ),
          ),
          //field ->write a messsage
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioNavBar,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  SizedBox(width: size.width * .01.w),
                  //asset
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CustomSquareButton(
                      icon: Icons.mic_rounded,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: size.width * .02.w),
                  //write a message
                  Expanded(
                    child: CustomTextField(
                      hint: StringsEn.writeAMessage,
                      controller: TextEditingController(),
                    ),
                  ),
                  SizedBox(width: size.width * .02.w),
                  //microphone
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CustomSquareButton(
                      icon: Icons.send,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: size.width * .01.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
