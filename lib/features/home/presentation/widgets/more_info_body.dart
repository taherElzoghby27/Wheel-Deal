import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/small_loading_widget.dart';

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
                text: StringsEn.continueLabel,
                onTap: () => GoRouter.of(context).pushReplacement(
                  prevCarPath,
                ),
              ),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
        ],
      ),
    );
  }
}
