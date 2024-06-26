import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/search/presentation/widgets/Filter_field.dart';
import 'package:cars/features/search/presentation/widgets/get_brands_dialog_bloc_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/text_form_field.dart';
import 'star_rating_widget.dart';

class PreviousCarBody extends StatelessWidget {
  const PreviousCarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),

        //previous car brand
        const FilterField(
          label: StringsEn.brand,
          widget: GetBrandsDialogBlocBuilder(),
        ),

        const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
        //previous car
        CustomTextFormField(
          hint: StringsEn.prevCar,
          //controller: ,
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
        //rating
        CustomTextFormField(
          hint: StringsEn.rating,
          readOnly: true,
          suffixIcon: StarRating(
            initialRating: 3.5,
            onRatingUpdate: (double value) {},
          ),
          //controller: ,
        ),

        const Spacer(),

        //continue
        AspectRatio(
          aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
          child: Visibility(
            visible: true,
            replacement: const LoadingWidget(),
            child: CustomButton(
              text: StringsEn.done,
              onTap: () {},
            ),
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
      ],
    );
  }
}
