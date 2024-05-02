import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/consts/strings.dart';
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
        inactiveTrackColor: Theme.of(context).canvasColor,
        thumbColor: MaterialStateProperty.all(
          Theme.of(context).splashColor,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
