import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/consts/strings.dart';
import 'tile_settings.dart';

class ReceiveMarketingWidget extends StatelessWidget {
  const ReceiveMarketingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TileSetting(
      leading: StringsEn.receiveMarketing,
      trailing:  Switch.adaptive(
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
