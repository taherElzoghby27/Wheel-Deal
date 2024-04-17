import 'package:cars/core/consts/style.dart';
import 'package:flutter/cupertino.dart';

import 'notification_item.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return NotificationItem();
        },
        itemCount: 20,
      ),
    );
  }
}
