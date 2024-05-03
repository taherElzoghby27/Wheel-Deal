import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: CustomTextField(
        filled: AppConsts.neutral400.withOpacity(.05),
        perfixIcon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Theme.of(context).canvasColor.withOpacity(.5),
        ),
        suffixIcon: Icon(
          Icons.tune,
          color: Theme.of(context).canvasColor.withOpacity(.5),
        ),
        hint: StringsEn.findAnyCar,
        readOnly: true,
        onTap: () => GoRouter.of(context).push(searchPath),
        border: AppConsts.normalBorderField.copyWith(
          borderRadius: AppConsts.mainRadius,
        ),
      ),
    );
  }
}
