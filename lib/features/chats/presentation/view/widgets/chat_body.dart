import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:cars/core/widgets/custom_button_three_widget.dart';
import 'package:cars/features/chats/presentation/view/widgets/section_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/strings.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: size.height * .02.h),
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
