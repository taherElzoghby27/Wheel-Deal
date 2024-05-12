import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/auth/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPassButtonWidget extends StatelessWidget {
  const ResetPassButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoaded) {
          GoRouter.of(context).pushReplacement(homePath);
        } else if (state is ResetPasswordFailure) {
          showSnack(
            context,
            message: state.message,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        return AspectRatio(
          aspectRatio: AppConsts.aspectRatioButtonAuth,
          child: Visibility(
            visible: state is ResetPasswordLoading ? false : true,
            replacement: const LoadingWidget(),
            child: CustomButton(
              text: StringsEn.createNewPassword,
              onTap: context.read<ResetPasswordCubit>().createPassButton,
            ),
          ),
        );
      },
    );
  }
}
