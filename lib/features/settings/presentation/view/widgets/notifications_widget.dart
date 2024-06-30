import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/strings.dart';
import 'tile_settings.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TileSetting(
      leading: StringsEn.notifications,
      trailing: Switch.adaptive(
        value: false,
        activeTrackColor: AppConsts.mainColor,
        thumbColor: MaterialStateProperty.all(
          AppConsts.neutral100,
        ),
        inactiveTrackColor: Theme.of(context).canvasColor.withOpacity(.1),
        onChanged: (value) {},
      ),
    );
  }
}
