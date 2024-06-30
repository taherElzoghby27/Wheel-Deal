import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/strings.dart';
import 'remeber_me_widget.dart';

class RemeberMe extends StatelessWidget {
  const RemeberMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const RemeberMeWidget(),
        const Spacer(),
        TextButton(
          onPressed: () => GoRouter.of(context).push(resetPassPath),
          child: Text(
            StringsEn.forgotPass,
            style: AppConsts.style12.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).canvasColor,
            ),
          ),
        ),
      ],
    );
  }
}
