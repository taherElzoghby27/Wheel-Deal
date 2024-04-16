import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/widgets/custom_divider.dart';
import 'package:cars/core/widgets/fade_animation_widget.dart';
import 'package:cars/core/widgets/logo_title_icon_widget.dart';
import 'package:cars/core/widgets/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';

class SectionMessages extends StatelessWidget {
  const SectionMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          //unread     read all messages
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioTileWidget,
            child: TileWidget(
              label: StringsEn.unRead,
              trailingLabel: StringsEn.readAllMessages,
              trailingOnTap: () {},
            ),
          ),
          //chats
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FadeAnimation(
                    millSeconds: 250,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: LogoTitleIconWidget(chat: chatsList[0]),
                    ),
                  );
                },
                itemCount: chatsList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const CustomDivider(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
