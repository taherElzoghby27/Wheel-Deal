import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/strings.dart';

class SectionNote extends StatelessWidget {
  const SectionNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringsEn.codeNote,
          style: AppConsts.style12.copyWith(
            color: Theme.of(context).canvasColor.withOpacity(.5),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            StringsEn.resendCode,
            style: AppConsts.style12.copyWith(
              color: AppConsts.mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
