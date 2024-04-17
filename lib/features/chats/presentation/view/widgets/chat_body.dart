import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'tile_chat.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppConsts.mainPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HandleImageWidget(image: Assets.chatIcon),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            const Text(
              StringsEn.howCanWeHelpYou,
              style: AppConsts.style20,
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
            TileChat(
              image: Assets.help,
              label: StringsEn.faq,
              onTap: () {},
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
            TileChat(
              image: Assets.chatIcon,
              label: StringsEn.contactLiveChat,
              onTap: () => GoRouter.of(context).push(chatSupportPath),
            ),
          ],
        ),
      ),
    );
  }
}
