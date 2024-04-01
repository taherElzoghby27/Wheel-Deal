import 'package:cars/core/consts/routesPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/strings.dart';
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
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).canvasColor,
                ),
          ),
        ),
      ],
    );
  }
}
