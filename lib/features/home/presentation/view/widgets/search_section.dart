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
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: CustomTextField(
        perfixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
        hint: StringsEn.search,
        onTap: () => GoRouter.of(context).push(''),
        border: AppConsts.normalBorderField.copyWith(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }
}
