import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeleteAccountBody extends StatelessWidget {
  const DeleteAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
          Text(
            StringsEn.deleteAccountHint,
            style: AppConsts.style14.copyWith(
              fontWeight: FontWeight.w400,
              color: AppConsts.neutral400,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          TextButton(

            onPressed: () => GoRouter.of(context).push(deleteAccountVerifiPath),
            child: Text(
              StringsEn.deleteMyAccount,
              style: AppConsts.style16.copyWith(
                fontWeight: FontWeight.w600,
                color: AppConsts.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
