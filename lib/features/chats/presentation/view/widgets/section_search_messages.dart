
import 'package:cars/core/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/consts/strings.dart';

class SectionSearchMessages extends StatelessWidget {
  const SectionSearchMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          const Spacer(flex: 1),
          Expanded(
            flex: 12,
            child: CustomTextField(
              perfixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
              hint: StringsEn.searchMessages,
              controller: TextEditingController(),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
