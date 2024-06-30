import 'package:cars/core/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';

class SectionSearch extends StatelessWidget {
  const SectionSearch({
    super.key,
    required this.onChanged,
    this.controller,
    required this.hint,
    this.trailingWidget,
  });

  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String hint;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///back
        IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),

        ///search field
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: CustomTextField(
              perfixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
              hint: hint,
              border: AppConsts.normalBorderField.copyWith(
                borderRadius: BorderRadius.circular(35),
              ),
              onChanged: onChanged,
              controller: controller,
            ),
          ),
        ),
        trailingWidget ?? Container(),
      ],
    );
  }
}
