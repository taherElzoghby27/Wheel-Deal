import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/sign_in_security/presentation/controllers/sign_in_and_security_cubit/sign_in_security_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes_page.dart';
import 'package:cars/core/theming/style.dart';

class ChangeEmailAddressButtonVerifyBlocConsumer extends StatelessWidget {
  const ChangeEmailAddressButtonVerifyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInSecurityCubit, SignInSecurityState>(
      listener: (context, state) {
        if (state is VerifyEmailLoaded) {
          GoRouter.of(context).push(verificationEmailPath);
        } else if (state is VerifyEmailFailure) {
          showSnack(
            context,
            message: state.message,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        return Visibility(
          replacement: const LoadingWidget(),
          visible: state is VerifyEmailLoading ? false : true,
          child: CustomButton(
            text: StringsEn.changeEmailAddressLabel,
            styleText: AppConsts.style16White.copyWith(
              fontWeight: FontWeight.w600,
            ),
            onTap: () async =>
                await context.read<SignInSecurityCubit>().verifyEmail(),
          ),
        );
      },
    );
  }
}
