import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc_builder_section_result.dart';
import 'search_field.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

        ///section search field
        const SearchField(),
        SizedBox(height: size.height * .015.h),

        ///section result
        const BlocBuilderSectionResult(),
      ],
    );
  }
}
