import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/auth/presentation/view_model/check_for_reset_cubit/check_for_reset_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/strings.dart';

class ResetPasswordComponent extends StatelessWidget {
  const ResetPasswordComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          perfixIcon: const Icon(
            Icons.email_outlined,
            color: AppConsts.neutral500,
          ),
          hint: StringsEn.email,
          onChanged: (String? value) =>
              context.read<CheckForResetCubit>().changeFields(
                    StringsEn.email,
                    value!,
                  ),
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio20on1,
        ),
        CustomTextFormField(
          perfixIcon: const Icon(
            Icons.person,
            color: AppConsts.neutral500,
          ),
          hint: StringsEn.age,
          onChanged: (String? value) =>
              context.read<CheckForResetCubit>().changeFields(
                    StringsEn.age,
                    value!,
                  ),
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio20on1,
        ),
        CustomTextFormField(
          perfixIcon: const Icon(
            Icons.phone,
            color: AppConsts.neutral500,
          ),
          hint: StringsEn.last3digitPhone,
          onChanged: (String? value) =>
              context.read<CheckForResetCubit>().changeFields(
                    StringsEn.phone,
                    value!,
                  ),
        ),
      ],
    );
  }
}
