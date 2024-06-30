import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/features/profile/presentation/manager/verification_cubit/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../home/presentation/view_model/home_bloc/home_bloc.dart';

class VerificationButton extends StatelessWidget {
  const VerificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspectRatioButtonAuth,
      child: BlocListener<VerificationCubit, VerificationState>(
        listener: (context, state) {
          if (state.userVerificationState == RequestState.loaded) {
            GoRouter.of(context).push(verificationVerifyLoadingPath);
          } else if (state.userVerificationState == RequestState.failure) {
            showSnack(
              context,
              message: state.failureUserVerification,
              backGroundColor: AppConsts.danger500,
            );
          }
        },
        child: CustomButton(
          text: StringsEn.next,
          styleText: AppConsts.style16White.copyWith(
            fontWeight: FontWeight.w600,
          ),
          //onTap: () =>context.read<VerificationCubit>().userVerification(),
          onTap: ()=>GoRouter.of(context).pushReplacement(verificationVerifyLoadingPath),
        ),
      ),
    );
  }
}
