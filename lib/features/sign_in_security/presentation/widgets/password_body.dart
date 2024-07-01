import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/sign_in_security/presentation/controllers/sign_in_and_security_cubit/sign_in_security_cubit.dart';
import 'package:cars/features/sign_in_security/presentation/widgets/confirm_update_password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordBody extends StatelessWidget {
  const PasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          CustomTextFormField(
            hint: StringsEn.yourPassword,
            perfixIcon: const Icon(
              Icons.lock_outline,
              color: AppConsts.neutral500,
            ),
            controller: context.read<SignInSecurityCubit>().password,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          CustomTextFormField(
            hint: StringsEn.enterNewPass,
            perfixIcon: const Icon(
              Icons.lock_outline,
              color: AppConsts.neutral500,
            ),
            controller: context.read<SignInSecurityCubit>().newPassword,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          CustomTextFormField(
            hint: StringsEn.confirmNewPass,
            perfixIcon: const Icon(
              Icons.lock_outline,
              color: AppConsts.neutral500,
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.visibility_outlined,
                color: AppConsts.neutral500,
              ),
            ),
            controller: context.read<SignInSecurityCubit>().confirmPassword,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
          const ConfirmUpdatePasswordButton(),
        ],
      ),
    );
  }
}


