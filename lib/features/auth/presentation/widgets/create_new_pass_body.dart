import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

import 'create_new_pass_body_info.dart';

class CreateNewPassBody extends StatelessWidget {
  const CreateNewPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 13,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppConsts.radiusTop30,
              color: Theme.of(context).splashColor,
            ),
            child: const CreateNewPasswordBodyInfo(),
          ),
        ),
      ],
    );
  }
}
