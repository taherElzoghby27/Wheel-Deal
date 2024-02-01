import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/features/home/presentation/view/widgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title
        Padding(
          padding: AppConsts.mainPadding,
          child: Text(
            StringsEn.categories,
            style: AppConsts.style20.copyWith(color: AppConsts.neutral900),
          ),
        ),
        SizedBox(height: size.height * .01.h),
        //categories section
        const Categories(),
      ],
    );
  }
}
