import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_button_three_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../home/presentation/view/widgets/top_leading_trailing.dart';
import 'content_bottom_sheet_logout.dart';

class SectionUtilities extends StatelessWidget {
  const SectionUtilities({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const TopLeadingTrailing(
            leading: StringsEn.utilities,
            leadingColor: AppConsts.mainColor,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
          CustomButtonThreeWidget(
            leading: Icon(
              FontAwesomeIcons.userCheck,
              color: Theme.of(context).canvasColor.withOpacity(.8),
            ),
            title: StringsEn.accountVerifi,
            onTap: () => GoRouter.of(context).push(verificationWelcomePath),
          ),
          CustomButtonThreeWidget(
            leading: Icon(
              Icons.lock,
              color: Theme.of(context).canvasColor.withOpacity(.8),
            ),
            title: StringsEn.signInSecurity,
            onTap: () => GoRouter.of(context).push(signInSecurityPath),
          ),
          CustomButtonThreeWidget(
            leading: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).canvasColor.withOpacity(.8),
            ),
            title: StringsEn.setting,
            onTap: () => GoRouter.of(context).push(settingsPath),
          ),
          CustomButtonThreeWidget(
            leading: Icon(
              Icons.privacy_tip,
              color: Theme.of(context).canvasColor.withOpacity(.8),
            ),
            title: StringsEn.privacyPolicy,
            onTap: () {},
          ),
          CustomButtonThreeWidget(
            leading: Icon(
              FontAwesomeIcons.trash,
              color: Theme.of(context).canvasColor.withOpacity(.8),
            ),
            title: StringsEn.deleteAccount,
            onTap: () => GoRouter.of(context).push(deleteAccountPath),
          ),
          CustomButtonThreeWidget(
            leading: const Icon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: AppConsts.mainColor,
            ),
            title: StringsEn.logout,
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Theme.of(context).splashColor,
                builder: (context) => const ContentBottomSheetLogout(),
              );
            },
            color: AppConsts.danger500,
          ),
        ],
      ),
    );
  }
}
