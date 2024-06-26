import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

import 'password_reset_widget.dart';

class CreatePassComponent extends StatelessWidget {
  const CreatePassComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Password
        const PasswordResetPageWidget(hint: StringsEn.password),

        ///hint
        Text(
          StringsEn.warningPass,
          style: AppConsts.style14.copyWith(color: AppConsts.neutral400),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

        ///Password
        const PasswordResetPageWidget(hint: StringsEn.confirmNewPass),

        ///hint
        Text(
          StringsEn.bothPassMustMatch,
          style: AppConsts.style14.copyWith(color: AppConsts.neutral400),
        ),
      ],
    );
  }
}
