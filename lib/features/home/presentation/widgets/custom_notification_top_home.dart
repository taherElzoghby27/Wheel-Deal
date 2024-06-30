import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cars/core/theming/style.dart';

class CustomNotificationTopHome extends StatelessWidget {
  const CustomNotificationTopHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CustomSquareButton(
          icon: Icons.notifications,
          onTap: () => GoRouter.of(context).push(notificationPath),
          color: AppConsts.neutral100.withOpacity(.05),
        ),
        Positioned(
          top: size.height * .015,
          left: 15,
          right: 0,
          child: const CircleAvatar(
            radius: 4,
            backgroundColor: AppConsts.mainColor,
          ),
        ),
      ],
    );
  }
}
