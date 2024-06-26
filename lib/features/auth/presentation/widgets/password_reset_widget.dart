import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/auth/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/consts/style.dart';

class PasswordResetPageWidget extends StatelessWidget {
  const PasswordResetPageWidget({
    super.key,
    required this.hint,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        final cubit = context.read<ResetPasswordCubit>();
        return CustomTextFormField(
          perfixIcon: Image.asset(
            Assets.imagesLockPng,
            color: AppConsts.neutral500,
          ),
          hint: hint,
          suffixIcon: IconButton(
            onPressed: () => cubit.changeVisible(hint),
            icon: Icon(
              (hint == StringsEn.password
                      ? cubit.pass1Visible
                      : cubit.pass2Visible)
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
          ),
          obscureText: hint == StringsEn.password
              ? cubit.pass1Visible
              : cubit.pass2Visible,
          onChanged: (String? value) =>
              context.read<ResetPasswordCubit>().onChangeFields(
                    hint,
                    value!,
                  ),
        );
      },
    );
  }
}
