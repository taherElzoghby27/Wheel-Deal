import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/sign_up_cubit/sign_up_cubit.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = context.read<SignUpCubit>();
        return CustomTextFormField(
          perfixIcon: const Icon(
            Icons.lock,
            color: AppConsts.neutral500,
          ),
          hint: hint,
          obscureText: hint == StringsEn.password
              ? cubit.visiblePass1
              : cubit.visiblePass2,
          suffixIcon: IconButton(
            onPressed: () => cubit.changeVisible(
              hint == StringsEn.password
                  ? StringsEn.password
                  : StringsEn.confirmNewPass,
            ),
            icon: Icon(
              (hint == StringsEn.password
                      ? cubit.visiblePass1
                      : cubit.visiblePass2)
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: AppConsts.neutral500,
            ),
          ),
          onChanged: (String? value) => cubit.onChangeValue(
            hint == StringsEn.password
                ? StringsEn.password
                : StringsEn.confirmNewPass,
            value!,
          ),
        );
      },
    );
  }
}
