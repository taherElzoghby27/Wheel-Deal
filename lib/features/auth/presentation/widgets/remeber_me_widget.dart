import 'package:flutter/material.dart';

import '../../../../core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';

class RemeberMeWidget extends StatelessWidget {
  const RemeberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
          activeColor: AppConsts.mainColor,
        ),
         Text(
          StringsEn.remeberMe,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
