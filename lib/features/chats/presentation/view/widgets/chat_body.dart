
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:cars/features/chats/presentation/view/widgets/section_chat.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const AspectRatio(aspectRatio:  AppConsts.aspectRatioTopSpace),
        //back   title   settings
        CustomAppBar(
          leadingOnTap: () => GoRouter.of(context).pop(),
          title: 'Taher elzoghby',
          trailingWidget: const Icon(Icons.call, color: AppConsts.neutral900),
          trailingOnTap: () {},
        ),
        //chat
        const SectionChat(),
      ],
    );
  }
}
