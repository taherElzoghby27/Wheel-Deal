import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/consts/routesPage.dart';
import 'section_search_messages.dart';
import 'section_messages.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const AspectRatio(aspectRatio:  AppConsts.aspectRatioTopSpace),

        //custom appBar
        CustomAppBar(
          title: StringsEn.messages,
          trailingWidget: Container(),
        ),
        SizedBox(height: size.height * .01.h),
        const SectionSearchMessages(),
        //messages
        const SectionMessages(),
        // EmptyWidget(
        //   icon: AppAssets.noMessages,
        //   title: StringsEn.youHaveNotReceivedMessages,
        //   subTitle: StringsEn.onceYourAppHasReached,
        // ),
      ],
    );
  }
}
