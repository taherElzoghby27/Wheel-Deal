
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/strings.dart';
import 'remeber_me_widget.dart';

class RemeberMe extends StatelessWidget {
  const RemeberMe({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const RemeberMeWidget(),
        SizedBox(width: size.width * .2.w),
        TextButton(
          onPressed: () =>GoRouter.of(context).push(resetPassPath),
          child: Text(
            StringsEn.forgotPass,
            style: AppConsts.style14.copyWith(
              color: AppConsts.primary500,
            ),
          ),
        ),
      ],
    );
  }
}
