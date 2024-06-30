import 'package:cars/core/theming/style.dart';
import 'package:cars/features/search/presentation/widgets/Filter_field.dart';
import 'package:cars/features/search/presentation/widgets/get_brands_dialog_bloc_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/strings.dart';
import '../../../../../core/widgets/text_form_field.dart';
import 'bloc_builder_prev_car.dart';
import 'done_button_bloc_consumer.dart';
import 'rating_bloc_builder.dart';

class PreviousCarBody extends StatelessWidget {
  const PreviousCarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),

          //previous car brand
          const FilterField(
            label: StringsEn.brand,
            widget: GetBrandsDialogBlocBuilder(),
          ),

          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          //previous car
          const BlocBuilderPrevCar(),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          //rating
          const CustomTextFormField(
            hint: StringsEn.rating,
            readOnly: true,
            suffixIcon: RatingBlocBuilder(),
          ),

          const Spacer(),

          //continue
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
            child: const DoneButtonBlocConsumer(),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
        ],
      ),
    );
  }
}
