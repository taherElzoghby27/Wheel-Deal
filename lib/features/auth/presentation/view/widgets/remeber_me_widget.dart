import 'package:flutter/material.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';

class RemeberMeWidget extends StatelessWidget {
  const RemeberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
          activeColor: AppConsts.primary500,
        ),
        const Text(StringsEn.remeberMe, style: AppConsts.style14),
      ],
    );
  }
}
