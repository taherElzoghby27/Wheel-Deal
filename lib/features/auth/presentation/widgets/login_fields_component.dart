import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/consts/style.dart';
import 'custom_text_field_password.dart';
import 'remeber_me.dart';

class LoginFieldComponent extends StatelessWidget {
  const LoginFieldComponent({super.key});

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
              context.read<LoginCubit>().onChangeFields(
                    StringsEn.email,
                    value!,
                  ),
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio20on1,
        ),

        ///Password
        const CustomTextFieldPassword(),

        ///remeber me
        const RemeberMe(),
      ],
    );
  }
}
