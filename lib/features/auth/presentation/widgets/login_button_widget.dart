import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/small_loading_widget.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          // if(context.canPop()){
          //   GoRouter.of(context).pop();
          // }
          GoRouter.of(context).push(navPath);
        } else if (state is LoginFailure) {
          showSnack(
            context,
            message: state.message,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        return AspectRatio(
          aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
          child: Visibility(
            visible: state is LoginLoading ? false : true,
            replacement: const LoadingWidget(),
            child: CustomButton(
              text: StringsEn.login,
              styleText: AppConsts.style16.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).canvasColor,
              ),
              onTap: context.read<LoginCubit>().loginButton,
            ),
          ),
        );
      },
    );
  }
}
