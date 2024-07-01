import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/features/sign_in_security/domain/entities/sign_in__security_type_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'sign_in_security_tile.dart';

class SignInSecurityBody extends StatelessWidget {
  const SignInSecurityBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
          SignInSecurityTile(
            leading: StringsEn.emailAddress,
            subLeading: StringsEn.changeEmailAddress,
            onTap: () {
              GoRouter.of(context).push(emailAddressPath);
              SignInSecurityType.type = SignInType.email;
            },
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          SignInSecurityTile(
            leading: StringsEn.changePassword,
            subLeading: StringsEn.chooseUniquePassword,
            onTap: () {
              GoRouter.of(context).push(changePasswordPath);
              SignInSecurityType.type = SignInType.password;
            },
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          SignInSecurityTile(
            leading: StringsEn.twoStepVerifi,
            subLeading: StringsEn.activateThisFeatureForEnhancedAccount,
            onTap: () => GoRouter.of(context).push(twoStepVerificationPath),
          ),
        ],
      ),
    );
  }
}
