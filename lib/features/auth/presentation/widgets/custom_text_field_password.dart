import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFieldPassword extends StatelessWidget {
  const CustomTextFieldPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        LoginCubit readCubit = context.read<LoginCubit>();
        return CustomTextFormField(
          perfixIcon: const Icon(
            Icons.lock,
            color: AppConsts.neutral500,
          ),
          hint: StringsEn.password,
          suffixIcon: IconButton(
            onPressed: () => readCubit.changeVisible(),
            icon: Icon(
              readCubit.visible ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          obscureText: readCubit.visible,
          onChanged: (String? value) =>
              context.read<LoginCubit>().onChangeFields(
                    StringsEn.password,
                    value!,
                  ),
        );
      },
    );
  }
}
