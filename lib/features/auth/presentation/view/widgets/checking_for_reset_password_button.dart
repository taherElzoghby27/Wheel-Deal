import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/auth/presentation/view_model/check_for_reset_cubit/check_for_reset_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/routesPage.dart';

class CheckingForRestButtonWidget extends StatelessWidget {
  const CheckingForRestButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
      child: BlocConsumer<CheckForResetCubit, CheckForResetState>(
        listener: (context, state) {
          if (state is CheckingForResetLoaded) {
            GoRouter.of(context).pushReplacement(createPassPath);
          } else if (state is CheckingForResetFailure) {
            showSnack(
              context,
              message: state.message,
              backGroundColor: AppConsts.danger500,
            );
          }
        },
        builder: (context, state) {
          return Visibility(
            visible:  state is CheckingForResetLoading ? false : true,
            replacement: const LoadingWidget(),
            child: CustomButton(
              text: StringsEn.resetPass,
              onTap: context.read<CheckForResetCubit>().checkingForResetButton,
            ),
          );
        },
      ),
    );
  }
}
