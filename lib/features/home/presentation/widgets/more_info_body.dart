import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/home/presentation/view_model/recommendation_feature_cubit/recommendation_feature_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import 'continue_button_bloc_consumer.dart';

class MoreInfoBody extends StatelessWidget {
  const MoreInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),

          CustomTextFormField(
            hint: StringsEn.salary,
            controller:
                context.read<RecommendationFeatureCubit>().incomeController,
          ),
          const Spacer(),

          //continue
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
            child: const ContinueButtonBlocConsumer(),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
        ],
      ),
    );
  }
}
